import 'package:flutter/material.dart';
import 'package:bloc_mysql/bloc/userBloc.dart';

class EditUser extends StatefulWidget {
  final String name, email, password;
  final int id;

  const EditUser({this.name, this.email, this.password, this.id});
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _name = new TextEditingController();
  final _email = new TextEditingController();
  final _password = new TextEditingController();
  void setFormValue() {
    _name.text = widget.name;
    _email.text = widget.email;
    _password.text = widget.password;
  }

  void initState() {
    getUsers.addId(widget.id);
    setFormValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.name);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit User " + widget.name),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _name,
              onChanged: getUsers.addName,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input name here'),
            ),
            TextField(
              controller: _email,
              onChanged: getUsers.addEmail,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input email here'),
            ),
            TextField(
              controller: _password,
              onChanged: getUsers.addPassword,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Input password here'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () async {
                getUsers.editUser();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            )
          ],
        )),
      ),
    );
  }
}
