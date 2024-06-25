import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'SecondPage.dart';
import 'controllar/DayControllar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Main Screen')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer(builder: (context, ref, child) {
            return Center(
              child: Column(
                children: [
                  Expanded(child: Text(ref.watch(itemsAddProvider).totalDaysCount())),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Secondpage(),
                          ));
                    },
                    child: Text(ref.watch(itemsAddProvider).selectedDats.isNotEmpty?"Update Data":"Add Data"),
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
