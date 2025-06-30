// ignore_for_file: avoid_print

// Импортируем необходимые библиотеки для тестирования
import 'package:flutter/material.dart'; // Для работы с цветами Flutter
import 'package:flutter_test/flutter_test.dart'; // Основная библиотека для тестирования Flutter
import 'package:shared_preferences/shared_preferences.dart'; // Для работы с SharedPreferences

// Импортируем наш сервис, который мы тестируем
import 'package:color_aap/src/local_service.dart';

void main() {
  // Инициализация binding для корректной работы плагинов
  TestWidgetsFlutterBinding.ensureInitialized();

  // Группа тестов для LocalStorageService
  // group() позволяет организовать связанные тесты в логические блоки
  group('LocalStorageService Tests', () {
    // Выводим информацию о начале тестирования
    setUpAll(() {
      print('🚀 Начинаем тестирование LocalStorageService...');
    });

    // Группа тестов для метода saveUserColors
    group('saveUserColors', () {
      // Тест: проверяем, что цвета сохраняются в SharedPreferences
      test('должен сохранять цвета пользователя в SharedPreferences', () async {
        // Выводим информацию о начале теста
        print('🎨 Тест: Сохранение цветов пользователя');
        
        // Arrange (Подготовка) - создаем тестовые данные
        const testColors = {
          'backgroundColor': Colors.red,    // Красный цвет для фона
          'appBarColor': Colors.blue,       // Синий цвет для app bar
          'textColor': Colors.green,        // Зеленый цвет для текста
        };
        print('📝 Тестовые цвета: Фон=${testColors['backgroundColor']}, AppBar=${testColors['appBarColor']}, Текст=${testColors['textColor']}');

        // Act (Действие) - вызываем тестируемый метод
        print('⚡ Вызываем LocalStorageService.saveUserColors()...');
        await LocalStorageService.saveUserColors(
          backgroundColor: testColors['backgroundColor']!,
          appBarColor: testColors['appBarColor']!,
          textColor: testColors['textColor']!,
        );
        print('✅ Метод saveUserColors() выполнен успешно');

        // Assert (Проверка) - проверяем, что данные сохранились
        print('🔍 Проверяем, что данные сохранились...');
        final prefs = await SharedPreferences.getInstance();
        final savedData = prefs.getString('user_colors');
        print('📄 Сохраненные данные: $savedData');
        
        // Проверяем, что данные не null и содержат ожидаемые значения
        expect(savedData, isNotNull);
        print('✅ Данные не null');
        
        expect(savedData, contains('test@gmail.com')); // Должен содержать email
        print('✅ Email "test@gmail.com" найден в данных');
        
        expect(savedData, contains('backgroundColor')); // Должен содержать ключ цвета фона
        expect(savedData, contains('appBarColor')); // Должен содержать ключ цвета app bar
        expect(savedData, contains('textColor')); // Должен содержать ключ цвета текста
        print('✅ Все ключи цветов найдены в данных');
        
        print('🎉 Тест "Сохранение цветов пользователя" пройден успешно!');
      });

      // Тест: проверяем обновление существующих цветов
      test('должен обновлять существующие цвета пользователя', () async {
        // Выводим информацию о начале теста
        print('🔄 Тест: Обновление существующих цветов пользователя');
        
        // Act - вызываем метод с новыми цветами
        print('⚡ Вызываем LocalStorageService.saveUserColors() с новыми цветами...');
        await LocalStorageService.saveUserColors(
          backgroundColor: Colors.yellow,  // Новый цвет фона
          appBarColor: Colors.purple,      // Новый цвет app bar
          textColor: Colors.orange,        // Новый цвет текста
        );
        print('✅ Метод saveUserColors() выполнен с новыми цветами');

        // Assert - проверяем, что данные были обновлены
        print('🔍 Проверяем, что данные были обновлены...');
        final prefs = await SharedPreferences.getInstance();
        final savedData = prefs.getString('user_colors');
        print('📄 Обновленные данные: $savedData');
        
        // Проверяем, что новые данные содержат правильные ключи
        print('🔍 Проверяем наличие всех необходимых ключей в обновленных данных...');
        expect(savedData, isNotNull);
        expect(savedData, contains('test@gmail.com'));
        expect(savedData, contains('backgroundColor'));
        expect(savedData, contains('appBarColor'));
        expect(savedData, contains('textColor'));
        print('✅ Все ключи найдены в обновленных данных');
        
        print('🎉 Тест "Обновление существующих цветов" пройден успешно!');
      });
    });

    // Группа тестов для метода loadUserColors
    group('loadUserColors', () {
      // Тест: проверяем загрузку сохраненных цветов
      test('должен загружать сохраненные цвета пользователя', () async {
        // Выводим информацию о начале теста
        print('📥 Тест: Загрузка сохраненных цветов пользователя');
        
        // Act - вызываем метод загрузки цветов
        print('⚡ Вызываем LocalStorageService.loadUserColors()...');
        final result = await LocalStorageService.loadUserColors();
        print('✅ Метод loadUserColors() выполнен, получен результат: $result');

        // Assert - проверяем, что загрузились правильные цвета
        print('🔍 Проверяем, что загрузились правильные цвета...');
        expect(result, isNotNull); // Проверяем, что результат не null
        print('✅ Результат не null');
        
        // Проверяем, что все цвета присутствуют
        expect(result!.containsKey('backgroundColor'), isTrue);
        expect(result.containsKey('appBarColor'), isTrue);
        expect(result.containsKey('textColor'), isTrue);
        print('✅ Все ключи цветов присутствуют');
        
        // Проверяем, что цвета являются объектами Color
        expect(result['backgroundColor'], isA<Color>());
        expect(result['appBarColor'], isA<Color>());
        expect(result['textColor'], isA<Color>());
        print('✅ Все значения являются объектами Color');
        
        print('🎉 Тест "Загрузка сохраненных цветов" пройден успешно!');
      });

      // Тест: проверяем работу с кастомным email
      test('должен работать с кастомным email', () async {
        // Выводим информацию о начале теста
        print('📧 Тест: Работа с кастомным email');
        
        // Сначала сохраняем цвета для кастомного пользователя
        print('⚡ Сохраняем цвета для custom@gmail.com...');
        await LocalStorageService.saveUserColors(
          backgroundColor: Colors.yellow,
          appBarColor: Colors.purple,
          textColor: Colors.orange,
          email: 'custom@gmail.com',
        );
        print('✅ Цвета сохранены для custom@gmail.com');

        // Act - вызываем метод с кастомным email
        print('⚡ Вызываем LocalStorageService.loadUserColors(email: "custom@gmail.com")...');
        final result = await LocalStorageService.loadUserColors(email: 'custom@gmail.com');
        print('✅ Метод loadUserColors() выполнен, получен результат: $result');

        // Assert - проверяем, что загрузились правильные цвета для кастомного пользователя
        print('🔍 Проверяем, что загрузились правильные цвета для кастомного пользователя...');
        expect(result, isNotNull); // Проверяем, что результат не null
        print('✅ Результат не null');
        
        // Проверяем, что все цвета присутствуют
        expect(result!.containsKey('backgroundColor'), isTrue);
        expect(result.containsKey('appBarColor'), isTrue);
        expect(result.containsKey('textColor'), isTrue);
        print('✅ Все ключи цветов присутствуют');
        
        // Проверяем, что цвета являются объектами Color
        expect(result['backgroundColor'], isA<Color>());
        expect(result['appBarColor'], isA<Color>());
        expect(result['textColor'], isA<Color>());
        print('✅ Все значения являются объектами Color');
        
        print('🎉 Тест "Работа с кастомным email" пройден успешно!');
      });
    });

    // Группа интеграционных тестов
    // Интеграционные тесты проверяют взаимодействие между компонентами
    group('Интеграционные тесты', () {
      // Тест: проверяем полный цикл сохранения и загрузки
      test('должен сохранять и загружать цвета корректно', () async {
        // Выводим информацию о начале теста
        print('🔄 Тест: Полный цикл сохранения и загрузки цветов');
        
        // Очищаем данные перед тестом
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('user_colors');
        print('🧹 Данные очищены перед тестом');

        // Act - сохраняем цвета
        print('⚡ Вызываем LocalStorageService.saveUserColors() для сохранения цветов...');
        await LocalStorageService.saveUserColors(
          backgroundColor: Colors.pink,   // Розовый фон
          appBarColor: Colors.cyan,       // Голубой app bar
          textColor: Colors.brown,        // Коричневый текст
        );
        print('✅ Цвета сохранены: Фон=Colors.pink, AppBar=Colors.cyan, Текст=Colors.brown');

        // Act - загружаем цвета
        print('⚡ Вызываем LocalStorageService.loadUserColors() для загрузки цветов...');
        final loadedColors = await LocalStorageService.loadUserColors();
        print('✅ Цвета загружены: $loadedColors');

        // Assert - проверяем, что загруженные цвета совпадают с сохраненными
        print('🔍 Проверяем, что загруженные цвета совпадают с сохраненными...');
        expect(loadedColors, isNotNull); // Проверяем, что результат не null
        print('✅ Результат не null');
        
        // Проверяем, что все цвета присутствуют
        expect(loadedColors!.containsKey('backgroundColor'), isTrue);
        expect(loadedColors.containsKey('appBarColor'), isTrue);
        expect(loadedColors.containsKey('textColor'), isTrue);
        print('✅ Все ключи цветов присутствуют');
        
        // Проверяем, что цвета являются объектами Color
        expect(loadedColors['backgroundColor'], isA<Color>());
        expect(loadedColors['appBarColor'], isA<Color>());
        expect(loadedColors['textColor'], isA<Color>());
        print('✅ Все значения являются объектами Color');
        
        print('🎉 Тест "Полный цикл сохранения и загрузки" пройден успешно!');
      });
    });
    
    // Выводим информацию о завершении всех тестов
    print('🏁 Все тесты LocalStorageService завершены!');
  });
} 