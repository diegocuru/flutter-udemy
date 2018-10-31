import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.fill,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Email field souldn\'t be empty and should be a valid email address';
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'E-Mail',
        filled: true,
        fillColor: Colors.white,
      ),
      onSaved: (String value) {
        _emailValue = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password field shouldn\'t be empty';
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: true,
      onSaved: (String value) {
        _passwordValue = value;
      },
    );
  }

  Widget _buildAcceptSwitchTile() {
    return SwitchListTile(
      title: const Text('Accept Terms'),
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print('User: ' + _emailValue + ', Password:' + _passwordValue);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(height: 8.0),
                    _buildPasswordTextField(),
                    _buildAcceptSwitchTile(),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      child: Text('LOGIN'),
                      textColor: Colors.white,
                      onPressed: _submitForm,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
