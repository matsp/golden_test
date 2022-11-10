import 'dart:convert';

import 'package:golden_test/src/golden_file.dart';
import 'package:test/test.dart';

void main() {
  test('golden file as string', (() async {
    final json = <String, dynamic>{'id': 'test'};
    final jsonEncoded = jsonEncode(json);
    final golden = GoldenFileAsString(
      'test/file.golden.json',
      expectedContent: jsonEncoded,
    );

    expect(golden.content, equals(jsonEncoded));
  }));
}

