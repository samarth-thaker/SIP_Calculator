import 'package:flutter/material.dart';
import 'package:sipcalculator/cagrCalc.dart';
import 'package:sipcalculator/dashboard.dart';
import 'package:sipcalculator/emiCalc.dart';
import 'package:sipcalculator/fireCalculator.dart';
import 'package:sipcalculator/fixedDepositCalculator.dart';
import 'package:sipcalculator/recDeposit.dart';
import 'package:sipcalculator/sipcalculator.dart';
import 'package:sipcalculator/siplumpsum.dart';
import 'package:sipcalculator/stepupSIP.dart';
import 'package:sipcalculator/goalLumpsum.dart';
import 'package:sipcalculator/goalSip.dart';
import 'package:sipcalculator/timedurationLumpsum.dart';
import 'package:sipcalculator/timedurationRegular.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
      routes: {
        '/sipcalculator': (context) => const SIPscreen(),
        "/siplumpsum": (context) => const Lumpsumscreen(),
        '/cagrCalc': (context) => const Cagrscreen(),
        '/fixedDepositCalculator': (context) => const FDscreen(),
        '/recDeposit': (context) => const RDscreen(),
        '/stepupSIP': (context) => const UPscreen(),
        '/cagrCalc': (context) => const Cagrscreen(),
        '/fireCalculator': (context) => const FireScreen(),
        '/goalLumpsum': (context) => const Goallumpsum(),
        '/goalSip': (context) => const SIPGoal(),
        '/timedurationLumpsum': (context) => const TimeDurationLumpsum(),
        '/timedurationRegular': (context) => const TimeDurationRegularScreen(),
        '/emiCalc': (context) => const EmiScreen(),
      },
    );
  }
}
