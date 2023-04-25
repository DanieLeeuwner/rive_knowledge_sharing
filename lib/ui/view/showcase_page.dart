import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_knowledge_sharing/ui/widgets/blend_widget.dart';
import 'package:rive_knowledge_sharing/ui/widgets/simple_widget.dart';
import 'package:rive_knowledge_sharing/ui/widgets/state_widget.dart';

class ShowcasePage extends StatefulWidget {
  ShowcasePage({Key? key}) : super(key: key);

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  final List<Widget> _children = [
    const SimpleWidget(),
    const StateWidget(),
    const BlendWidget(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            '#${_currentIndex + 1}',
            style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(32.0),
                child: _children.elementAt(_currentIndex),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _navigatePrevious,
                  child: const Text('Previous'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _navigateNext,
                  child: const Text('Next'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _navigatePrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _navigateNext() {
    if (_currentIndex < _children.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }
}
