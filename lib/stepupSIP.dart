import 'package:flutter/material.dart';
import 'dart:math';

class UPscreen extends StatefulWidget {
  const UPscreen({Key? key}) : super(key: key);

  @override
  State<UPscreen> createState() => _UPscreenState();
}

class _UPscreenState extends State<UPscreen> {
  final TextEditingController _monthlyInvestmentController =
      TextEditingController();
  final TextEditingController _annualInterestRateController =
      TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _stepUpController = TextEditingController();
  final TextEditingController _amountInvestedController = TextEditingController();

  double _maturityValue = 0.0;
  double _amountInvested = 0.0;
  double _earnings = 0.0;

  double calculateSIPMaturity(double monthlyInvestment,
      double annualInterestRate, int years, double stepUpPercentage) {
    double monthlyRate = (annualInterestRate / 100) / 12;
    double maturityValue = 0;

    for (int year = 0; year < years; year++) {
      for (int month = 0; month < 12; month++) {
        int monthsRemaining = (years * 12) - (year * 12 + month);
        maturityValue +=
            monthlyInvestment * pow(1 + monthlyRate, monthsRemaining);
      }

      monthlyInvestment += monthlyInvestment * (stepUpPercentage / 100);
    }

    return maturityValue;
  }

  double investedAmount(double monthlyInvestment, double annualInterestRate,
      int years, double s) {
    double amountInvested = 0;
   for (int year = 0; year < years; year++) {
        for (int month = 0; month < 12; month++) {
            amountInvested += monthlyInvestment;
        }
        // Increase the monthly investment amount by the step-up percentage
        monthlyInvestment += monthlyInvestment * (s / 100);
    }
    return amountInvested;
  }

  double amountEarned(double monthlyInvestment, double annualInterestRate,
      int years, double s) {
    return calculateSIPMaturity(
            monthlyInvestment, annualInterestRate, years, s) -
        investedAmount(monthlyInvestment, annualInterestRate, years, s);
  }

  void _calculate() {
    double monthlyInvestment = double.parse(_monthlyInvestmentController.text);
    double annualInterestRate =
        double.parse(_annualInterestRateController.text);
    int years = int.parse(_yearsController.text);
    double s = double.parse(_stepUpController.text);
    setState(() {
      _maturityValue =
          calculateSIPMaturity(monthlyInvestment, annualInterestRate, years, s);
       _amountInvested =
          investedAmount(monthlyInvestment, annualInterestRate, years, s);
      _earnings = amountEarned(monthlyInvestment, annualInterestRate, years, s);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Step Up SIP Calculator")),
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
                  hintText: "Investment per month (in Rs.)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _stepUpController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Annual Step up (in %)",
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
              child: const Text("Calculate my wealth"),
            ),
            const SizedBox(height: 30),
            Text('Maturity value: Rs. ${_maturityValue.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
            Text('Amount invested: Rs. ${_amountInvested.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
            Text('Earnings: Rs. ${_earnings.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
