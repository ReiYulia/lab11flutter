import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/color_provider.dart';

class ColorConfigurationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PreviewContainer(),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              ColorSlider(
                label: "Red",
                getValue: (provider) => provider.red.toDouble(),
                setValue: (provider, value) => provider.setRed(value.toInt()),
              ),
              ColorSlider(
                label: "Green",
                getValue: (provider) => provider.green.toDouble(),
                setValue: (provider, value) => provider.setGreen(value.toInt()),
              ),
              ColorSlider(
                label: "Blue",
                getValue: (provider) => provider.blue.toDouble(),
                setValue: (provider, value) => provider.setBlue(value.toInt()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorSlider extends StatelessWidget {
  final String label;
  final double Function(ColorProvider) getValue;
  final void Function(ColorProvider, double) setValue;

  ColorSlider({
    required this.label,
    required this.getValue,
    required this.setValue,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (context, colorProvider, child) {
        double value = getValue(colorProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label: ${value.toInt()}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              min: 0,
              max: 255,
              value: value,
              onChanged: (newValue) => setValue(colorProvider, newValue),
            ),
          ],
        );
      },
    );
  }
}

class PreviewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorProvider>(context).color;

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
