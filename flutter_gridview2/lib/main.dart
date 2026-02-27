import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const AdaptiveWorkshopPage(),
    );
  }
}

class AdaptiveWorkshopPage extends StatefulWidget {

  const AdaptiveWorkshopPage({super.key});

  @override
  State<AdaptiveWorkshopPage> createState() =>
      _AdaptiveWorkshopPageState();
}

class _AdaptiveWorkshopPageState extends State<AdaptiveWorkshopPage> {
  bool switchValue = false;
  bool checkValue = false;
  double sliderValue = 0.3;

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Components Workshop'),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: _onRefresh,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            const SizedBox(height: 20),

            /// 1. Adaptive CircularProgressIndicator
            const Text(
              '1. Adaptive CircularProgressIndicator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 40),

            /// 2. Adaptive Switch
            const Text(
              '2. Adaptive Switch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Switch.adaptive(
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 40),

            /// 3. Adaptive Checkbox
            const Text(
              '3. Adaptive Checkbox',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Checkbox.adaptive(
                value: checkValue,
                onChanged: (value) {
                  setState(() {
                    checkValue = value ?? false;
                  });
                },
              ),
            ),

            const SizedBox(height: 40),

            /// 4. Adaptive Slider
            const Text(
              '4. Adaptive Slider',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            Slider.adaptive(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),

            const SizedBox(height: 16),

            const SizedBox(height: 40),

            /// 5. Adaptive Button
            const Text(
              '5. Adaptive Button',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Text Button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 60),

            const Center(
              child: Text(
                'Pull down to test RefreshIndicator.adaptive()',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}