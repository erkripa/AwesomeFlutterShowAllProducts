import 'package:awesom/uTils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  final _formkey = GlobalKey<FormState>();

// Method
  moveToHome(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Container(
          // color: context.canvasColor,
          child: Container(
            color: context.backgroundColor,
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Image.asset(
                    "assest/images/login_image.png",
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                  // SizedBox(
                  //   height: 0.0,
                  //   // child: Text("Hello"),
                  // ),
                  Text(
                    "Welcome $name",
                    style: TextStyle(
                      fontSize: 26,
                      color: context.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter UserName",
                            labelText: "UserName",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "username can not be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {}); //it called build method again
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "password can not be empty";
                            } else if (value.length < 6) {
                              return "password must be atleast 6";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: () =>
                        moveToHome(context), //when click on login button
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 40,
                      width: changedButton ? 100 : 300,
                      // color: Colors.green,
                      alignment: Alignment.center,
                      child: changedButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                      decoration: BoxDecoration(
                        // shape: changedButton ? BoxShape.circle : BoxShape.rectangle,
                        color: context.theme.buttonColor,
                        borderRadius:
                            BorderRadius.circular(changedButton ? 50 : 8),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: Text(
                  //     "Login",
                  //     style: TextStyle(fontSize: 18),
                  //   ),
                  //   style: TextButton.styleFrom(minimumSize: Size(300, 40)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
