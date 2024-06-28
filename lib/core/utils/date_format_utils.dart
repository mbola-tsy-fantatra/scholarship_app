import 'package:intl/intl.dart';
String formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    if (difference.inDays == 0) {
      return DateFormat.Hm().format(dateTime); // Time format for today
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return DateFormat.EEEE().format(dateTime); // Day of the week
    } else if (difference.inDays < 365) {
      return DateFormat.MMMd().format(dateTime); // Month and day
    } else {
      return DateFormat.yMMMd().format(dateTime); // Year, month, and day
    }
  }