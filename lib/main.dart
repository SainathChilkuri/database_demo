import 'package:database_demo/LoginBloc/login_bloc.dart';
import 'package:database_demo/Screens/Auth/signup_screen.dart';
import 'package:database_demo/Screens/CategoryScreen/category_screen.dart';
import 'package:database_demo/Screens/HomeScreen/home_screen.dart';
import 'package:database_demo/Session/login_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'Screens/Auth/login_screen.dart';
import 'SigninBloc/SignUpBloc.dart';


void main(){
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider
          (create: (context)=>LoginBloc()),
        BlocProvider
          (create: (context)=>SignUpBloc()),
      ],

      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Get.key,
      routes: {
        '/login':(context)=>LoginScreen(),
        '/signup':(context)=>SignUpScreen(),
        '/home':(context)=>HomeScreen(),
        '/category':(context)=>CategoryScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: Sessions.userLoggedin?HomeScreen():LoginScreen());
  }
}

