import 'package:flutter/material.dart';
import 'dart:math';

class FIRE extends StatefulWidget {
  const FIRE({super.key});

  @override
  State<FIRE> createState() => _FIREState();
}

class _FIREState extends State<FIRE> {
  final TextEditingController _monthlyExpenseController =
      TextEditingController();
  final TextEditingController _currentAgeController = TextEditingController();
  final TextEditingController _retirementAgeController =
      TextEditingController();
  final TextEditingController _inflationRateController =
      TextEditingController();
  final TextEditingController _coastFireAgeController = TextEditingController();
  double leanFire = 0.0;
  double fatFire = 0.0;
  double fire = 0.0;
  double coastFire = 0.0;
  double expenseToday = 0.0;
  double expenseInFuture = 0.0;
  //double lean() {}
  double fireNumber(double monthlyExpense, int currentAge, int retirementAge,
      double inflation) {
    double annualExpense =
        future(monthlyExpense, currentAge, retirementAge, inflation);
    return annualExpense / 0.04;
  }

  double fat(double monthlyExpense, int currentAge, int retirementAge,
      double inflation) {
    double fatMonthlyExpense = monthlyExpense * 1.5;
    return fireNumber(fatMonthlyExpense, currentAge, retirementAge, inflation);
  }

  //double coast() {}

  double today(double monthlyExpense) {
    return monthlyExpense * 12;
  }

  double future(double monthlyExpense, int currentAge, int retirementAge,
      double inflation) {
    double rate = inflation / 100;
    double sum = 1 + rate;
    int diff = retirementAge - currentAge;
    return monthlyExpense * pow(sum, diff) * 12;
  }

  void calculate() {
    double monthlyExpense = double.parse(_monthlyExpenseController.text);
    int currentAge = int.parse(_currentAgeController.text);
    int retirementAge = int.parse(_retirementAgeController.text);
    double inflation = double.parse(_inflationRateController.text);
    //double coastFireAge = double.parse(_coastFireAgeController.text);
    /* double monthlyExpense = double.parse(_monthlyExpenseController.text);
    double monthlyExpense = double.parse(_monthlyExpenseController.text); */
    setState(() {
      expenseToday = today(monthlyExpense) * 12;
      expenseInFuture =
          future(monthlyExpense, currentAge, retirementAge, inflation);
      //leanFire = lean();
      fatFire = fat(monthlyExpense, currentAge, retirementAge, inflation);
      //coastFire = coast();
      fire = fireNumber(monthlyExpense, currentAge, retirementAge, inflation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Financial Independence Retire Early Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _monthlyExpenseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Monthly Expense (in Rs.)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _currentAgeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Current Age ",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _retirementAgeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Retirement Age",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _inflationRateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Assumed inflation (in %)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _coastFireAgeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Desired Coast Fire",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: calculate,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, primary: Colors.blue, // text color
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 30), // button padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // button border radius
                ),
              ),
              child: Text(
                "Calculate my Fire",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),
            Text('Expense today: Rs. ${expenseToday.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
            //Text('Lean FIRE: Rs. ${leanFire.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
            Text('FIRE: Rs. ${fire.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
            Text('FAT FIRE: Rs. ${fatFire.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
            //Text('Coast FIRE: Rs. ${coastFire.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
