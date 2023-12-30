class Muslim {
  String title;
  String description;
  List<Lesson> lessons;

  Muslim({
    required this.title,
    required this.description,
    required this.lessons,
  });
}

class Lesson {
  String header;
  List<NestedTopic> nestedTopics;

  Lesson({
    required this.header,
    required this.nestedTopics,
  });
}

class NestedTopic {
  String title;
  String body;

  NestedTopic({
    required this.title,
    required this.body,
  });
}
