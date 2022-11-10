import 'dart:io';

abstract class GoldenFile<T> {
  String? get content;
}

class GoldenFileAsString implements GoldenFile<String> {
  late final String _data;
  String? expectedContent;

  @override
  String? get content => _data;

  GoldenFileAsString(String fileName, {this.expectedContent}) {
    _data = _loadFile(fileName);
  }

  String _loadFile(fileName) {
    if (expectedContent != null &&
        Platform.environment['UPDATE_GOLDEN'] == 'true') {
      File(fileName).writeAsStringSync(expectedContent!);
    }
    return File(fileName).readAsStringSync();
  }
}
