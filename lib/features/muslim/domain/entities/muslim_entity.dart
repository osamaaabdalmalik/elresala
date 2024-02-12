class Muslim {
  String title;
  String? description;
  List lessons;

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
  String? vedio;


  NestedTopic({
    required this.title,
    required this.body,
  required this.vedio,
  });
}
