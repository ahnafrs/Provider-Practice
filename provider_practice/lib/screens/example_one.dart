import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';

class ExampleOnePage extends StatefulWidget {
  const ExampleOnePage({super.key});

  @override
  State<ExampleOnePage> createState() => _ExampleOnePageState();
}

class _ExampleOnePageState extends State<ExampleOnePage> {
  @override
  Widget build(BuildContext context) {
    final exampleOneProvider =
        Provider.of<ExampleOneProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Practice'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1.0,
                value: exampleOneProvider.value,
                onChanged: (val) {
                  exampleOneProvider.setValue(val);
                });
          }),
          Consumer(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color:
                            Colors.pink.withOpacity(exampleOneProvider.value)),
                    child: Text('Container 1'),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.purple
                            .withOpacity(exampleOneProvider.value)),
                    child: Text('Container 2'),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
