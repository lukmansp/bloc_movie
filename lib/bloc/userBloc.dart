import 'package:bloc_mysql/model/UserResponse.dart';
import 'package:bloc_mysql/resources/apiProvider.dart';
import 'package:rxdart/rxdart.dart';

class UserListBloc {
  final UserApiProvider _repository = UserApiProvider();
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _id = BehaviorSubject<int>();

  final BehaviorSubject<UserResponse> _subject =
      BehaviorSubject<UserResponse>();

  BehaviorSubject<UserResponse> get subject => _subject;
  Function(String) get addName => _name.sink.add;
  Function(String) get addEmail => _email.sink.add;
  Function(String) get addPassword => _password.sink.add;
  Function(int) get addId => _id.sink.add;

  getUsers() async {
    UserResponse response = await _repository.getUsers();
    _subject.sink.add(response);
  }

  addUser() {
    _repository.addUser(_name.value, _email.value, _password.value);
  }

  editUser() {
    _repository.editUser(_id.value, _name.value, _email.value, _password.value);
  }

  deleteUser() {
    _repository.deleteUser(_id.value);
  }

  dispose() {
    _subject.close();
    _name.close();
    _email.close();
    _password.close();
    _id.close();
  }
}

final getUsers = UserListBloc();
