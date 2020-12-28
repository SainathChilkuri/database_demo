import 'package:database_demo/Colors/colors.dart';
import 'package:database_demo/Model/user_model.dart';
import 'package:database_demo/Screens/Auth/login_screen.dart';
import 'package:database_demo/Screens/CartScreen/cart_screen.dart';
import 'package:database_demo/Screens/CategoryScreen/category_screen.dart';
import 'package:database_demo/Screens/FavoritesScreen/favorites_screen.dart';
import 'package:database_demo/Screens/HomeScreen/home_screen.dart';
import 'package:database_demo/Screens/OrdersScreen/orders_screen.dart';
import 'package:database_demo/Session/login_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomDrawer extends StatefulWidget {

  final UserModel user;
  int selected;
  CustomDrawer({
    this.user,
    this.selected
  });
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  //int _selected = 0;
  UserModel users;
  @override
  Widget build(BuildContext context) {
    int _selected;
    int _remainSelected=0;
    setState(() {
       _selected= widget.selected;
      users = widget.user;
    });
    return Drawer(
      child: ListView(
        children: [
           UserAccountsDrawerHeader(
              decoration: BoxDecoration(

                gradient: CustomColors.gradient()
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  radius: 13.0,
                  child: Text(users.fname[0].toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0
                    ),),
                ),
              ),
                accountName: Text(users.fname + " " + users.lname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),),
                accountEmail: Text(users.email,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 15.0
                  ),)),
          Ink(
            color: _selected==1?Color(0xffec407a):Colors.white,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _selected = 1;
                  });
                  Get.off(HomeScreen());
                },
               /* selected: _selected==1,*/
                leading: Icon(Icons.home_rounded,color: Colors.deepPurple,),
                title: Text("Home"),
              )
          ),
          Ink(
              color: _selected==2?Color(0xffec407a):Colors.white,
              child: ListTile(
                onTap: (){

                  Navigator.popAndPushNamed(context,'/category');
                },
                /*selected: _selected==2,*/
                leading: Icon(Icons.info_outline,color: Colors.deepPurple,),
                title: Text("Category"),
              )
          ),
          Ink(
              color: _selected==3?Color(0xffec407a):Colors.white,
              child: ListTile(
                onTap: (){
                  /*setState(() {
                    _selected = 3;
                  });*/
                  Get.off(CartScreen());

                },
                /*selected: _selected==3,*/
                leading: Icon(Icons.add_shopping_cart,color: Colors.deepPurple,),
                title: Text("Cart"),
              )
          ),
          Ink(
              color: _selected==4?Color(0xffec407a):Colors.white,
            child: ListTile(
              onTap: (){
                /*setState(() {
                  _selected = 4;
                });*/
                Get.off(OrdersScreen());

              },
              /*selected: _selected==4,*/
              leading: Icon(Icons.shopping_bag_outlined,color: Colors.deepPurple,),
              title: Text("Orders"),
            )
        ),
          Ink(
              color: _selected==5?Color(0xffec407a):Colors.white,
              child: ListTile(
                onTap: (){
                  /*setState(() {
                    _selected = 5;
                  });*/
                  Get.off(FavoritesScreen());

                },
                //selected: _selected==5,
                leading: Icon(Icons.favorite_sharp,color: Colors.deepPurple,),
                title: Text("Favorites"),
              )
          ),

          Divider(color: Colors.deepPurple,),
          Ink(
              color: _remainSelected==6?Color(0xffec407a):Colors.white,
              child: ListTile(
                  onTap: (){
                    setState(() {
                    _remainSelected = 6;
                    });
                    showDialog(context: context,
                        builder:(BuildContext context){
                         return aboutDialg();
                        });
                  },
                //selected: _selected==6,
                leading: Icon(Icons.info_outline,color: Colors.deepPurple,),
                title: Text("About"),
              )
          ),
          Ink(
              color: _remainSelected==7?Color(0xffec407a):Colors.white,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _remainSelected = 7;
                  });
                  showDialog(context: context,
                  builder: (BuildContext context){
                    return _alertDialog();
                  });
                },
                //selected: _selected==7,
                leading: Icon(Icons.login_outlined,color: Colors.deepPurple,),
                title: Text("Logout"),
              )
          ),
        ],
      ),
    );
  }

  Widget _alertDialog() {
    return AlertDialog(
      title: Text("Sure to Logout?"),
      actions: [
        Row(
          children: [
            FlatButton(
                onPressed: (){
                  Sessions.clearData();
                  Get.off(LoginScreen());
                },
                child: Text("Yes")),
            FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("No")),
          ],
        )

      ],
    );
  }

  Widget aboutDialg() {
    return  AlertDialog(
      elevation: 9.0,
      title: Center(child: Text("About")),
      content:
      Text("This is a Shopping Demo \n App"),
      actions: [
        FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(
              "Dismiss",
              style: TextStyle(
                  color: Colors.purple
              ),
            ))
      ],
    );
  }
}
