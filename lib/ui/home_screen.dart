import 'package:flutter/material.dart';
import 'package:netflix_odev6/models/movie.dart';
import 'package:netflix_odev6/ui/movie_detail_screen.dart';
import '../data/dummy_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final popularMovies = dummyMovies.sublist(0, 4);
    final newReleases = dummyMovies.sublist(4, 8);
    final comedyMovies = dummyMovies.sublist(8, 12);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Netflix Clone',style: TextStyle(color: Colors.red),),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.red),
        elevation: 0,

      ),
      body: ListView(
        children: [
          buildBanner(context,dummyMovies[1]),
          buildCategory('Popüler Filmler', popularMovies),
          buildCategory('Yeni Çıkanlar', newReleases),
          buildCategory('En Çok Arananlar', comedyMovies),
        ],
      ),
    );
  }

  Widget buildBanner(BuildContext context, movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)));
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 220,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(movie.imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(16),
        child: Text(
          "En Çok Izlenen : ${movie.title}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.black54,
          ),
        ),
      ),
    );
  }


  Widget buildCategory(String title, List movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)));
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        movie.imageUrl,
                        height: 160,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.title,
                        style: const TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
