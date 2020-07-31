import 'dart:async';
import 'dart:ui';

import 'package:bloc_mysql/model/UserResponse.dart';
import 'package:bloc_mysql/ui/createUser.dart';
import 'package:bloc_mysql/ui/editUser.dart';
import 'package:flutter/material.dart';
import 'package:bloc_mysql/bloc/userBloc.dart';
import 'package:bloc_mysql/model/userModels.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // Timer _timer;
  String _selectedItem;
  static const menuItem = <String>["edit", "hapus"];
  final List<PopupMenuItem<String>> _popupmenuitems = menuItem
      .map((String val) => PopupMenuItem<String>(
            value: val,
            child: Text(val),
          ))
      .toList();
  String nama = "nama";
  void initState() {
    super.initState();
    getUsers.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[200],
          title: Center(
            child: Text("User profile"),
          ),
        ),
        body: StreamBuilder<UserResponse>(
          stream: getUsers.subject.stream,
          builder: (context, AsyncSnapshot<UserResponse> snapshot) {
            if (snapshot.hasData) {
              return _buildHomeWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(
                child: Text("no data found"),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Create(),
                ));
          },
          child: Icon(Icons.add),
        ));
  }

  Widget _buildHomeWidget(UserResponse data) {
    List<Result> users = data.users;
    if (users.length == 0) {
      return Container(
        child: Center(
          child: Text("No data found"),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, i) {
            return ListTile(
                trailing: PopupMenuButton(
                  itemBuilder: (context) => _popupmenuitems,
                  onSelected: (String val) {
                    _selectedItem = val;
                    if (_selectedItem == 'edit') {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditUser(
                              id: users[i].id,
                              name: users[i].name,
                              email: users[i].email,
                              password: users[i].password)));
                    } else {
                      getUsers.addId(users[i].id);
                      getUsers.deleteUser();
                      getUsers.getUsers();
                      print('deelete');
                    }
                  },
                ),
                title: Text(users[i].name),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('email : ${users[i].email}'),
                    Text('Role')
                  ],
                ));
          });
    }
    // else {
    //   return Container(
    //     decoration: BoxDecoration(color: Colors.white),
    //     child: ListView.builder(
    //         itemCount: users.length,
    //         itemBuilder: (context, i) {
    //           return GestureDetector(

    //             onTap: () {
    //               Alert(
    //                 context: context,
    //                 type: AlertType.warning,
    //                 title: users[i].name,
    //                 desc: "Choose what you want todo",
    //                 buttons: [
    //                   DialogButton(
    //                     child: Text(
    //                       "Edit",
    //                       style: TextStyle(color: Colors.white, fontSize: 20),
    //                     ),
    //                     onPressed: () => Navigator.of(context).push(
    //                         new MaterialPageRoute(
    //                             builder: (BuildContext context) => EditUser(
    //                                 id: users[i].id,
    //                                 name: users[i].name,
    //                                 email: users[i].email,
    //                                 password: users[i].password))),
    //                     gradient: LinearGradient(colors: [
    //                       Colors.orange[600],
    //                       Colors.yellow[700],
    //                     ]),
    //                   ),
    //                   DialogButton(
    //                     child: Text(
    //                       "Delete",
    //                       style: TextStyle(color: Colors.white, fontSize: 20),
    //                     ),
    //                     onPressed: () => Navigator.pop(context),
    //                     gradient: LinearGradient(
    //                         colors: [Colors.red, Colors.red[300]]),
    //                   )
    //                 ],
    //               ).show();
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   Text(
    //                     users[i].name,
    //                     style: new TextStyle(fontSize: 15.0),
    //                   ),
    //                   Text(users[i].email),
    //                 ],
    //               ),
    //             ),
    //           );
    //         }),
    //   );
    // }
  }
}
