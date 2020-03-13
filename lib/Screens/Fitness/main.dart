import 'package:flutter/material.dart';
import 'InputPage.dart';

class Fitness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new FitnessInput();          //curves for bottom
  }
}

class FitnessInput extends StatefulWidget {
  @override
  createState() => new InputPage();
}
