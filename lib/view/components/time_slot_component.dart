import 'package:flutter/material.dart';

import 'custom_text_form.dart';

class TimeSlotComponent extends StatefulWidget {
  const TimeSlotComponent({
    super.key,
    this.icon = const Icon(Icons.add),
    this.onPressed,
    this.width,
    this.initialValue,
    this.readOnly = false,
  });
  final Widget icon;
  final void Function()? onPressed;
  final double? width;
  final String? initialValue;
  final bool readOnly;

  @override
  State<TimeSlotComponent> createState() => _TimeSlotComponentState();
}

class _TimeSlotComponentState extends State<TimeSlotComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
          ),
        ),
        SizedBox(width: widget.width),
        CircleAvatar(
          child: IconButton(
            onPressed: widget.onPressed,
            icon: widget.icon,
          ),
        ),
      ],
    );
  }
}
