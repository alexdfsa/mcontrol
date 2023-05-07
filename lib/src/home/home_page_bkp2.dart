import 'package:flutter/material.dart';
import 'package:mcontrol/core/shared/widgets/user_image_button.dart';
import 'package:mcontrol/financial/domain/entities/financial_moviment.dart';
import 'package:mcontrol/financial/presentation/widgets/moviment_card.dart';

class HomePageBkp2 extends StatefulWidget {
  const HomePageBkp2({super.key});

  @override
  State<HomePageBkp2> createState() => _HomePageBkp2State();
}

class _HomePageBkp2State extends State<HomePageBkp2> {
  List<FinancialMoviment> moviments = FinancialMoviment.empty().getMoviments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: UserImageButton(),
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 200),
              itemCount: moviments.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return MovimentCard(financialMoviment: moviments[index]);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_before),
                ),
                const SizedBox(
                  width: 130,
                  child: Text(
                    textAlign: TextAlign.center,
                    ' FEVEREIRO/2023 ',
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Row(children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
          const Text('data'),
        ]),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
