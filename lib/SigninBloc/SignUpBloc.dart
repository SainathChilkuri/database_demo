import 'package:database_demo/LoginBloc/login_events.dart';
import 'package:database_demo/LoginBloc/login_states.dart';
import 'package:database_demo/MyDatabase/database_helper.dart';
import 'package:database_demo/SigninBloc/SignUpEvents.dart';
import 'package:database_demo/SigninBloc/SignUpState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  SignUpBloc() : super(SignUpInitialState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if(event is SignUpClickEvent){
      var dbhelper = DatabaseHelper();
      var result = await dbhelper.insetData(event.user);
      if(result !=0){
        yield SignUpSuccessState(success: "Succesfully Registered");
      }else{
        yield SignUpFailedState(failed: "Failed to Register");
      }

    }
  }

}