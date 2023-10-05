import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> deleteDialog(
    BuildContext context, String title, String subtitle, Function onYesTap,
    {String buttonName = 'Delete'}) async {
  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(subtitle),
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                        context.theme.textTheme.titleMedium!.color)),
                child: const Text('Cancel')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onYesTap();
                //close Dialog
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                      context.theme.textTheme.titleMedium!.color)),
              child: Text(buttonName),
            )
          ],
        );
      });
}
