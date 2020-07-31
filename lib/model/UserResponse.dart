import 'package:bloc_mysql/model/userModels.dart';

class UserResponse {
  final List<Result> users;
  final String error;
  UserResponse(this.users, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : users = (json["result"] as List)
            .map((i) => new Result.fromJson(i))
            .toList(),
        error = "";

  UserResponse.withError(String errorValue)
      : users = List(),
        error = errorValue;
}
