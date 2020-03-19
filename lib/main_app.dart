import 'package:flutter/material.dart';
import 'package:startupnamer/page/album.dart';
import 'package:startupnamer/page/startup_namer.dart';
void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Project',
      home: MainWidget(),
    );
  }
// #enddocregion build
}

class MainWidget extends StatefulWidget {
  @override
  MainState createState() => new MainState();
}

// #docregion RWS-var
class MainState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildLayout(),
    );
  }

  _buildLayout() {
    return SizedBox.expand(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
             SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Startup Namer'),
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.grey,
                onPressed: _showStartupNamerPage,
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Fetch Data'),
                  onPressed: _showAlbumPage,
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Testing Page'),
                onPressed: _showStartupNamerPage,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _showAlbumPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AlbumPage()));
  }
  _showStartupNamerPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => StartupNamerPage()));
  }
}

// #enddocregion MyApp
