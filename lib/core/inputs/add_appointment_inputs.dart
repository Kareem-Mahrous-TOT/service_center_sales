import 'package:equatable/equatable.dart';

class AddAppointmentInputs extends Equatable {
  final String startTime;
  final String endTime;
  final String date;
  final String day;
  final String customerId;
  final String employeeId;

  const AddAppointmentInputs({
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.day,
    required this.customerId,
    required this.employeeId,
  });

  @override
  List<Object?> get props => [
        startTime,
        endTime,
        date,
        day,
        customerId,
        employeeId,
      ];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'day': day,
      'customerId': customerId,
      'employeeId': employeeId,
    };
  }
}
