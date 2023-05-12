import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mcontrol/core/domain/entities/system_configuration.dart';
import 'package:mcontrol/core/presentation/stores/system_configuration_store.dart';
import 'package:mcontrol/core/shared/widgets/custom_drawer.dart';
import 'package:mobx_triple/mobx_triple.dart';

class SystemConfigurationPage extends StatefulWidget {
  const SystemConfigurationPage({super.key});

  @override
  State<SystemConfigurationPage> createState() =>
      _SystemConfigurationPageState();
}

class _SystemConfigurationPageState extends State<SystemConfigurationPage> {
  final _formKey = GlobalKey<FormState>();
  final lastSyncDateController = TextEditingController();
  final themeNameController = TextEditingController();
  final store = Modular.get<SystemConfigurationStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 5.0,
        shadowColor: Theme.of(context).colorScheme.shadow,
        title: const Text(
          'Configuration',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Synchronize"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Remove Data"),
                ),
              ];
            }, onSelected: (value) async {
              if (value == 0) {
                debugPrint("Start Synchronize Data.");
                DateTime syncDate = DateTime.now();
                SystemConfiguration config = SystemConfiguration(
                    themeNameController.text,
                    syncDate: syncDate);
                store.update(config);
                store.useCase.save(config);
                lastSyncDateController.text = store.state.syncDate.toString();
              } else if (value == 1) {
                debugPrint("Deleting Data.");
                store.useCase.delete(store.state);
              }
            }),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: ScopedBuilder<SystemConfigurationStore, SystemConfiguration>(
        store: store,
        onLoading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (context, error) {
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
        onState: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: lastSyncDateController,
                    decoration: const InputDecoration(labelText: 'Last Sync'),
                    onChanged: (value) {
                      lastSyncDateController.text = value;
                    },
                  ),
                  TextFormField(
                    controller: themeNameController,
                    decoration:
                        const InputDecoration(labelText: 'Theme Mode Name'),
                    onChanged: (value) {
                      themeNameController.text = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        SystemConfiguration config =
                            SystemConfiguration('themeNameController.text');
                        store.useCase.save(config);
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
        },
      ),
    );
  }
}
