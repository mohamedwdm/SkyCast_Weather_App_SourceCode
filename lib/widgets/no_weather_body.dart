

import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text(
          'there is no weather 😔',
              style: TextStyle(
                fontSize: 30,)
         ),
         
          Text(
              'start searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )

        ],
      ),
    );
  }
}