import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void sip() {
    Navigator.pushNamed(context, "/sipcalculator");
  }

  void lumpsum() {
    Navigator.pushNamed(context, "/siplumpsum");
  }

  void stepup() {
    Navigator.pushNamed(context, "/stepupSIP");
  }

  void fd() {
    Navigator.pushNamed(context, "/fixedDepositCalculator");
  }

  void rd() {
    Navigator.pushNamed(context, "/recDeposit");
  }

  void cagr() {
    Navigator.pushNamed(context, "/cagrCalc");
  }

  ButtonStyle customButton() {
    return TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Financial Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: lumpsum,
                style: customButton(),
                child: const Text("Lumpsum")),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: sip,
                style: customButton(),
                child: const Text("SIP")),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: stepup,
                style: customButton(),
                child: const Text(" Step up SIP")),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: fd,
                style: customButton(),
                child: const Text("Fixed Deposit")),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: rd,
                style: customButton(),
                child: const Text("Recurring Deposit")),
                 const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: cagr,
                style: customButton(),
                child: const Text("CAGR")),
          ],
        ),
      ),
    );
  }
}
