import 'package:flutter/material.dart';

class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Function()? onTap;

  const ProfileDetailRow({Key? key, required this.icon, required this.label, required this.value, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            SizedBox(width: 16),
            Text(
              '$label:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (onTap != null) Icon(Icons.edit, size: 16, color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}