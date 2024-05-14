import 'package:flutter/material.dart';

class ContactCardItem extends StatelessWidget {
  final GestureTapCallback? onTap;
  final void Function()? onDeleteButton;
  final String imagePath;
  final String name;
  final String type;
  final String description;
  final String? status;
  final Color? color;
  final Color? statusColor;

  const ContactCardItem({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.type,
    this.color,
    this.onDeleteButton,
    this.status,
    this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 65,
              height: 65,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.07,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  type,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            status != null
                ? Text("$status",
                    style: TextStyle(
                        fontSize: 12,
                        color: statusColor,
                        fontWeight: FontWeight.bold))
                : const SizedBox.shrink(),
            onDeleteButton != null
                ? IconButton(
                    onPressed: () => onDeleteButton!.call(),
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                    ))
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
