import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({super.key});

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      setState(() {});
      print(count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Practice'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(count.toString()),
          ),
          Center(
            child: Text(DateTime.now().hour.toString() +
                ":" +
                DateTime.now().minute.toString() +
                ":" +
                DateTime.now().second.toString()),
          )
        ],
      ),
    );
  }
}
