import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String token;
  final String userId;
  final String userName;

  const LoginResponse({
    required this.token,
    required this.userId,
    required this.userName,
  });

  @override
  List<Object?> get props => [token, userId, userName];

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
    );
  }
}
