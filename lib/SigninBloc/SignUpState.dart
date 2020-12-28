import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignUpState extends Equatable{

}
class SignUpInitialState extends SignUpState{
  @override
  List<Object> get props => [];

}
class SignUpSuccessState extends SignUpState{
  final success;
  SignUpSuccessState({@required this.success}): assert(success!=null);
  @override
  List<Object> get props => [];

}
class SignUpFailedState extends SignUpState{
  final failed;
  SignUpFailedState({@required this.failed}): assert(failed!=null);
  @override
  List<Object> get props => [];

}