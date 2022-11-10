# golden_test

A dart library to help with golden a.k.a. snapshot testing in dart.


## example

To update the golden files you need to provide the `UPDATE_GOLDEN` environment variable.

```shell
export UPDATE_GOLDEN=true; dart test
```

```
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
```
