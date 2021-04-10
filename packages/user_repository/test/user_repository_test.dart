import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  test('Initially should return a User', () async {
    var actual = await UserRepository().getUser();
    var expected = isNotNull;
    expect(actual, expected);
  });
}
