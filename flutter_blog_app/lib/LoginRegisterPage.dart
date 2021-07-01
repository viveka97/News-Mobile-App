import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _LoginRegisterPage();
  }
}

enum FormType { login, register }

class _LoginRegisterPage extends State<LoginRegisterPage> {
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";

//methods

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void moveToRegister() {
    formKey.currentState!.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState!.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

//Design
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(
          child: new Text("Flutter News App"),
        ),
      ),
      body: new Container(
        margin: EdgeInsets.all(15.0),
        child: new Form(
            key: formKey,
            child: new Column(
              children: createInputs() + createButtons(),
            )),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 20.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) {
          return value!.isEmpty ? 'Email is required.' : null;
        },
        onSaved: (value) => _email,
      ),
      SizedBox(
        height: 10.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) {
          return value!.isEmpty ? 'Password is required.' : null;
        },
        onSaved: (value) => _password,
      ),
      SizedBox(
        height: 10.0,
      ),
    ];
  }

  Widget logo() {
    return new Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 110.0,
        child: Image.asset('images/Logo.png'),
      ),
    );
  }

  List<Widget> createButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          color: Colors.indigo,
          onPressed: validateAndSave,
        ),
        new FlatButton(
          child: new Text("Not have an Account? Create Account",
              style: new TextStyle(fontSize: 14.0)),
          textColor: Colors.indigo,
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        new RaisedButton(
          child:
              new Text("Create Account", style: new TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          color: Colors.indigo,
          onPressed: validateAndSave,
        ),
        new FlatButton(
          child: new Text("Already have an Account? Login",
              style: new TextStyle(fontSize: 14.0)),
          textColor: Colors.indigo,
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
