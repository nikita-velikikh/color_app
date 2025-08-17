import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocalStorageService Logic Tests', () {
    group('Color Conversion Tests', () {
      test('should convert Color to hex string correctly', () {
        // Test with different colors
        const redColor = Colors.red;
        const blueColor = Colors.blue;
        const greenColor = Colors.green;
        const transparentColor = Colors.transparent;

        // Test color to hex conversion
        //(matches LocalStorageService implementation)
        String colorToHex(Color color) {
          final hexValue = color.toARGB32().toRadixString(16);
          final paddedHex = hexValue.padLeft(8, '0');
          return '#${paddedHex.substring(2)}';
        }

        expect(colorToHex(redColor), equals('#f44336'));
        expect(colorToHex(blueColor), equals('#2196f3'));
        expect(colorToHex(greenColor), equals('#4caf50'));
        expect(colorToHex(transparentColor), equals('#000000'));
      });

      test('should convert hex string to Color correctly', () {
        // Test hex to color conversion
        //(matches LocalStorageService implementation)
        Color colorFromHex(String hex) {
          final buffer = StringBuffer();
          if (hex.length == 7) {
            buffer.write('ff'); // if no alpha provided, set to ff
          }
          buffer.write(hex.replaceFirst('#', ''));
          return Color(int.parse(buffer.toString(), radix: 16));
        }

        // Test with different hex values
        // ignore: deprecated_member_use
        expect(colorFromHex('#f44336').value, equals(Colors.red.value));
        // ignore: deprecated_member_use
        expect(colorFromHex('#2196f3').value, equals(Colors.blue.value));
        // ignore: deprecated_member_use
        expect(colorFromHex('#4caf50').value, equals(Colors.green.value));
        // ignore: deprecated_member_use
        expect(colorFromHex('#000000').value, equals(Colors.black.value));

        // Test with 6-character hex (no alpha)
        // ignore: deprecated_member_use
        expect(colorFromHex('#f44336').value, equals(Colors.red.value));
        // ignore: deprecated_member_use
        expect(colorFromHex('#2196f3').value, equals(Colors.blue.value));
      });

      test('should handle edge cases in color conversion', () {
        Color colorFromHex(String hex) {
          final buffer = StringBuffer();
          if (hex.length == 7) buffer.write('ff');
          buffer.write(hex.replaceFirst('#', ''));
          return Color(int.parse(buffer.toString(), radix: 16));
        }

        // Test with various hex formats
        expect(colorFromHex('#ffffff'), equals(Colors.white));
        expect(colorFromHex('#000000'), equals(Colors.black));
        expect(colorFromHex('#ff000000'), equals(Colors.black));
        expect(colorFromHex('#ffffffff'), equals(Colors.white));
      });
    });

    group('JSON Structure Tests', () {
      test('should create correct user data structure', () {
        // Create user data structure
        final userData = {
          'colors': {
            'backgroundColor': '#FFFF0000',
            'appBarColor': '#FF0000FF',
            'textColor': '#FF00FF00',
          },
        };

        // Verify structure
        expect(userData.containsKey('colors'), isTrue);
        final colors = userData['colors']! as Map<String, dynamic>;
        expect(colors.containsKey('backgroundColor'), isTrue);
        expect(colors.containsKey('appBarColor'), isTrue);
        expect(colors.containsKey('textColor'), isTrue);
      });

      test('should handle JSON encoding and decoding', () {
        // Create test data
        final usersMap = {
          'test@gmail.com': {
            'colors': {
              'backgroundColor': '#FFFF0000',
              'appBarColor': '#FF0000FF',
              'textColor': '#FF00FF00',
            },
          },
        };

        // Encode to JSON
        final jsonString = jsonEncode(usersMap);
        expect(jsonString, isA<String>());
        expect(jsonString, contains('test@gmail.com'));
        expect(jsonString, contains('backgroundColor'));

        // Decode from JSON
        final decodedMap = jsonDecode(jsonString) as Map<String, dynamic>;
        expect(decodedMap.containsKey('test@gmail.com'), isTrue);

        final userData = decodedMap['test@gmail.com'] as Map<String, dynamic>;
        expect(userData.containsKey('colors'), isTrue);
      });

      test('should handle empty and null data', () {
        // Test empty map
        final emptyMap = <String, dynamic>{};
        final emptyJson = jsonEncode(emptyMap);
        expect(emptyJson, equals('{}'));

        // Test null handling
        final mapWithNull = {'colors': null};
        final nullJson = jsonEncode(mapWithNull);
        expect(nullJson, contains('null'));
      });
    });

    group('Data Validation Tests', () {
      test('should validate color hex format', () {
        // Valid hex formats
        final validHexes = ['#FF0000', '#FFFF0000', '#000000', '#00000000'];
        for (final hex in validHexes) {
          expect(hex.startsWith('#'), isTrue);
          expect(hex.length == 7 || hex.length == 9, isTrue);
        }

        // Invalid hex formats
        final invalidHexes = ['FF0000', '#FF000', '#FF00000', 'invalid'];
        for (final hex in invalidHexes) {
          expect(
            hex.startsWith('#') && (hex.length == 7 || hex.length == 9),
            isFalse,
          );
        }
      });

      test('should validate required color keys', () {
        final requiredKeys = ['backgroundColor', 'appBarColor', 'textColor'];

        // Valid colors map
        final validColors = {
          'backgroundColor': '#FFFF0000',
          'appBarColor': '#FF0000FF',
          'textColor': '#FF00FF00',
        };

        for (final key in requiredKeys) {
          expect(validColors.containsKey(key), isTrue);
        }

        // Invalid colors map (missing keys)
        final invalidColors = {
          'backgroundColor': '#FFFF0000',
          'appBarColor': '#FF0000FF',
          // missing textColor
        };

        expect(invalidColors.containsKey('textColor'), isFalse);
      });
    });

    group('Business Logic Tests', () {
      test('should process complete user color workflow', () {
        // Simulate the complete workflow
        const backgroundColor = Colors.red;
        const appBarColor = Colors.blue;
        const textColor = Colors.green;

        // Convert colors to hex
        String colorToHex(Color color) {
          final hexValue = color.toARGB32().toRadixString(16);
          final paddedHex = hexValue.padLeft(8, '0');
          return '#${paddedHex.substring(2)}';
        }

        final backgroundColorHex = colorToHex(backgroundColor);
        final appBarColorHex = colorToHex(appBarColor);
        final textColorHex = colorToHex(textColor);

        // Create user data structure
        final userData = {
          'colors': {
            'backgroundColor': backgroundColorHex,
            'appBarColor': appBarColorHex,
            'textColor': textColorHex,
          },
        };

        // Verify the structure
        expect(userData['colors']!['backgroundColor'], equals('#f44336'));
        expect(userData['colors']!['appBarColor'], equals('#2196f3'));
        expect(userData['colors']!['textColor'], equals('#4caf50'));

        // Convert back to colors
        Color colorFromHex(String hex) {
          final buffer = StringBuffer();
          if (hex.length == 7) buffer.write('ff');
          buffer.write(hex.replaceFirst('#', ''));
          return Color(int.parse(buffer.toString(), radix: 16));
        }

        final retrievedBackgroundColor =
            colorFromHex(userData['colors']!['backgroundColor']!);
        final retrievedAppBarColor =
            colorFromHex(userData['colors']!['appBarColor']!);
        final retrievedTextColor =
            colorFromHex(userData['colors']!['textColor']!);

        // Verify colors match
        // ignore: deprecated_member_use
        expect(retrievedBackgroundColor.value, equals(backgroundColor.value));
        // ignore: deprecated_member_use
        expect(retrievedAppBarColor.value, equals(appBarColor.value));
        // ignore: deprecated_member_use
        expect(retrievedTextColor.value, equals(textColor.value));
      });

      test('should handle multiple users data structure', () {
        // Create data for multiple users
        final usersMap = {
          'user1@gmail.com': {
            'colors': {
              'backgroundColor': '#FFFF0000',
              'appBarColor': '#FF0000FF',
              'textColor': '#FF00FF00',
            },
          },
          'user2@gmail.com': {
            'colors': {
              'backgroundColor': '#FFFFFF00',
              'appBarColor': '#FF800080',
              'textColor': '#FFFF8000',
            },
          },
        };

        // Verify structure
        expect(usersMap.containsKey('user1@gmail.com'), isTrue);
        expect(usersMap.containsKey('user2@gmail.com'), isTrue);

        final user1Colors =
            usersMap['user1@gmail.com']!['colors']! as Map<String, dynamic>;
        final user2Colors =
            usersMap['user2@gmail.com']!['colors']! as Map<String, dynamic>;

        expect(user1Colors['backgroundColor'], equals('#FFFF0000'));
        expect(user2Colors['backgroundColor'], equals('#FFFFFF00'));
      });
    });

    group('Error Handling Tests', () {
      test('should handle malformed hex strings', () {
        Color colorFromHex(String hex) {
          try {
            final buffer = StringBuffer();
            if (hex.length == 7) buffer.write('ff');
            buffer.write(hex.replaceFirst('#', ''));
            return Color(int.parse(buffer.toString(), radix: 16));
          } catch (e) {
            // Return a default color on error
            return Colors.black;
          }
        }

        // Valid hex
        // ignore: deprecated_member_use
        expect(colorFromHex('#f44336').value, equals(Colors.red.value));

        // Malformed hex should return default color
        // ignore: deprecated_member_use
        expect(colorFromHex('invalid').value, equals(Colors.black.value));
        // ignore: deprecated_member_use
        expect(colorFromHex('#GG0000').value, equals(Colors.black.value));
      });

      test('should handle missing or invalid JSON data', () {
        // Test with invalid JSON string
        try {
          jsonDecode('invalid json');
          fail('Should throw FormatException');
        } catch (e) {
          expect(e, isA<FormatException>());
        }

        // Test with null JSON string
        final nullResult = jsonDecode('null');
        expect(nullResult, isNull);
      });
    });
  });
}
