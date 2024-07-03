import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestion_conge/pages/login.dart';
import 'package:gestion_conge/pages/splash.dart';
import 'pages/home_selection.dart';
import 'pages/employee_home.dart';
import 'pages/admin_home.dart';
import 'pages/leave_request_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBYPyXN__GI5tUEqnMSTWQ7z3DWj9E8c3g",
            authDomain: "gestion-conge-42c46.firebaseapp.com",
            projectId: "projetmobile2-42c46",
            storageBucket: "projetmobile2-42c46.appspot.com",
            messagingSenderId: "182442499395",
            appId: "1:182442499395:web:46648c5c49c7a797a7a3f6"));
  } else {
    Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de Congés',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: spalsh(),
      routes: {
        '/login':(context)=> Login(),
        '/home':(context) => HomeSelectionScreen(),
        '/admin': (context) => AdminHomeScreen(),
        '/employee': (context) => EmployeeHomeScreen(),
        '/new-leave-request': (context) => LeaveRequestForm(),
      },
    );
  }
}
