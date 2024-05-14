import 'package:equatable/equatable.dart';

class ByIdInputs extends Equatable {
  final int id;

  const ByIdInputs({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
