import 'package:flutter/material.dart';
import 'package:flutter_bugfender/flutter_bugfender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter & Bugfender Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter & Bugfender Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

   initPlatformState() async {
    try {
      await FlutterBugfender.init("VocUSyztliDe9H98ZowwQEoOfqObXfRR", enableAndroidLogcatLogging: false);
      await FlutterBugfender.log("Initialized Bugfender");
    } catch (e) {
      print("Error found!!!! $e");
      throw e;
    }
    if (!mounted) return;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    FlutterBugfender.log('Value of the counter is $_counter');
  }

  void _sendFeedback() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'We will log the count to Bugfender once you push it',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FloatingActionButton(
        child: Icon(
          Icons.add
        ),
        onPressed: _incrementCounter,
        heroTag: null,
      ),
      SizedBox(
        height: 10,
      ),
      FloatingActionButton(           
        child: Icon(
          Icons.feedback
        ),
        onPressed: () => _sendFeedback,
        heroTag: null,
      )
    ]
  ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
