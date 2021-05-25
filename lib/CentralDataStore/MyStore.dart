import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/model/topics.dart';

class MyStore with ChangeNotifier {
  List<TopicsModel> _topicsModel = [];

  TopicsModel? _activetopicsModel = null;

  MyStore() {
    _topicsModel = [
      TopicsModel(
        id: 1,
        title: 'Java',
        url: 'mAtkPQO1FcA',
      ),
      TopicsModel(
        id: 2,
        title: 'Dart',
        url: '5KlnlCq2M5Q',
      ),
      TopicsModel(
        id: 3,
        title: 'C',
        url: 'f8xayqFaxZQ',
      ),
      TopicsModel(
        id: 4,
        title: 'C++',
        url: 'BClS40yzssA',
      ),
      TopicsModel(
        id: 5,
        title: 'React',
        url: 'w7ejDZ8SWv8',
      ),
      TopicsModel(
        id: 6,
        title: 'JavaScripts',
        url: 'W6NZfCO5SIk',
      ),
      TopicsModel(
        id: 7,
        title: 'Python',
        url: 'hEgO047GxaQ',
      ),
      TopicsModel(
        id: 8,
        title: 'C#',
        url: 'ufeZazqrHjM',
      ),
      TopicsModel(
        id: 9,
        title: 'JavaSprings',
        url: 'YAJIromkA2U',
      ),
      TopicsModel(
        id: 10,
        title: 'ReactNative',
        url: '6oFuwhIibo4',
      ),
    ];
    notifyListeners();
  }

  List<TopicsModel> get topicssModel => _topicsModel;

  TopicsModel? get activetopicsModel => _activetopicsModel;

  setActiveProduct(TopicsModel p) {
    _activetopicsModel = p;
  }
}
