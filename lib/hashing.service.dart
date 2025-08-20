import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

/// Service for password hashing and verification using SHA-256 with salt
class HashingService {
  /// Hashes a password using SHA-256 with a random salt for security
  static String hashPassword(String password) {
    final random = Random();
    final salt = '${random.nextInt(1000000)}!@#\$%^&*ABCxyz';
    final bytes = utf8.encode(password + salt);
    final hash = sha256.convert(bytes);

    return '$salt:$hash';
  }

  /// Verifies a password by comparing it with the stored hashed password
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
