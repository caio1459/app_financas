import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message {
  Widget button(BuildContext context, VoidCallback click, String text) {
    final theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: click, child: Text(text));

      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: click, child: Text(text));
    }
  }

  void show({
    required BuildContext context,
    required String title,
    required String text,
  }) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title),
        content: Text(text),
        actions: [
          button(context, () {
            Navigator.pop(context);
          }, "OK")
        ],
      ),
    );
  }
}
