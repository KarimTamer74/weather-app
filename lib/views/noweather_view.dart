import 'package:flutter/material.dart';

class NoWeatherNow extends StatelessWidget {
  const NoWeatherNow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There is no weather start',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Searching now',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      );
  }
}