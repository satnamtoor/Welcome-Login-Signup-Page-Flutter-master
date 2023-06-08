import 'package:flutter/material.dart';

class CustomWidgets {

  static buildErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ),
    );
  }
}