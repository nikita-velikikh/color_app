import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class HashingService {
  static String hashPassword(String password) {
    final random = Random();
    final salt = '${random.nextInt(1000000)}!@#\$%^&*ABCxyz';
    final bytes = utf8.encode(password + salt);
    final hash = sha256.convert(bytes);

    return '$salt:${hash.toString()}';
  }

  static Future<bool> verifyPassword(
      String password, String hashedPassword,) async {
    try {
      final parts = hashedPassword.split(':');
      if (parts.length != 2) return false;

      final salt = parts[0];
      final storedHash = parts[1];

      final bytes = utf8.encode(password + salt);
      final hash = sha256.convert(bytes);
      return hash.toString() == storedHash;
    } catch (e) {
      return false;
    }
  }
}
