import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firestore_service.dart';

class LeaveRequestForm extends StatefulWidget {
  @override
  _LeaveRequestFormState createState() => _LeaveRequestFormState();
}

class _LeaveRequestFormState extends State<LeaveRequestForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? 'user123';
      int daysRequested = _endDate!.difference(_startDate!).inDays + 1;
      bool hasSufficientDays = await FirestoreService()
          .checkEmployeeLeaveBalance(userId, daysRequested);

      if (hasSufficientDays) {
        FirestoreService()
            .createLeaveRequest(userId, _startDate!, _endDate!, daysRequested);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Vous n\'avez pas suffisamment de jours de congé.'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nouvelle Demande de Congé',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 10,
        backgroundColor: Color.fromARGB(216, 5, 95, 231),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Date de début'),
                onTap: () async {
                  _startDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  setState(() {});
                },
                readOnly: true,
                validator: (value) {
                  if (_startDate == null)
                    return 'Veuillez choisir une date de début';
                  return null;
                },
                controller: TextEditingController(
                    text: _startDate != null
                        ? _startDate!.toLocal().toString().split(' ')[0]
                        : ''),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date de fin'),
                onTap: () async {
                  _endDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  setState(() {});
                },
                readOnly: true,
                validator: (value) {
                  if (_endDate == null)
                    return 'Veuillez choisir une date de fin';
                  return null;
                },
                controller: TextEditingController(
                    text: _endDate != null
                        ? _endDate!.toLocal().toString().split(' ')[0]
                        : ''),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15), 
                  textStyle: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bordure arrondie
                  ),
                ),
                child: Text('Soumettre',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
