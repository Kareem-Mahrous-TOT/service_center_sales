import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String accessToken;

  const LoginResponse({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] as String,
    );
  }
}
