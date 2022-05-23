import 'package:flutter/material.dart';
import 'package:guitarshop/components/components.dart';
import 'package:guitarshop/models/models.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;
  const FriendPostTile( {Key? key, required this.post,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text('${post.timestamp} min ago',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),)
            ],
          ),
        ),
      ],
    );
  }
}
