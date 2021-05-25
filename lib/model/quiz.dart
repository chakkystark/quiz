import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/model/Question.dart';

class QuizMode extends StatefulWidget {
  @override
  _QuizModeState createState() => _QuizModeState();
}

class _QuizModeState extends State<QuizMode> {
  var counter = 0;
  var score = 0;

  List qList = [
    Questions(
        "1.int x[] = new int[]{10,20,30};<br><br>Arrays can also be created and initialize as in above statement",
        true),
    Questions(
        "2.In an instance method or a constructor, \"this\" is a reference to the current object.",
        true),
    Questions("3.Garbage Collection is manual process.", false),
    Questions(
        "4.The JRE deletes objects when it determines that they are no longer being used. This process is called Garbage Collection.",
        true),
    Questions("5.Constructor overloading is not possible in Java.", false),
    Questions("6.Assignment operator is evaluated Left to Right.", false),
    Questions(
        "7.All binary operators except for the assignment operators are evaluated from Left to Right",
        true),
    Questions(
        "8.Java programming is not statically-typed, means all variables should not first be declared before they can be used.",
        false),
    Questions(
        "9.In Java SE 7 and later, underscore characters \"_\" can appear anywhere between digits in a numerical literal",
        true),
    Questions(
        "10.Variable name can begin with a letter, \"\$ \", or \"_\".", true),
  ];

  checkWin(bool userChoice, BuildContext ctx) {
    if (userChoice == qList[counter].isCorrect) {
      print('Correct');
      score = score + 1;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Correct!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      print('Wrong');
      score = score + 0;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text("Incorrect!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if (counter < 9) {
        counter = counter + 1;
      }
    });
  }

  reset() {
    setState(() {
      counter = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Quizzy',
          style: TextStyle(letterSpacing: 2.0),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (ctx) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Score: $score/10',
                        style: TextStyle(fontSize: 30),
                      ),
                      InkWell(
                        onTap: reset,
                        child: Text(
                          'Reset',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 100,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.yellowAccent)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        qList[counter].qText,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          checkWin(true, ctx);
                        },
                        child: Text(
                          'TRUE',
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          checkWin(false, ctx);
                        },
                        child: Text(
                          'False',
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
