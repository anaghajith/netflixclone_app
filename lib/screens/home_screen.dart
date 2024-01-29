import 'package:Netflixapp/api/api.dart';
import 'package:Netflixapp/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Netflixapp/models/movie.dart';
import 'package:Netflixapp/widgets/movies_slider.dart';
import 'package:Netflixapp/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Image.asset(
          'assets/netflixlogo.png',
          fit: BoxFit.cover,
          height: 50,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: "Search",),
          BottomNavigationBarItem(
              icon: Icon(Icons.upcoming_outlined), label: "Coming Soon"),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download_outlined), label: "Downloads"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "More"),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Top rated movies',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MoviesSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Upcoming movies',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MoviesSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onTap(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchScreen()),
      );
    }
  }
}
