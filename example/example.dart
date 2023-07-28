import 'dart:convert';
import 'dart:io';

import 'package:zilliz/zilliz.dart';

void main() async {
  // this code is not really needed, but it's a good idea to check if the API key environment variable has been set.
  final zillizApiKey = Platform.environment['OPENAI_API_KEY'];

  if (zillizApiKey == null) {
    stderr.writeln('You need to set your ZillizApiKey key in the '
        'ZILLIZ_API_KEY environment variable.');
    exit(1);
  }

  final zilliz = Zilliz(zillizUrl: '[your cloud instance or other host]');

  // drop collection if it exists
  await zilliz.dropCollection('hadith');

  // create a new collection, fields will be assigned dynamically
  await zilliz.createCollection(Collection(
    collectionName: 'Question',
    dimension: 1536,
  ));

  try {
    // use a json file as input documents
    final inputData = json.decode(File('jeopardy_tiny.json').readAsStringSync())
        as List<dynamic>;

    // create the objects that will be uploaded
    for (final element in inputData) {
      await zilliz.insert(
          collectionName: 'Question',
          data: element
            ..addAll({
              'vector': List.generate(1536, (index) => 0.0),
            }));
    }

    print('Objects created successfully!');
  } catch (e) {
    print('Error creating objects: $e');
  }

  final res = await zilliz.query<Question>(
    query: VectorQuery(
      collectionName: 'Question',
      filter: 'Category LIKE "SCIENCE"',
      outputFields: ['Category', 'Question', 'Answer'],
    ),
    fromJson: Question.fromJson,
  );

  print(res);
}

class Question {
  final String category;
  final String question;
  final String answer;

  Question({
    required this.category,
    required this.question,
    required this.answer,
  });

  static Question fromJson(Map<String, dynamic> json) => Question(
        category: json['Category'] as String,
        question: json['Question'] as String,
        answer: json['Answer'] as String,
      );

  @override
  String toString() =>
      'Category: $category\nQuestion: $question\nAnswer: $answer';
}
