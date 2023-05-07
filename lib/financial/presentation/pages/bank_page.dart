import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/financial/presentation/stores/bank_store.dart';
import 'package:mobx_triple/mobx_triple.dart';

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  @override
  void initState() {
    super.initState();
    store.get();
  }

  final store = Modular.get<BankStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank'),
      ),
      body: newMethod(),
    );
  }

  ScopedBuilder<BankStore, List<dynamic>> newMethod() {
    return ScopedBuilder<BankStore, List<dynamic>>(
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
      onState: (_, List state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(state[0].code.toString()),
            ],
          ),
        );
      },
    );
  }
}
