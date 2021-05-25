import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/CentralDataStore/MyStore.dart';
import 'package:quiz/CentralDataStore/playVideo.dart';
import 'package:quiz/model/quiz.dart';

import 'allnotes.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MyStore>(context, listen: false);
    final topics = store.topicssModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzy'),
        backgroundColor: Colors.white24,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'List OF Topics..',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Card(
                          shadowColor: Colors.tealAccent,
                          elevation: 10,
                          child: ExpansionTile(
                            leading: Icon(
                              Icons.language,
                              color: Colors.green,
                            ),
                            children: <Widget>[
                              Divider(
                                thickness: 1,
                              ),
                              Text(
                                ' ##Video Tutorial##',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: Image.asset('assets/clipart3061370.png'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: ElevatedButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PlayVideo(index),
                                        ),
                                      ),
                                      child: Text('Show Video'),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    flex: 1,
                                    child: ElevatedButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AllNotes(),
                                        ),
                                      ),
                                      child: Text('Notes'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizMode(),
                                  ),
                                ),
                                child: Text(
                                    'Lets Review Your Knowledge! on ${topics[index].title}'),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                            ],
                            title: Text(topics[index].title,
                                style: TextStyle(color: Colors.purple)),
                            backgroundColor: Colors.cyan[50],
                          ),
                        ),
                        itemCount: topics.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
