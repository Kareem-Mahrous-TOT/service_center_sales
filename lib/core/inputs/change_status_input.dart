import 'package:equatable/equatable.dart';

class ChangeStatusInput extends Equatable {
  final String status;
  final int id;

  const ChangeStatusInput({required this.status, required this.id});

  @override
  List<Object?> get props => [status, id];
}
