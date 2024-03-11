import 'package:flutter/material.dart';

class ConfirmExitWidget extends StatelessWidget {
  final Widget child;
  final String destinationRoute;

  const ConfirmExitWidget({
    Key? key,
    required this.child,
    required this.destinationRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        if (exit) {
          // ignore: use_build_context_synchronously
          Navigator.of(context, rootNavigator: true)
              .popAndPushNamed(destinationRoute);
        }
        return false;
      },
      child: child,
    );
  }
}
