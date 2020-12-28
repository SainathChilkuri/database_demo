import 'package:database_demo/Model/user_model.dart';
import 'package:database_demo/Screens/Components/custom_drawer.dart';
import 'package:database_demo/Session/login_session.dart';
import 'package:flutter/material.dart';
class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<UserModel> user = Sessions.getData();
  UserModel mUser;
  void initState() {
    // TODO: implement initState
    super.initState();
    user.then((value) {
      setState(() {
        mUser=value;
      });
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: CustomDrawer(user:mUser,selected: 3,),
      body: Column(
        children: [

        ],
      ),
    );
  }
}