import 'package:flutter/material.dart';
import 'dart:math';

class SIPscreen extends StatefulWidget {
  const SIPscreen({Key? key}) : super(key: key);

  @override
  State<SIPscreen> createState() => _SIPscreenState();
}

class _SIPscreenState extends State<SIPscreen> {
  final TextEditingController _monthlyInvestmentController = TextEditingController();
  final TextEditingController _annualInterestRateController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();

  double _maturityValue = 0.0;

  double calculateSIPMaturity(double monthlyInvestment, double annualInterestRate, int years) {
    double monthlyRate = (annualInterestRate / 100) / 12; // Monthly interest rate
    int months = years * 12; // Total number of months

    double maturityValue = monthlyInvestment * (pow(1 + monthlyRate, months) - 1) / monthlyRate * (1 + monthlyRate);
    return maturityValue;
  }

  void _calculate() {
    double monthlyInvestment = double.parse(_monthlyInvestmentController.text);
    double annualInterestRate = double.parse(_annualInterestRateController.text);
    int years = int.parse(_yearsController.text);

    setState(() {
      _maturityValue = calculateSIPMaturity(monthlyInvestment, annualInterestRate, years);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SIP Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _monthlyInvestmentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Investment per month",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _annualInterestRateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Expected return",
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
                  hintText: "Time period (years)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: _calculate,
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 30),
            Text('Maturity Value: $_maturityValue'),
          ],
        ),
      ),
    );
  }
}
