import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guitarshop/components/components.dart';
import 'package:guitarshop/models/models.dart';
import 'package:guitarshop/api/mock_guitar_app_service.dart';


class GuitarScreen extends StatelessWidget {
  final exploreService = MockGuitarAppService();

  GuitarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getGuitars(),
        builder: (BuildContext context, AsyncSnapshot<List<Guitars>> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return GuitarsGridView(guitars: snapshot.data?? []);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
    });
  }
}
