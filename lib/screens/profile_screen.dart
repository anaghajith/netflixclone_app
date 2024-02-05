import 'package:Netflixapp/screens/signin_screen.dart';
import 'package:Netflixapp/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  late String _displayName;
  late String _email;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    User? user = _auth.currentUser;

    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
      await _firestore.collection('users').doc(user.uid).get();

      setState(() {
        _user = user;
        _displayName = userDoc['name'];
        _email = user.email!;
      });
    }
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SigninScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) => NavigationHelper.navigate(context, index),
        currentIndex: 4,
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(
                  _displayName[0],
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name: $_displayName',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Email: $_email',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Settings'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('Notifications'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _signOut,
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
