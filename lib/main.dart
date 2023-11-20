import 'package:apnaloan/loan_seeker_passbook.dart';
import 'package:flutter/material.dart';
import 'api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> loanSeekers = {};
  Map<String, dynamic> loanGivers = {};
  Map<String, dynamic> enrolmentCenterTracker = {};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var loanSeekersData = await Api.fetchLoanSeekersData();
    var loanGiversData = await Api.fetchLoanGiversData();

    setState(() {
      loanSeekers = loanSeekersData;
      loanGivers = loanGiversData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoanSeeker(
      loanSeekers: loanSeekers,
      loanGivers: loanGivers,
      // enrolmentCenterTracker:enrolmentCenterTracker,
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'SF Pro',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25),
          titleSmall: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 18),
        )),
    debugShowCheckedModeBanner: false,
    home: const Home(),
  ));
}
