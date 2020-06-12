import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Widget')),
      body: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.blue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFieldWidget(),
              SizedBox(
                height: 60,
              ),
              RegisterFormWidget()
            ],
          )),
    );
  }
}

// 输入控件
class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      debugPrint("input text: ${controller.text}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        debugPrint("your input is : $value");
      },
      onSubmitted: (value) {
        debugPrint("your submit is : $value");
      },
      decoration: InputDecoration(
          icon: Icon(Icons.account_circle),
          labelText: "username",
          hintText: "please input something.",
//          border: InputBorder.none,
          border: OutlineInputBorder(),
          filled: true),
    );
  }
}

// 表单控件
class RegisterFormWidget extends StatefulWidget {
  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final globalKey = GlobalKey<FormState>();
  String username, password;
  bool validate = false;

  void _performRegister() {
    if (globalKey.currentState.validate()) {
      globalKey.currentState.save();

      debugPrint("username: $username");
      debugPrint("password: $password");

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Register Success")));
    } else {
      setState(() {
        validate = true;
      });
    }
  }

  String _validate(String value) {
    if (value.isEmpty) {
      return "Value is required.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Form(
          key: globalKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Username"),
                onSaved: (value) {
                  username = value;
                },
                validator: _validate,
                autovalidate: validate,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                onSaved: (value) {
                  password = value;
                },
                autovalidate: validate,
                validator: _validate,
              ),
              SizedBox(height: 24.0),
              Container(
                width: double.infinity,
                child: RaisedButton(
                    child: Text("Register"),
                    onPressed: () {
                      _performRegister();
                    }),
              )
            ],
          )),
    );
  }
}
