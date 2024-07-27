
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ScholarshipItem extends StatelessWidget {
  final String id;
  final String name;
  final String officialLink;
  final String description;
  final String profileUrl;
  final String organizationName;
  final DateTime? startApplicationDate;
  final DateTime? endApplicationDate;
  final String fundedType;
  final String applicationStartPeriod;

  const ScholarshipItem({
    Key? key,
    required this.id,
    required this.name,
    required this.officialLink,
    required this.description,
    required this.profileUrl,
    required this.organizationName,
    required this.startApplicationDate,
    required this.endApplicationDate,
    required this.fundedType,
    required this.applicationStartPeriod,
  }) : super(key: key);


  Future<void> _launchUrl() async {
    Uri url = Uri.parse(officialLink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    final String startDate = DateFormat('dd MMMM yyyy').format(startApplicationDate!);
    final String endDate = DateFormat('dd MMMM yyyy').format(endApplicationDate!);

    String status = '';
    Color color = Colors.white;
    Color statusColor = Colors.grey;

    if (endApplicationDate != null && DateTime.now().isBefore(endApplicationDate!)) {
      status = "Open";
      color = Colors.green;
      statusColor = Colors.green.withOpacity(0.5);
    } else if (startApplicationDate != null && DateTime.now().isBefore(startApplicationDate!)) {
      status = "Pending";
      color = Colors.grey;
      statusColor = Colors.grey.withOpacity(0.5);
    } else if (endApplicationDate != null && DateTime.now().isAfter(endApplicationDate!)) {
      status = "Closed";
      color = Colors.red;
      statusColor = Colors.red.withOpacity(0.5);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                "https://images.unsplash.com/photo-1616587896595-51352538155b?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  softWrap: true,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Application date : $startDate - $endDate', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Text(description),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Application period: $applicationStartPeriod', style: const TextStyle(fontWeight: FontWeight.w700),),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: color),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextButton(onPressed: _launchUrl,
                child: const Text("Click here for more information",style: TextStyle(decoration: TextDecoration.underline),)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Aligns children to the end of the row
              children: [
                InkWell(
                  onTap: () {
                    // Handle save action
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Save',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.bookmark_add_outlined,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
