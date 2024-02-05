import 'package:Netflixapp/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  int _selectedIndex = 0;

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text))
        .user;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': nameController.text,
        'email': emailController.text,
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SigninScreen()));
    }
  }

  void _signIn() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text))
        .user;
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    emailController.text = "";

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          signIn(),
          signUp(),
        ],
      ),
    );
  }

  Widget signIn() {
    return Container(
      padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/netflixlogo.png", width: 200)),
          SizedBox(height: 60),
          TextField(
            controller: emailController,
            autocorrect: false,
            autofocus: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              labelText: 'Email',
              floatingLabelStyle: TextStyle(color: Colors.black),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            autocorrect: false,
            autofocus: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              labelText: 'Password',
              floatingLabelStyle: TextStyle(color: Colors.black),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  side: BorderSide(width: 1, color: Colors.grey),
                ),
                onPressed: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                  if (email.isEmpty || password.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Error"),
                          content:
                          Text("Please enter your email and password"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context,
                                    rootNavigator: true)
                                    .pop('dialog'),
                                child: Text("ok"))
                          ],
                        ));
                    return;
                  }
                  _signIn();
                },
                child: Text(
                  "SignIn",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
              child: Text(
                "Dont have an account? SignUp",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              }),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            child: Text(
              "Forget your password?",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget signUp() {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logo.png",
              width: 200,
            ),
          ),
          SizedBox(height: 60),
          TextField(
            controller: nameController,
            autocorrect: false,
            autofocus: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              labelText: 'Name',
              floatingLabelStyle: TextStyle(color: Colors.black),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: emailController,
            autocorrect: false,
            autofocus: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              labelText: 'Email',
              floatingLabelStyle: TextStyle(color: Colors.black),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: passwordController,
            obscureText: true,
            autocorrect: false,
            autofocus: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              labelText: 'Password',
              floatingLabelStyle: TextStyle(color: Colors.black),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  side: BorderSide(width: 1, color: Colors.grey),
                ),
                onPressed: () {
                  final name = nameController.text;
                  final email = emailController.text;
                  final password = passwordController.text;
                  if (email.isEmpty || password.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Error"),
                          content:
                          Text("Please enter your email and password"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context,
                                    rootNavigator: true)
                                    .pop('dialog'),
                                child: Text("ok"))
                          ],
                        ));
                    return;
                  }
                  _register();
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
              child: Text(
                "Forget password",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {}),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
              child: Text(
                "Already have an account? SignIn",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              }),
        ],
      ),
    );
  }
}
