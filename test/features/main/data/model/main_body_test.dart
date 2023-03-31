import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/features/main/data/model/main_body.dart';

void main() {
  final body = MainBody(key: '', status: 1);
  test(
      'Given MainBody'
      'When MainBody is filled'
      'Then it should return correct data', () {
    expect('', body.key);
    expect(1, body.status);
  });
}