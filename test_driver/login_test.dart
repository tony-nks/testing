// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login success form main stream tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final fieldEmail = find.byValueKey('fieldEmail');
    final fieldPhone = find.byValueKey('fieldPhone');
    final fieldBtn = find.text('Отправить');

    test('Login Email field', () async {
      await driver.tap(fieldEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.ru');
      await driver.waitFor(find.text('test@test.ru'));
    });

    test('Login Phone field', () async {
      await driver.tap(fieldPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('123456');
      await driver.waitFor(find.text('123456'));
    });

    test('Login tap btn', () async {
      await driver.tap(fieldBtn);
    });

    test('Login test OK', () async {
      final success = find.text('Добро пожаловать');
      expect(await driver.getText(success), 'Добро пожаловать');
    });

  });
}
