import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginStates extends Equatable{
}
class InitialState extends LoginStates{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}
class LoginLoadingState extends LoginStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class LoginSuccessfulState extends LoginStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoginFailedState extends LoginStates{
  final errorMessage;
  LoginFailedState({@required this.errorMessage}):assert(errorMessage!=null);
  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}
class loginSignUpState extends LoginStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}