import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsivePage(),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Responsive Padding Challenge")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final isSmallScreen = width < 600;
          final paddingValue = isSmallScreen ? 12.0 : 32.0;
          final textContent =
              isSmallScreen ? "Small Screen" : "Large Screen";

          return Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                textContent,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
