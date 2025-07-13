import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final double initialValue;

  const SliderPage({super.key, required this.initialValue});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _value,
            min: 0,
            max: 100,
            onChanged: (val) {
              setState(() {
                _value = val;
              });
            },
          ),
          Text('Wert: ${_value.round()}'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: _value * 3,
            height: 10,
            color: Colors.blue,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _value);
            },
            child: const Text('Zurück zur Startseite'),
          ),
        ],
      ),
    );
  }
}
