import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz/components/notesoperations.dart';
import 'CentralDataStore/MyStore.dart';
import 'components/quiz_homescreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MyStore(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NotesOperation(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterQuiz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Quiz(),
        routes: {},
      ),
    );
  }
}
