import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/counter_provider.dart';

void main() {
  runApp(
    //provider register
    ChangeNotifierProvider(
      create: ((context) => CounterProvider()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterScreen());
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Provider'),),
      body: Center(
        child: Column(
          children: [
            Text('Count : ${counter.count}'
            ,style: TextStyle(fontSize: 30),),

            ElevatedButton(onPressed:() => {
              context.read<CounterProvider>().increment()
            }, child: Icon(Icons.add))  

          ],
        ),
      ),
    );
  }
}
