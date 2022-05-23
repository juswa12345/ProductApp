import 'package:guitarshop/api/mock_guitar_app_service.dart';
import 'package:guitarshop/components/components.dart';
import 'package:guitarshop/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> listPosts;
  FriendPostListView({
    Key? key,
    required this.listPosts,
  }) : super(key: key);

  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
    (dispose() as Element).markNeedsBuild();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Commemts: ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Icon(Icons.mail),
              SizedBox(
                width: 16,
              ),
              Icon(Icons.facebook),
              SizedBox(
                width: 16,
              ),
              Icon(Icons.discord),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final post = listPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: listPosts.length),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
