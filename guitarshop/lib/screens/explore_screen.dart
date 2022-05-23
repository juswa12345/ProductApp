import 'package:guitarshop/components/components.dart';
import 'package:flutter/material.dart';
import 'package:guitarshop/api/mock_guitar_app_service.dart';
import 'package:guitarshop/models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockGuitarAppService();
  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(ConnectionState.done);
          final guitar = snapshot.data?.cards ?? [];
          final listPosts = snapshot.data?.friendPosts ?? [];
          return ListView(
              children: [
                TodayGuitarListView(guitars: guitar,),
                const RankingControls(),
                FriendPostListView(listPosts: listPosts),
              ]
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
