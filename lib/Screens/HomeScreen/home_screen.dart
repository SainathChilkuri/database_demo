import 'package:database_demo/LoginBloc/login_bloc.dart';
import 'package:database_demo/LoginBloc/login_events.dart';
import 'package:database_demo/LoginBloc/login_states.dart';
import 'package:database_demo/Model/user_model.dart';
import 'package:database_demo/Screens/Components/custom_drawer.dart';
import 'package:database_demo/Session/login_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
Future<UserModel> user = Sessions.getData();
UserModel mUser;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    user.then((value) {
      setState(() {
        mUser=value;
      });
    });
  }
  final _scaffoldkey =GlobalKey<ScaffoldState>();
  //Future<UserModel> user = Sessions.getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(

      ),
      drawer: CustomDrawer(user: mUser,selected: 1,),
      body: Column(
        children: [

        ],

    ));


  }
}

