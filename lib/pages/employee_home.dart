import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestion_conge/models/leave_request.dart';
import 'package:gestion_conge/services/firestore_service.dart';

class EmployeeHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'user123';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes Congés',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 10,
        backgroundColor: Color.fromARGB(216, 5, 95, 231),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getLeaveRequestsForEmployee(userId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          var requests = snapshot.data!.docs
              .map((doc) => LeaveRequest.fromSnapshot(doc))
              .toList();
          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              var request = requests[index];
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                tileColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    request.employeeId[0],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                    'Demande du ${request.startDate} au ${request.endDate}'),
                subtitle: Text('État: ${request.status}'),
              );
            },
          );
          
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new-leave-request');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
