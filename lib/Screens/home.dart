import 'package:flutter/material.dart';
import 'package:http_sample/api.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final numController = TextEditingController();

  String _resultText = 'Type number and get result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Number',
            ),
            keyboardType: TextInputType.number,
            controller: numController,
          ),
          ElevatedButton(
              onPressed: () async {
                final number = numController.text;
                final result = await getNumberFact(number: number);
                setState(() {
                  _resultText = result.type ?? 'No type';
                });
              },
              child: const Text('Get Result')),
          Text('$_resultText')
        ],
      )),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
