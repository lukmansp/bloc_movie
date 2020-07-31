import 'package:flutter/material.dart';
import 'package:bloc_mysql/bloc/userBloc.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  String nama = 'nama';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              onChanged: getUsers.addName,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input name here'),
            ),
            TextField(
              onChanged: getUsers.addEmail,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input email here'),
            ),
            TextField(
              onChanged: getUsers.addPassword,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input password here'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () async {
                await getUsers.addUser();
                getUsers.getUsers();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
