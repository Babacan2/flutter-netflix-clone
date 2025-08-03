import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  Movie movie;
  MovieDetailScreen({required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.movie.title,style: const TextStyle(color: Colors.red),),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.red),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                width: 328,
                height: 328,
                widget.movie.imageUrl),
            const SizedBox(height: 50),
            Text(widget.movie.description,
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.movie.year,style: const TextStyle(fontSize: 18,color: Colors.white),),
                Text(widget.movie.genre,style: const TextStyle(fontSize: 18,color: Colors.white),)
              ],
            ),
            const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                    ),
                    icon: Icon(Icons.play_arrow),
                    label: const Text("Oynat"),
                ),
                ElevatedButton.icon(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16)
                    ),
                    icon: Icon(Icons.download),
                    label: const Text("İndir"),

                ),
              ]
            )

          ],
        ),
      ),
    );
  }
}
