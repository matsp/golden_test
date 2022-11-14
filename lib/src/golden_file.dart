import 'dart:io';

abstract class GoldenFile<T> {
  T? get content;
}

class GoldenFileAsString implements GoldenFile<String> {
  late final String? _data;
  String? expectedContent;

  @override
  String? get content => _data;

  GoldenFileAsString(String fileName, {this.expectedContent}) {
    _data = _loadFile(fileName);
  }

  String? _loadFile(fileName) {
    if (expectedContent != null &&
        Platform.environment['UPDATE_GOLDEN'] == 'true') {
      File(fileName).writeAsStringSync(expectedContent!);
    }

    String? file;
    try {
      file = File(fileName).readAsStringSync();
    } catch (e) {
      print('Golden file $fileName must be created first');
    }
    return file;
  }
}
