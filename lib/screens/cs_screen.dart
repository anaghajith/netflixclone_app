// coming soon screen
import 'package:Netflixapp/api/api.dart';
import 'package:Netflixapp/constants.dart';
import 'package:Netflixapp/models/movie.dart';
import 'package:Netflixapp/screens/details_screen.dart';
import 'package:Netflixapp/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:Netflixapp/screens/home_screen.dart';

class CsScreen extends StatefulWidget {
  const CsScreen({super.key});

  @override
  State<CsScreen> createState() => _CsScreenState();
}

class _CsScreenState extends State<CsScreen> {
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            height: 40,
            child: Image.asset('assets/logo.jpg'),
          ),
        ],
        title: Text("Coming Soon"),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) => NavigationHelper.navigate(context, index),
        currentIndex: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SizedBox(
            child: FutureBuilder(
              future: upcomingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    movie: snapshot.data![index],
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                height: 350,
                                width: 100,
                                child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                  '${Constants.imagePath}${snapshot.data![index].posterPath}',
                                ),
                              ),
                            ),
                          ),
                        );
                        // snapshot: snapshot,
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
