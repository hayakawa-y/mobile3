import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mouse & Touch Workshop',
      theme: ThemeData(useMaterial3: true),
      home: const SwitchLayoutPage(),
    );
  }
}

class SwitchLayoutPage extends StatefulWidget {
  const SwitchLayoutPage({super.key});

  @override
  State<SwitchLayoutPage> createState() => _SwitchLayoutPageState();
}

class _SwitchLayoutPageState extends State<SwitchLayoutPage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F7),
      appBar: AppBar(
        title: const Text('Mouse & Touch Workshop'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: _buildInteractiveButton(context),
      ),
    );
  }

  Widget _buildInteractiveButton(BuildContext context) {
    final Color baseColor = Colors.grey.shade400;
    final Color hoverColor = Colors.blue;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () => _showActivatedSnackBar(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          decoration: BoxDecoration(
            color: _isHovered ? hoverColor : baseColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            'Hover or Tap Me\n(Mouse / Touch)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _showActivatedSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Activated! 🎉'),
          duration: Duration(seconds: 2),
        ),
      );
  }
}
