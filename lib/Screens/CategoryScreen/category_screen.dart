
import 'package:database_demo/Model/user_model.dart';
import 'package:database_demo/Screens/Components/custom_drawer.dart';
import 'package:database_demo/Session/login_session.dart';
import 'package:flutter/material.dart';
class CategoryScreen extends StatefulWidget {

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
  final _scaffoldKeycategory = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: CustomDrawer(user:mUser,selected: 2),
      body: Column(
        children: [
          SafeArea(
            child: Text("saii")
          )
        ],
      ),
    );
  }
}
