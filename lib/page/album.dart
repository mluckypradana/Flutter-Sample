import 'package:flutter/material.dart';
import 'package:startupnamer/data/album.dart';
import 'package:startupnamer/repo/album.dart' as albumRepo;

// #docregion MyApp
class AlbumPage extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: AlbumWidget(),
    );
  }
// #enddocregion build
}

class AlbumWidget extends StatefulWidget {
  @override
  AlbumState createState() => AlbumState();
}

class AlbumState extends State<AlbumWidget> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = albumRepo.fetchAlbum();
    FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.title);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

}
// #enddocregion MyApp