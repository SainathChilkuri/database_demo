import 'package:database_demo/LoginBloc/login_events.dart';
import 'package:database_demo/LoginBloc/login_states.dart';
import 'package:database_demo/Model/user_model.dart';
import 'package:database_demo/MyDatabase/database_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc() : super(InitialState());

  @override
  Stream<LoginStates> mapEventToState(LoginEvents event) async* {
    if(event is UserLogIn){
      yield LoginLoadingState();
      DatabaseHelper db = DatabaseHelper();
      int result = await db.authenticateUser(event.email,event.password);
      if(result == 1){
        yield LoginSuccessfulState();
      }else{
        yield LoginFailedState(errorMessage: "Failed");
      }

    }
  }

}