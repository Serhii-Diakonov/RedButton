import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const RedButtonApp());
}

class RedButtonApp extends StatelessWidget {
  const RedButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Квестік',
      home: RedButtonView(title: 'Квестік'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.imgPath,
    required this.imgPathPressed,
    required this.onParentPressed,
  });

  final String imgPath;
  final String imgPathPressed;
  final VoidCallback onParentPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _pressed = false;

  void _press(TapDownDetails details) {
    setState(() {
      _pressed = true;
    });
  }

  void _release(TapUpDetails details) {
    setState(() {
      _pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _press,
      onTapUp: _release,
      onTap: widget.onParentPressed,
      behavior: HitTestBehavior.translucent,
      child: Image.asset(_pressed ? widget.imgPathPressed : widget.imgPath),
    );
  }
}

class RedButtonView extends StatefulWidget {
  const RedButtonView({super.key, required this.title});

  final String title;

  @override
  State<RedButtonView> createState() => _RedButtonViewState();
}

class _RedButtonViewState extends State<RedButtonView> {
  int _counter = 0;
  var _states;

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  void _redButtonPressed() {
    print("Button pressed");
    setState(() {
      _counter++;
    });
  }

  Future<String> loadAsset() async {
    var data = await rootBundle.loadString('assets/texts/states.json');
    setState(() {
      _states = json.decode(data);
    });
    return "ok";
  }

  @override
  Widget build(BuildContext context) {
    print(_states == null ? "" : _states[_counter]);
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _redButtonPressed,
              child: Button(
                  imgPath: 'imgs/red-btn.png',
                  imgPathPressed: 'imgs/red-btn-p.png',
                  onParentPressed: _redButtonPressed),
            ),
            Container(
              padding: const EdgeInsets.all(22),
              child: Text(_states == null
                  ? ''
                  : _states[_counter]['buttonMessage'].toString()),
            )
          ],
        ),
      ),
    );
  }
}
