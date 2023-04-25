import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class StateWidget extends StatefulWidget {
  const StateWidget({Key? key}) : super(key: key);

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  SMIBool? _hover;
  SMIBool? _spin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RiveAnimation.asset(
            'assets/animation.riv',
            artboard: 'State',
            onInit: _onInit,
            fit: BoxFit.contain,
          ),
        ),
        const Text(
          'States:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    _spin?.value = false;
                    _hover?.value = false;
                  },
                  child: const Text('Idle')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    _spin?.value = false;
                    _hover?.value = true;
                  },
                  child: const Text('Hover')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _hover?.value = false;
                  _spin?.value = true;
                },
                child: const Text('Spin'),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _onInit(Artboard art) {
    var controller = StateMachineController.fromArtboard(art, 'State Machine 1') as StateMachineController;
    art.addController(controller);

    _hover = controller.findInput<bool>('hover') as SMIBool;
    _spin = controller.findInput<bool>('spin') as SMIBool;
  }
}
