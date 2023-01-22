import 'package:flutter/material.dart';

class RequestDialog extends StatefulWidget {
  bool chosen;

  RequestDialog(this.chosen, {super.key});
  @override
  State<RequestDialog> createState() => _RequestDialogueState();
}

class _RequestDialogueState extends State<RequestDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('You want to walk with this person?'),
      content: const Text(
        "Your information will be shared should you choose \"Yes\"",
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            setState(
              () {
                widget.chosen = !widget.chosen;
              },
            );
            Navigator.pop(context, widget.chosen);
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
