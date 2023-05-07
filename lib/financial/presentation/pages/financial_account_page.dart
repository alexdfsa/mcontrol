import 'package:flutter/material.dart';

class FinancialAccountPage extends StatefulWidget {
  const FinancialAccountPage({super.key});

  @override
  State<FinancialAccountPage> createState() => _FinancialAccountPageState();
}

class _FinancialAccountPageState extends State<FinancialAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Financial Account',
        ),
      ),
    );
  }
}
