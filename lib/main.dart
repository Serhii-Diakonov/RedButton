import 'package:flutter/material.dart';

void main() {
  runApp(const RedButtonApp());
}

class RedButtonApp extends StatelessWidget {
  const RedButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Квестік',
      home: RedButtonView(title: 'Квестік'),
      // debugShowCheckedModeBanner: false,
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
