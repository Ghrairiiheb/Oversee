import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';
import '../models/leave_request.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'les demandes de Congés',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 10,
        backgroundColor: Color.fromARGB(216, 5, 95, 231),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getAllLeaveRequests(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
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
                tileColor: Colors.grey[200], // Couleur de fond de la tuile
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Coins arrondis
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    request
                        .employeeId[0], // Première lettre de l'ID de l'employé
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  'Demande de ${request.employeeId} du ${request.startDate} au ${request.endDate}',
                  style: TextStyle(),
                ),
                subtitle: Text('État: ${request.status}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        FirestoreService()
                            .updateLeaveRequestStatus(request.id, 'accepted');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        FirestoreService()
                            .updateLeaveRequestStatus(request.id, 'rejected');
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
