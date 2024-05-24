import 'package:flutter/material.dart';
import 'dart:math';

class Cagrscreen extends StatefulWidget {
  const Cagrscreen({Key? key}) : super(key: key);

  @override
  State<Cagrscreen> createState() => _CagrscreenState();
}

class _CagrscreenState extends State<Cagrscreen> {
  final TextEditingController _principalController =
      TextEditingController();
  final TextEditingController _annualInterestRateController =
      TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  //final TextEditingController _amountInvestedController = TextEditingController();

  double _overallGrowth = 0.0;
  /* double _amountInvested = 0.0;
  double _earnings = 0.0; */

  double calculateCAGR(
      double i, double f, int years) {
   /*  double monthlyRate =
        (annualInterestRate / 100) / 12; */ // Monthly interest rate
    /* int months = years * 12;  */// Total number of months

    double per = pow(f/i, 1/years)-1;
    return per;
  }

  double investedAmount(
      double monthlyInvestment, double annualInterestRate, int years) {
    double amountInvested = monthlyInvestment * years * 12;
    return amountInvested;
  }

  /* double amountEarned(
      double p, double annualInterestRate, int years) {
    return calculateLumpsumMaturity(p, annualInterestRate, years) - p;
  } */

  void _calculate() {
    double principal = double.parse(_principalController.text);
    double annualInterestRate =
        double.parse(_annualInterestRateController.text);
    int years = int.parse(_yearsController.text);

    setState(() {
      _overallGrowth =
          calculateCAGR(principal, annualInterestRate, years);
      /* _amountInvested =
          investedAmount(monthlyInvestment, annualInterestRate, years);
      _earnings = amountEarned(monthlyInvestment, annualInterestRate, years); */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CAGR Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _principalController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Initial investment (in Rs.)",
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
                  hintText: "Final investment (in Rs.)",
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
            Text('CAGR: ${_overallGrowth.toStringAsFixed(2)}%'),
            const SizedBox(height: 30),
            /* Text('Amount invested: Rs. ${_amountInvested.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
            Text('Earnings: Rs. ${_earnings.toStringAsFixed(2)}'),
 */
          ],
        ),
      ),
    );
  }
}
