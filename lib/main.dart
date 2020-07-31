import 'package:bloc_mysql/bloc/authentication/authentication_bloc.dart';
import 'package:bloc_mysql/bloc/authentication/authentication_event.dart';
import 'package:bloc_mysql/bloc/authentication/authentication_state.dart';
import 'package:bloc_mysql/resources/repository.dart';
import 'package:bloc_mysql/ui/home_screen.dart';
import 'package:bloc_mysql/ui/login/login_screen.dart';
import 'package:bloc_mysql/ui/myhome.dart';
import 'package:flutter/material.dart';
import 'resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_mysql/bloc/simple_bloc_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter crud bloc",
      theme: ThemeData(primaryColor: Colors.black),
      home: MyHome(),
    );
  }
}
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final UserRepository _userRepository = UserRepository();
//   AuthenticationBloc _authenticationBloc;

//   @override
//   void initState() {
//     super.initState();
//     _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
//     _authenticationBloc.dispatch(AppStarted());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       bloc: _authenticationBloc,
//       child: MaterialApp(
//         home: BlocBuilder(
//           bloc: _authenticationBloc,
//           builder: (BuildContext context, AuthenticationState state) {
//             if (state is Unauthenticated) {
//               return LoginScreen(userRepository: _userRepository);
//             }
//             if (state is Authenticated) {
//               return HomeScreen2(name: state.displayName);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
