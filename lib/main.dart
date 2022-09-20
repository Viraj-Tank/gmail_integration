import 'package:flutter/material.dart';
import 'package:gmail_integration/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gmail_integration/utils/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Integration',
      home: AuthService().handleAuthState(),
    );
  }
}
