import 'package:flutter/material.dart';

class Form_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return From_page_state();
  }
}

class From_page_state extends State<StatefulWidget>{
  String? _name;
  String _email;
  String _password;
  String _phone;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }
  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }
  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }
  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: Text('Registration'),),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _buildPhoneNumber(),
              SizedBox(height: 100,),
              RaisedButton(
                child: Text('Submit', style: TextStyle(fontSize: 16),),
                onPressed: () => {
                  if(!formKey.currentContext.validate()){
                    return;
                  }
                  formKey.currentState.save();

                  print(_name);
                  print(_email);
                  print(_password)
                  print(_phone)
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}