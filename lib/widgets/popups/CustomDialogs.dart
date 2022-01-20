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

  Future<void> showOrderRecieved(context, onOK) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Order Recieved'),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
                onOK();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showOrderDelivered(context, onOK) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Order Delivered'),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
                onOK();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showAuthFailedDialog(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  Icons.error_outline,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Authentication Failed Please log in again'),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
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

  Future<void> showSuccessDialog(context, onOK) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Success'),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
                onOK();
              },
            ),
          ],
        );
      },
    );
  }
}
