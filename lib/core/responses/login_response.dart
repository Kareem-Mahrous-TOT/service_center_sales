import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String accessToken;
  final String userId;

  const LoginResponse({
    required this.accessToken,
    required this.userId,
  });

  @override
  List<Object?> get props => [accessToken, userId];

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] as String,
      userId: json['userId'] as String,
    );
  }
}
