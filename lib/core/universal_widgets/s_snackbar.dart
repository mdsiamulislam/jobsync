import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SSnackbar {
  static void showSuccess(String message) {
    _showSnackbar(
      message,
      backgroundColor: Colors.green[600],
      icon: Icons.check_circle_outline,
    );
  }

  static void showError(String message) {
    _showSnackbar(
      message,
      backgroundColor: Colors.red[600],
      icon: Icons.error_outline,
    );
  }

  static void _showSnackbar(
    String message, {
    required Color? backgroundColor,
    required IconData icon,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Color(backgroundColor!.value),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 8,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        duration: const Duration(seconds: 2),
        messageText: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}