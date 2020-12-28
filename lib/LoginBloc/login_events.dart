import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvents extends Equatable {
}
class UserLogIn extends LoginEvents{
  final email;
  final password;
  UserLogIn({
    @required this.email,
    @required this.password
  }):assert(email!=null && password !=null);
  @override
  // TODO: implement props
  List<Object> get props => [email,password];
}
class ForgetPassword extends LoginEvents{

  @override
  // TODO: implement props
  List<Object> get props => [];

}
class LoginSignUpEvent extends LoginEvents{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

