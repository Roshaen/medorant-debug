import 'package:flutter/material.dart';
import 'package:medorant/utils/themes.dart';

class Counter extends StatelessWidget {
  var low;
  var mid;
  var high;
  Counter(this.high, this.mid, this.low, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    high ??= '0';
    mid ??= '0';
    low ??= '0';

    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 240, 234, 251)),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            'Alert',
            style: TextStyle(
                color: AppTheme.lightTheme(context).primaryColor, fontSize: 18),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 25,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$high high',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$mid medium',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 25,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$low low',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
