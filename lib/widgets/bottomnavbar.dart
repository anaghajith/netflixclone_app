import 'package:Netflixapp/screens/cs_screen.dart';
import 'package:Netflixapp/screens/downloads_screen.dart';
import 'package:Netflixapp/screens/home_screen.dart';
import 'package:Netflixapp/screens/profile_screen.dart';
import 'package:Netflixapp/screens/search_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onTap;

  BottomNavBar({required this.onTap, required int currentIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.white70,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.upcoming_outlined),
          label: "Coming Soon",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_download_outlined),
          label: "Downloads",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}

class NavigationHelper {
  static void navigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CsScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DownloadsScreen()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        default:

    }
  }
}
