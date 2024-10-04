import 'package:flutter/material.dart';

class BackNavigationWrapper extends StatelessWidget {
  final Widget child;

  const BackNavigationWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldLeave = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Confirm Exit"),
            content: const Text("Do you really want to leave this page?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(true), // User wants to exit
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), // User does not want to exit
                child: const Text("No"),
              ),
            ],
          ),
        );

        return shouldLeave ?? false; // Return true or false based on user choice
      },
      child: child,
    );
  }
}
