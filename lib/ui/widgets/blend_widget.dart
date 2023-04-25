import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BlendWidget extends StatefulWidget {
  const BlendWidget({Key? key}) : super(key: key);

  @override
  State<BlendWidget> createState() => _BlendWidgetState();
}

class _BlendWidgetState extends State<BlendWidget> {
  double _blendValue = 0;
  SMINumber? _value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RiveAnimation.asset(
            'assets/animation.riv',
            artboard: 'Blend',
            onInit: _onInit,
            fit: BoxFit.contain,
          ),
        ),
        const Text(
          'Controls:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 200.0,
            child: Slider(
              value: _blendValue,
              onChanged: (value) {
                setState(() {
                  _blendValue = value;
                  _value?.change(_blendValue * 100);
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  void _onInit(Artboard art) {
    var controller = StateMachineController.fromArtboard(art, 'State Machine 1') as StateMachineController;
    art.addController(controller);

    _value = controller.findInput<double>('Value') as SMINumber;
  }
}
