import 'package:flutter/material.dart';

import 'package:flutter_ass/week5/homework/exercise-2/model/color_counters.dart';
import 'package:flutter_ass/week5/homework/exercise-2/screen/widget/color_tap.dart';
import 'package:flutter_ass/week5/homework/exercise-2/screen/widget/statistics.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("Homescreen rebuild");
    return Column(
      children: [

        Consumer<ColorCounters>(
          builder: (context, colorCounters, child) {
            print("Statistics rebuild");
            return Statistics(
              blueTaps: colorCounters.blueTaps,
              redTaps: colorCounters.redTaps,
            );
          },
        ),

        Consumer<ColorCounters>(
          builder: (context, colorCounters, child) {
            print("Colortap red rebuild");
            return ColorTap(
              type: CardType.red,
              tapCount: colorCounters.redTaps,
              onTap: colorCounters.incrementRed,
            );
          },
        ),

        Consumer<ColorCounters>(
          builder: (context, colorCounters, child) {
            print("Colortap blue rebuild");
            return ColorTap(
              type: CardType.blue,
              tapCount: colorCounters.blueTaps,
              onTap: colorCounters.incrementBlue,
            );
          },
        ),
      ],
    );
  }
}
