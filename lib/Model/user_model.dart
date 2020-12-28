
import 'package:equatable/equatable.dart';
class UserModel extends Equatable {
  int id;
  String fname;
  String lname;
  String gender;
  String email;
  int number;
  String password;

  UserModel({
    this.id,
    this.fname,
    this.lname,
    this.gender,
    this.email,
    this.number,
    this.password
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['firstname'] = this.fname;
    map['lastname'] = this.lname;
    map['gender'] = this.gender;
    map['email'] = this.email;
    map['number'] = this.number;
    map['password'] = this.password;
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.fname = map['firstname'];
    this.lname = map['lastname'];
    this.gender = map['gender'];
    this.email = map['email'];
    this.number = map['number'];
    this.password = map['password'];
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [
        this.id,
        this.fname,
        this.lname,
        this.gender,
        this.email,
        this.number,
        this.password
      ];
}