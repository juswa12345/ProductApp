import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guitarshop/models/models.dart';

class EmptyShopScreen extends StatelessWidget {
  const EmptyShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset('assets/guitar_app_assets/empty_list.png'),
              )
            ),
            const SizedBox(height: 16,),
            const Text(
              'No Items on Cart',
              style: TextStyle(
                fontSize: 21.0,
              ),
            ),
            const SizedBox(height: 16,),
            const Text(
              'Shopping for Guitar Instruments? \n'
                  'Tap the + button to write them down.',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              child: const Text(
                'Browse for Guitars',
              ),
              color: Colors.green,
              onPressed: (){
                Provider.of<TabManager>(context, listen: false).goToGuitarChart();
              },
              shape: const StadiumBorder(),
            )
          ],
        ),
      ),
    );
  }
}
