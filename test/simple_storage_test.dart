// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPreferences Tests', () {
    test('должен сохранять и читать данные', () async {
      print('🧪 Тест: Сохранение и чтение данных в SharedPreferences');
      
      // Получаем экземпляр SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      print('✅ SharedPreferences инициализирован');
      
      // Сохраняем тестовые данные
      const testKey = 'test_key';
      const testValue = 'test_value';
      
      await prefs.setString(testKey, testValue);
      print('✅ Данные сохранены: $testKey = $testValue');
      
      // Читаем сохраненные данные
      final readValue = prefs.getString(testKey);
      print('📖 Прочитанные данные: $readValue');
      
      // Проверяем, что данные совпадают
      expect(readValue, equals(testValue));
      print('✅ Данные совпадают!');
      
      // Очищаем тестовые данные
      await prefs.remove(testKey);
      print('🧹 Тестовые данные удалены');
      
      print('🎉 Тест пройден успешно!');
    });

    test('должен сохранять и читать JSON данные', () async {
      print('🧪 Тест: Сохранение и чтение JSON данных');
      
      final prefs = await SharedPreferences.getInstance();
      
      // Создаем тестовые данные в формате JSON
      const testKey = 'user_colors';
      const testData = '{"test@gmail.com":{"backgroundColor":"#FFFF0000","appBarColor":"#FF0000FF","textColor":"#FF00FF00"}}';
      
      // Сохраняем JSON данные
      await prefs.setString(testKey, testData);
      print('✅ JSON данные сохранены: $testData');
      
      // Читаем JSON данные
      final readData = prefs.getString(testKey);
      print('📖 Прочитанные JSON данные: $readData');
      
      // Проверяем, что данные совпадают
      expect(readData, equals(testData));
      print('✅ JSON данные совпадают!');
      
      // Проверяем, что данные содержат ожидаемые ключи
      expect(readData, contains('test@gmail.com'));
      expect(readData, contains('backgroundColor'));
      expect(readData, contains('appBarColor'));
      expect(readData, contains('textColor'));
      print('✅ Все ожидаемые ключи найдены в JSON');
      
      // Очищаем тестовые данные
      await prefs.remove(testKey);
      print('🧹 JSON тестовые данные удалены');
      
      print('🎉 JSON тест пройден успешно!');
    });

    test('должен работать с множественными пользователями', () async {
      print('🧪 Тест: Работа с множественными пользователями');
      
      final prefs = await SharedPreferences.getInstance();
      
      // Сохраняем данные для первого пользователя
      const user1Data = '{"user1@gmail.com":{"backgroundColor":"#FFFF0000"}}';
      await prefs.setString('user_colors', user1Data);
      print('✅ Данные для user1 сохранены');
      
      // Читаем данные
      var allData = prefs.getString('user_colors') ?? '{}';
      print('📖 Текущие данные: $allData');
      
      // Добавляем данные для второго пользователя
      const user2Data = '{"user1@gmail.com":{"backgroundColor":"#FFFF0000"},"user2@gmail.com":{"backgroundColor":"#FF00FF00"}}';
      await prefs.setString('user_colors', user2Data);
      print('✅ Данные для user2 добавлены');
      
      // Читаем обновленные данные
      allData = prefs.getString('user_colors') ?? '{}';
      print('📖 Обновленные данные: $allData');
      
      // Проверяем, что данные содержат обоих пользователей
      expect(allData, contains('user1@gmail.com'));
      expect(allData, contains('user2@gmail.com'));
      print('✅ Данные содержат обоих пользователей');
      
      // Очищаем тестовые данные
      await prefs.remove('user_colors');
      print('🧹 Тестовые данные удалены');
      
      print('🎉 Тест множественных пользователей пройден успешно!');
    });
  });
  
  print('🏁 Все тесты SharedPreferences завершены!');
} 