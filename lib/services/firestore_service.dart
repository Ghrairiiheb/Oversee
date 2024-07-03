import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getLeaveRequestsForEmployee(String employeeId) {
    return _db
        .collection('leaveRequests')
        .where('employeeId', isEqualTo: employeeId)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllLeaveRequests() {
    return _db.collection('leaveRequests').snapshots();
  }

  Future<void> createLeaveRequest(String employeeId, DateTime startDate,
      DateTime endDate, int daysRequested) async {
    await _db.collection('leaveRequests').add({
      'employeeId': employeeId,
      'startDate': startDate,
      'endDate': endDate,
      'daysRequested': daysRequested,
      'status': 'pending',
    });
  }

  Future<void> updateLeaveRequestStatus(String requestId, String status) async {
    await _db
        .collection('leaveRequests')
        .doc(requestId)
        .update({'status': status});
  }

  Future<bool> checkEmployeeLeaveBalance(
      String employeeId, int daysRequested) async {
    final employeeLeaves = await _db
        .collection('leaveRequests')
        .where('employeeId', isEqualTo: employeeId)
        .where('status', isEqualTo: 'accepted')
        .get();

    int usedLeaves = employeeLeaves.docs
        .fold<int>(0, (sum, doc) => sum + (doc['daysRequested'] as int));

    int initialLeaveBalance =
        30; // Assuming the initial leave balance is 30 days
    int remainingLeaveBalance = initialLeaveBalance - usedLeaves;

    return remainingLeaveBalance >= daysRequested;
  }
}
