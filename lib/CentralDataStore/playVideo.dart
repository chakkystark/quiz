import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/components/addNotescreen.dart';
import 'package:quiz/components/allnotes.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'MyStore.dart';

class PlayVideo extends StatefulWidget {
  final int index;

  PlayVideo(this.index);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MyStore>(context, listen: false);
    final topics = store.topicssModel;

    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: topics[widget.index].url,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          controlsVisibleAtStart: false,
          captionLanguage: 'English',
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text('Streaming Selected Topic'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddNoteScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.deepOrange,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 5),
              Text('Playing....'),
              SizedBox(height: 160),
              Container(
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllNotes(),
                  ),
                ),
                child: Text('View Notes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
