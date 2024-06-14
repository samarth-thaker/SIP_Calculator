import 'package:flutter/material.dart';
import 'dart:math';

class Lumpsumscreen extends StatefulWidget {
  const Lumpsumscreen({Key? key}) : super(key: key);

  @override
  State<Lumpsumscreen> createState() => _LumpsumscreenState();
}

class _LumpsumscreenState extends State<Lumpsumscreen> {
  final TextEditingController _targetedWealthController =
      TextEditingController();
  final TextEditingController _inflationController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _annualInterestController =
      TextEditingController();
  //final TextEditingController _amountInvestedController = TextEditingController();

  double _maturityValue = 0.0;
  double _amountInvested = 0.0;
  /*double _earnings = 0.0; */

  double inflationAdjustedTargetedWealth(
      double targetedWealth, int years, double inflation) {
    return targetedWealth * pow((1 + inflation / 100), years);
  }

  double investedAmount(double targeetedWealth, double annualInterestRate,
      int years, double inflation) {
    double amountInvested =
        inflationAdjustedTargetedWealth(targeetedWealth, years, inflation) /
            pow((1 + annualInterestRate / 100), years);
    return amountInvested;
  }

  /* double amountEarned(
      double p, double annualInterestRate, int years, double inflation) {
    return calculateLumpsumMaturity(p, annualInterestRate, years) - p;
  } */

  void _calculate() {
    double targetedWealth = double.parse(_targetedWealthController.text);
    double inflation = double.parse(_inflationController.text);
    int years = int.parse(_yearsController.text);
    double annualInterestRate = double.parse(_annualInterestController.text);
    setState(() {
      _maturityValue =
          inflationAdjustedTargetedWealth(targetedWealth, years, inflation);
      _amountInvested =
          investedAmount(targetedWealth, annualInterestRate, years, inflation);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Goal Panning - Lumpsum ")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _targetedWealthController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Targeted Wealth (in Rs.)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _inflationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Expected return (in % p.a)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _yearsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Time period (upto 50 years)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: _calculate,
              child: const Text("Plan my goal"),
            ),
            const SizedBox(height: 30),
            Text(
                'Inflation adjusted targeted wealth: Rs. ${_maturityValue.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
             Text('Investment amount needed: Rs. ${_amountInvested.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
            /* Text('Earnings: Rs. ${_earnings.toStringAsFixed(2)}'), */
 
          ],
        ),
      ),
    );
  }
}
