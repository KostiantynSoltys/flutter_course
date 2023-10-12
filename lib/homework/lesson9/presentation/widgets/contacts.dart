import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'https://www.leopoldmuseum.org/',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                      'LEOPOLD MUSEUM, MuseumsQuartier, Museumsplatz 1, 1070 '
                      'Wien',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  child: const Text('Return'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
