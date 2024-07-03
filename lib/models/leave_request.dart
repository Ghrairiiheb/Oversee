import 'package:cloud_firestore/cloud_firestore.dart';

class LeaveRequest {
  final String id;
  final String employeeId;
  final DateTime startDate;
  final DateTime endDate;
  final int daysRequested;
  final String status;

  LeaveRequest({
    required this.id,
    required this.employeeId,
    required this.startDate,
    required this.endDate,
    required this.daysRequested,
    required this.status,
  });

  factory LeaveRequest.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return LeaveRequest(
      id: snapshot.id,
      employeeId: data['employeeId'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      daysRequested: data['daysRequested'],
      status: data['status'],
    );
  }
}
