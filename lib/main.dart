// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sih/locationInfo.dart';
import 'map.dart';
import 'package:alan_voice/alan_voice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Accessibility Map'),
      initialRoute: '/',
      routes: {
        '/map': (context)=>const Map(),
        '/theater' : (context)=>const LocationInfo(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _greetingIsPlayed = false;
  _MyHomePageState() {
    /// Init Alan Button with project key from Alan Studio      
    AlanVoice.addButton("03dbf72798fc92e5fe159ea32bf375122e956eca572e1d8b807a3e2338fdd0dc/stage");
    AlanVoice.onButtonState.add((state) {
      if (state.name == "ONLINE" && !_greetingIsPlayed) {
        _greetingIsPlayed = true;
        AlanVoice.activate();
        AlanVoice.playText("Hello! I'm Alan, your voice assistent. How can I help you?");
      }
    });

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  _handleCommand(var command){
      switch(command["command"]){
        case "forward":
          Navigator.pushNamed(context,'/map');
          break;
        case "back to home":
          Navigator.pop(context);
          break;
        case "go to theatre":
          Navigator.pushNamed(context,'/theater');
          break;
      }
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Map();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'View the map',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
