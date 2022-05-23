import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:guitarshop/models/models.dart';

class MockGuitarAppService {

  Future<ExploreData> getExploreData() async {
    final friendPosts = await _getFriendFeed();
    final cards = await _card();
    return ExploreData(cards, friendPosts);
  }

  Future<List<Post>> _getFriendFeed() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/sample_data/sample_friends_feed.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((v) {
        posts.add(Post.fromJson(v));
      });
      return posts;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<List<ExploreGuitar>> _card() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/sample_data/sample_explore_guitars.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['guitars'] != null) {
      final guitars = <ExploreGuitar>[];
      json['guitars'].forEach((v) {
        guitars.add(ExploreGuitar.fromJson(v));
      });
      return guitars;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<List<Guitars>> getGuitars() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/sample_data/sample_guitars.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['guitars'] != null) {
      final guitars = <Guitars>[];
      json['guitars'].forEach((v) {
        guitars.add(Guitars.fromJson(v));
      });
      return guitars;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }


  Future<dynamic> updateFeed(Post newData) async {
    final String path = await rootBundle.loadString('assets/sample_data/sample_friend_feed.json');
    final File file;
    final data = await json.decode(path);

    print(data);
  }
}
