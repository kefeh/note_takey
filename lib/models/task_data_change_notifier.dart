import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:note_takey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskItems = [
    Task(
      header: "Header",
      body:
          "We are definitely going to start from somewhere and it will be a series that will last us a couple of weeks. We will start with what a widget is and explore through other complex concepts and techniques.",
      createdAt: "20th May",
    ),
    Task(
      header: "Header",
      body:
          "State: state defines the condition of a system or entity at a specific time (or under specific conditions).",
      createdAt: "20th May",
    ),
    Task(
      header: "Header",
      body: "Yeah that's obvious, you may say but is it?",
      createdAt: "20th May",
    ),
    Task(
      header: "Header",
      body:
          "In life, you may ask a very trivial question as, what's the state of water at room temperature? It's liquid, that's right, but does that mean that water is stateful? Yes sure, due to some external conditions, water is able to change its form or state.",
      createdAt: "20th May",
    ),
    Task(
      header: "Header",
      body: "We are definitely going to start.",
      createdAt: "20th May",
    ),
  ];

  set setTaskItems(value) {
    _taskItems = value;
    notifyListeners();
  }

  UnmodifiableListView<Task> get taskItems => UnmodifiableListView(_taskItems);

  get taskItemsCount => _taskItems.length;

  void addTaskItems(Task value) {
    _taskItems.add(value);
    notifyListeners();
  }
}
