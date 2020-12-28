import 'package:database_demo/Colors/colors.dart';
import 'package:database_demo/Model/user_model.dart';
import 'package:database_demo/Screens/Auth/login_screen.dart';
import 'package:database_demo/SigninBloc/SignUpBloc.dart';
import 'package:database_demo/SigninBloc/SignUpEvents.dart';
import 'package:database_demo/SigninBloc/SignUpState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
enum Gender{male,female,other}
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var gender = Gender.male;
  TextEditingController _userFirstname = TextEditingController();
  TextEditingController _userlastName = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneno = TextEditingController();
  final _signupkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      body: Form(
        key: _signupkey,
          child: BlocListener<SignUpBloc,SignUpState>(
            listener: (context,state){
              if(state is SignUpSuccessState){
                return showSnackBar(context,state.success);
              }
            },
            child: ListView(
              children: [
                userfirstName(),
                userLastName(),
                genderofUser(),
                userEmail(),
                userPhoneNumber(),
                userpassword(),
                userConfirmPassword(),
                signUp(context),
                loginUser(context),

              ],
            ),
          ),
        ),
    );
  }

  Widget userfirstName() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        controller: _userFirstname,
        validator: (value){
          if(value.isEmpty){
            return "Firstname is Required";
          }
        },
        keyboardType: TextInputType.text,
        decoration:  _decorations("Firstname",Icon(Icons.drive_file_rename_outline,  color: Colors.deepPurple,))
      ),
    );
  }

  Widget userLastName() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        controller: _userlastName,
        validator: (value){
          if(value.isEmpty){
            return "Lastname is Required";
          }
        },
        keyboardType: TextInputType.text,
        decoration: _decorations("Lastname",Icon(Icons.drive_file_rename_outline,  color: Colors.deepPurple,))
      ),
    );
  }

 Widget userEmail() {
   return Container(
     margin: EdgeInsets.all(9.0),
     child: TextFormField(
       controller: _email,
       validator: (value){
         if(value.isEmpty){
           return "email is Required";
         }
       },
       keyboardType: TextInputType.emailAddress,
       decoration: _decorations("Email",Icon(Icons.email_outlined,  color: Colors.deepPurple,))
     ),
   );
 }

  Widget userPhoneNumber() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        controller: _phoneno,
        validator: (value){
          if(value.isEmpty){
            return "PhoneNo is Required";
          }
        },
        keyboardType: TextInputType.number,
        decoration: _decorations("Phone No",Icon(Icons.phone,  color: Colors.deepPurple,))
      ),
    );
  }

  Widget userpassword() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        controller: _password,
        validator: (value){
          if(value.isEmpty){
            return "Password is Required";
          }
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: _decorations("Password",Icon(Icons.lock_outlined,  color: Colors.deepPurple,))
      ),
    );
  }

  Widget userConfirmPassword() {
    return Container(
      margin: EdgeInsets.all(9.0),
      child: TextFormField(
        controller: _confirmpassword,
        validator: (value){
          if(value.isEmpty){
            return "Confirm the password";
          }
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: _decorations("Confirm Password",Icon(Icons.lock_outline_rounded,  color: Colors.deepPurple,))
      ),
    );
  }
  Widget signUp(BuildContext context) {
    return InkWell(
      onTap: (){
        if(_signupkey.currentState.validate()){
          _validatePasswords(context);

        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: CustomColors.gradient(),
        ),
        margin: EdgeInsets.all(9.0),

        child: Text(
          "Signup",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),

      ),
    );
  }

  Widget genderofUser() {
    return Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
             leading: Radio(
               activeColor: Colors.deepPurple,
              value: Gender.male,
              groupValue: gender,
              onChanged: (Gender value){
                setState(() {
                  gender = value;
                });
              },
            ),
            title: Text("Male"),
          ),
           ListTile(
            leading: Radio(
              activeColor: Colors.deepPurple,
              value: Gender.female,
              groupValue: gender,
              onChanged: (Gender value){
                setState(() {
                  gender = value;
                });
              },
            ),
            title: Text("Female"),
          ),
          ListTile(
            leading: Radio(
              activeColor: Colors.deepPurple,
              value: Gender.other,
              groupValue: gender,
              onChanged: (Gender value){
                setState(() {
                  gender = value;
                });
              },
            ),
            title: Text("Other"),
          ),

        ],
      );
  }

  Widget loginUser(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an Account? "
        ),
        InkWell(
          onTap: (){
            Get.back();
          },
          child: Text("Login",style:
            TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline
            ),),
        )
      ],
    );
  }
  void _validatePasswords(BuildContext context) {
    if(_password.text == _confirmpassword.text){
      print("clicked");
      print("${_userFirstname.text}, ${ gender.toString()}, ${int.parse(_phoneno.text)}");
      UserModel user = UserModel(fname: _userFirstname.text,lname: _userlastName.text,gender: gender.toString(),email: _email.text,number:int.parse(_phoneno.text),password: _password.text);
      BlocProvider.of<SignUpBloc>(context).add(SignUpClickEvent(user: user));
    }else{
      _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("PassWord Mismtached")));
    }
  }

  InputDecoration _decorations(String text, Icon icon) {
    return InputDecoration(
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

 showSnackBar(BuildContext context, success) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text(success),));
}



