import 'package:flutter/material.dart';

class CustomDialogs {
  Future<void> showDeletDialog(
    context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  Icons.delete_outlined,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
                Text('Are you sure, you want to delete?'),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              color: Colors.red,
              child: const Text('Delete',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
