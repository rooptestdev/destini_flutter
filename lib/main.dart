import 'package:flutter/material.dart';
import 'story_bank.dart';

void main() {
  runApp(const DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: StoryPage(),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBank storyBank = StoryBank();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              storyBank.getStoryTitle(),
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            onPressed: () {
              print('First choice');
              setState(() {
                storyBank.nextStory(1);
              });
            },
            child: Text(
              storyBank.getChoice1(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Visibility(
            visible: storyBank.buttonVisible(),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: () {
                print('Second choice');
                setState(() {
                  storyBank.nextStory(2);
                });
              },
              child: Text(
                storyBank.getChoice2(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
