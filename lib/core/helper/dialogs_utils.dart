import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../resources/colors_manager.dart';

class DialogsUtils {
  static Future<T?> showLoadingDialog<T>(
    BuildContext context, {
    required Future<T> Function() action,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: ColorsManager.primaryBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 100),
        child: Container(
          width: 100,
          height: 150,
          padding: const EdgeInsets.all(28),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    color: ColorsManager.orangeColor,
                    strokeWidth: 3,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Loading...', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
    try {
      final result = await action(); // 👈 starts here, after dialog shows
      return result;
    } catch (e) {
      rethrow; // let the caller handle the error
    } finally {
      if (context.mounted) {
        context.pop(context); // 👈 always runs, even on error
      }
    }
  }

  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => context.pop(context),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  static void showTopToast(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 24,
        right: 24,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 1), () {
      entry.remove();
    });
  }

}
