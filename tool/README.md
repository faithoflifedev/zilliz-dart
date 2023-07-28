# Zilliz Dart Wrapper

[![Pub Package](https://img.shields.io/pub/v/zilliz.svg)](https://pub.dev/packages/zilliz)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/faithoflifedev/zilliz-dart/blob/main/LICENSE)

A Dart wrapper for the Zilliz REST API, allowing you to easily integrate Zilliz into your Dart projects.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

[![Build Status](https://github.com/faithoflifedev/zilliz-dart/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/zilliz-dart/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/zilliz-dart)](https://shields.io/github/last-commit/faithoflifedev/zilliz-dart) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/zilliz-dart/dart.yml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/zilliz-dart/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/zilliz-dart)](https://shields.io/github/issues/faithoflifedev/zilliz-dart)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

## Installation

Add `zilliz` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  zilliz: ^{{ pubspec.version }}
```

Then run `flutter pub get` to fetch the package.

## Usage

Import the package in your Dart file:

```dart
import 'package:zilliz/zilliz.dart';
```

Create a new instance of the Zilliz client:

```dart
  final zilliz = Zilliz(
      zillizUrl: '[your cloud instance or other host]',
      ));
```

Now you can use the client to interact with the Zilliz API.

## Examples

Here are a few examples demonstrating the usage of the Zilliz Dart wrapper:

### Creating an object

```dart
import 'package:zilliz/zilliz.dart';

void main() async {
  // this code is not really needed, but it's a good idea to check if the API key environment variable has been set.
  final zillizApiKey = Platform.environment['OPENAI_API_KEY'];

  if (zillizApiKey == null) {
    stderr.writeln('You need to set your ZillizApiKey key in the ZILLIZ_API_KEY environment variable.');

    exit(1);
  }

  final zilliz = ZillizClient('[your cloud instance or other host]');

  // drop collection if it exists
  await zilliz.dropCollection('Question');

  // create a new collection, fields will be assigned dynamically
  await zilliz.createCollection(Collection(
    collectionName: 'Question',
    dimension: 1536,
  ));

    
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
}
```

### Querying objects
First you'll need a Dart object that will represent the data returned by the query.

```dart
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
```

Now you can submit your query using the `Question` class as the generic type that will be returned as a `List` by the query method.  Be sure to list the fields needed by your class in the `outputFields` parameter of the method.

```dart
  final res = await zilliz.query<Question>(
    query: VectorQuery(
      collectionName: 'Question',
      filter: 'Category = "SCIENCE"',
      outputFields: ['Category', 'Question', 'Answer'],
    ),
    fromJson: Question.fromJson,
  );

  print(res);

```

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please create an issue on the [GitHub repository](https://github.com/faithoflifedev/zilliz-dart).

To contribute code, please fork the repository and create a pull request with your changes.

## License

This project is licensed under the [MIT License](https://github.com/faithoflifedev/zilliz-dart/blob/main/LICENSE).