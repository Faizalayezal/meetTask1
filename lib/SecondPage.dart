import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllar/DayControllar.dart';

class Secondpage extends ConsumerStatefulWidget {
  const Secondpage({super.key});

  @override
  ConsumerState<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends ConsumerState<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Set Your Data')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer(builder: (context, ref, child) {
            final refProvider = ref.watch(itemsAddProvider);

            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: refProvider.itemsList.length,
                  itemBuilder: (context, index) {
                    final daySchedule = refProvider.itemsList[index];

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: daySchedule.timeslot.isNotEmpty ? Colors.green : Colors.grey,
                        ),
                        Text(refProvider.itemsList[index].day),
                        CustomCheckBoxGroup(
                          autoWidth: true,
                          spacing: 0,
                          buttonLables: daySchedule.schedual,
                          buttonValuesList: daySchedule.schedual,
                          checkBoxButtonValues: (values) {
                            ref.read(itemsAddProvider.notifier).itemsList[index].timeslot = values;
                            ref.watch(itemsAddProvider).refreshData();
                          },
                          defaultSelected:  daySchedule.timeslot,
                          buttonTextStyle: const ButtonTextStyle(selectedColor: Colors.red, unSelectedColor: Colors.grey),
                          selectedColor: Colors.transparent,
                          unSelectedColor: Colors.transparent,
                          selectedBorderColor: Colors.red,
                          unSelectedBorderColor: Colors.grey,
                          enableShape: true,
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text("Add Item"),
                ),
              ],
            );
          }),
        ));
  }
}
