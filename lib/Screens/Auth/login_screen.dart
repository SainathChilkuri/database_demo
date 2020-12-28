import 'package:database_demo/Colors/colors.dart';
import 'package:database_demo/LoginBloc/login_bloc.dart';
import 'package:database_demo/LoginBloc/login_events.dart';
import 'package:database_demo/LoginBloc/login_states.dart';
import 'package:database_demo/Screens/HomeScreen/home_screen.dart';
import 'file:///D:/AndroidStudioProjects/database_demo/lib/Screens/Auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _useremail = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff616161),
        body: BlocListener<LoginBloc, LoginStates>(
          listener: (context, states) {
            if (states is LoginSuccessfulState) {
              /* Navigator.push(context,MaterialPageRoute(builder: (context){
                return HomeScreen();
              }));*/
              Get.off(HomeScreen());
            }
            if (states is LoginFailedState) {
              showSnackBar(states.errorMessage);
            }
          },
          child: Center(
            child: Form(
              key: _key,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                height: 350.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0)
                ),
                child: Card(
                  elevation: 15.0,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      useremail(),
                      password(),
                      submitButton(context),
                      forgetPassword(),
                      signup(context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  Widget useremail() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        controller: _useremail,
        validator: (value) {
          if (value.isEmpty) {
            return "Email is Required";
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: _decoration("Email",Icon(Icons.email_outlined,color: Colors.deepPurple,))
      ),
    );
  }

  Widget password() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        controller: _password,
        validator: (value) {
          if (value.isEmpty) {
            return "Password is Required";
          }
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: _decoration("Password",Icon(Icons.vpn_key_outlined,color: Colors.deepPurple,))

      /*  */
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_key.currentState.validate()) {
          _authenticate();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: CustomColors.gradient()
        ),
        margin: EdgeInsets.all(9.0),

        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),

      ),
    );
  }

  Widget forgetPassword() {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      child: GestureDetector(
        onTap: () {
          print("forgot Password");
        },
        child: Text(
          "Forgot Password?",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple
          ),
        ),
      ),
    );
  }

  Widget signup(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatetoSignScreen(context);
      },
      child: Text(
        "Sign Up",
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.deepPurple
        ),
      ),
    );
  }

  void showSnackBar(String msg) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("$msg"),
    ));
  }

  void _authenticate() {
    if (_useremail.text.contains("@gmail.com")) {
      BlocProvider.of<LoginBloc>(context).add(
          UserLogIn(email: _useremail.text, password: _password.text));
    } else {
      showSnackBar("Enter gmail correctly");
    }
  }

  void navigatetoSignScreen(BuildContext context) {
    Get.to(SignUpScreen());
  }

  InputDecoration _decoration(String text,dynamic icon) {
    return InputDecoration(
        filled: true,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.red)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.deepPurple)

        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: icon,
        labelText: text,
        labelStyle: TextStyle(
            color: CustomColors.labeltextColor
        )
    );
  }
}
