import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:mcontrol/financial/presentation/stores/bank_store.dart';
import 'package:mobx_triple/mobx_triple.dart';

class BankNewEditPage extends StatefulWidget {
  final FinancialBank bank;
  const BankNewEditPage({super.key, required this.bank});

  @override
  State<BankNewEditPage> createState() => _BankNewEditPageState();
}

class _BankNewEditPageState extends State<BankNewEditPage> {
  @override
  void initState() {
    super.initState();
    store.get('bank.code');
  }

  final store = Modular.get<BankStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank'),
      ),
      body: Column(),
    );
  }

  ScopedBuilder<BankStore, FinancialBank> newMethod() {
    return ScopedBuilder<BankStore, FinancialBank>(
      store: store,
      onError: (_, error) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.search_off_rounded,
                size: 150,
              ),
              Text(error.toString()),
            ],
          ),
        );
      },
      onLoading: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
      onState: (_, FinancialBank state) {
        return const SingleChildScrollView();
      },
    );
  }
}
