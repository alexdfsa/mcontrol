import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:mcontrol/financial/presentation/stores/bank_list_store.dart';
import 'package:mobx_triple/mobx_triple.dart';

class BankOverviewPage extends StatefulWidget {
  const BankOverviewPage({super.key});

  @override
  State<BankOverviewPage> createState() => _BankOverviewPageState();
}

class _BankOverviewPageState extends State<BankOverviewPage> {
  @override
  void initState() {
    super.initState();
    store.getList();
  }

  final store = Modular.get<BankListStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank'),
      ),
      body: newMethod(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FinancialBank bank = FinancialBank(code: '', name: '');
          Modular.to.pushNamed('/bank', arguments: bank);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ScopedBuilder<BankListStore, List<FinancialBank>> newMethod() {
    return ScopedBuilder<BankListStore, List<FinancialBank>>(
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
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(state[index].code),
                title: Text(state[index].name),
              );
            },
            separatorBuilder: (context, index) => Container(
              height: 10,
            ),
            itemCount: state.length,
          ),
        );
      },
    );
  }
}
