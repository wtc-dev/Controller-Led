import 'dart:async';
import 'dart:io';
import 'package:jovial_misc/io_utils.dart';
import 'package:flutter/material.dart';
import 'package:test_tablet_led/model/Ledcontrol.dart';
import 'dart:developer' as developer;
import 'package:convert/convert.dart';
import 'package:test_tablet_led/model/Ledcontroller.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    developer.log('test');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test LED',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //Function คลิกเปลี่ยนสี เขียว
  void clicktogreen() async {
    try {
      await MyPlugin.changeLed('green');
    } catch (e) {
      developer.log('Exception: $e');
    }
  }

  //Function คลิกเปลี่ยนสี เหลือง
  void clicktoyellow() async {
    try {
      await MyPlugin.changeLed('yellow');
    } catch (e) {
      developer.log('Exception: $e');
    }
  }

  //Function คลิกเปลี่ยนสี แดง
  void clicktored() async {
    try {
      await MyPlugin.changeLed('red');
    } catch (e) {
      developer.log('Exception: $e');
    }
  }

  //UI สำหรับควบคุม LED 3 สี
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
            FloatingActionButton(
              onPressed: clicktogreen,
              tooltip: 'Green',
              child: Text('green'),
            ),
            FloatingActionButton(
              onPressed: clicktoyellow,
              tooltip: 'Yellow',
              child: Text('yellow'),
            ),
            FloatingActionButton(
              onPressed: clicktored,
              tooltip: 'Red',
              child: Text('red'),
            ),
          ],
        ),
      ),
    );
  }
}
