import 'package:flutter/material.dart';
import 'package:sipcalculator/cagrCalc.dart';
import 'package:sipcalculator/dashboard.dart';
import 'package:sipcalculator/fixedDepositCalculator.dart';
import 'package:sipcalculator/recDeposit.dart';
import 'package:sipcalculator/sipcalculator.dart';
import 'package:sipcalculator/siplumpsum.dart';
import 'package:sipcalculator/stepupSIP.dart';


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
        '/sipcalculator' : (context)=>const SIPscreen(),
        "/siplumpsum" : (context)=>const Lumpsumscreen(),
        '/cagrCalc' : (context)=>const Cagrscreen(),
        '/fixedDepositCalculator':(context)=>const FDscreen(),
        '/recDeposit':(context)=>const RDscreen(),
        '/stepupSIP':(context) => const UPscreen(),

      }, 
      
    ); 
   
  }
} 
