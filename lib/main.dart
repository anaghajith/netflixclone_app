import 'package:Netflixapp/colors.dart';
import 'package:Netflixapp/firebase_options.dart';
import 'package:Netflixapp/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflixapp',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        useMaterial3: true,
      ),
      home:  SigninScreen(),
    );
  }
}
