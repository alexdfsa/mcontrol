import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/financial/domain/entities/financial_bank.dart';
import 'package:mcontrol/financial/presentation/stores/bank_store.dart';
import 'package:mobx_triple/mobx_triple.dart';

class BankNewEditPage extends StatefulWidget {
  final FinancialBank bank;
  const BankNewEditPage({super.key, required this.bank});

  @override
  State<StatefulWidget> createState() => _BankNewEditPageState();
}

class _BankNewEditPageState extends State<BankNewEditPage> {
  final _formKey = GlobalKey<FormState>();
  final codeTextController = TextEditingController();
  final nameTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final store = Modular.get<BankStore>();

  @override
  Widget build(BuildContext context) {
    bool isNew = widget.bank.code == '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank'),
      ),
      body: ScopedBuilder<BankStore, FinancialBank>(
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
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: codeTextController,
                          decoration: const InputDecoration(labelText: 'Code'),
                          onChanged: (value) {
                            codeTextController.text = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: nameTextController,
                          decoration: const InputDecoration(labelText: 'Name'),
                          onChanged: (value) {
                            nameTextController.text = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FinancialBank bank = FinancialBank(
                                code: codeTextController.text,
                                name: nameTextController.text,
                              );
                              if (isNew) {
                                store.usecase.post(bank);
                                isNew = false;
                              } else {
                                store.usecase.put(bank);
                              }
                            }
                          },
                          child: const Text(
                            'Salvar',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  @override
  void dispose() {
    codeTextController.dispose();
    nameTextController.dispose();
    super.dispose();
  }
}
