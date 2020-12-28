import 'package:database_demo/Model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignUpEvent extends Equatable{

}
class SignUpClickEvent extends SignUpEvent{
  UserModel user;
  SignUpClickEvent({@required this.user}): assert(user!=null);
  @override
  // TODO: implement props
  List<Object> get props => [user];
}
class SignUpLoginEvent extends SignUpEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}