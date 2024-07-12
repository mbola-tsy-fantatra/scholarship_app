import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


@RoutePage()
class PersonalProfileScreen extends StatefulWidget {
  final String profileId;
  const PersonalProfileScreen({super.key, @PathParam('profileId') required this.profileId});

  @override
  _PersonalProfileScreenState createState() => _PersonalProfileScreenState();
}

class _PersonalProfileScreenState extends State<PersonalProfileScreen> {
  // Static data for demonstration
  String profilePictureUrl = 'https://example.com/profile.jpg';
  String name = 'Mitsuri';
  String bio = 'A passionate developer with a love for coding and innovation.';
  String dateOfBirth = '2024-06-25T06:22:14.522Z';  // ISO format
  String country = 'USA';
  String studyLevel = "Master's Degree";
  List<String> desiredStudyCountries = ['Germany', 'Canada', 'Australia'];

  // Method to format date
  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('MMMM dd, yyyy – hh:mm a').format(dateTime);
  }

  // Method to pick a new date
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.parse(dateOfBirth);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != initialDate) {
      setState(() {
        dateOfBirth = picked.toIso8601String();
      });
    }
  }

  // Method to edit profile text properties
  Future<void> _editText(BuildContext context, String field, String initialValue, Function(String) onSave) async {
    TextEditingController controller = TextEditingController(text: initialValue);
    return showDialog<void>(
      context: context,
      barrierDismissible: false,  // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter new $field"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                onSave(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDate(dateOfBirth);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.back();
          },
        ),
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _editText(context, "Profile Picture URL", profilePictureUrl, (value) {
                    setState(() {
                      profilePictureUrl = value;
                    });
                  });
                },
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/yor.jpg"),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  _editText(context, "Name", name, (value) {
                    setState(() {
                      name = value;
                    });
                  });
                },
                child: Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  _editText(context, "Bio", bio, (value) {
                    setState(() {
                      bio = value;
                    });
                  });
                },
                child: Text(
                  bio,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              ProfileDetailRow(
                icon: Icons.cake,
                label: 'Date of Birth',
                value: formattedDate,
                onTap: () => _selectDate(context),
              ),
              ProfileDetailRow(
                icon: Icons.flag,
                label: 'Country',
                value: country,
                onTap: () {
                  _editText(context, "Country", country, (value) {
                    setState(() {
                      country = value;
                    });
                  });
                },
              ),
              ProfileDetailRow(
                icon: Icons.school,
                label: 'Study Level',
                value: studyLevel,
                onTap: () {
                  _editText(context, "Study Level", studyLevel, (value) {
                    setState(() {
                      studyLevel = value;
                    });
                  });
                },
              ),
              ProfileDetailRow(
                icon: Icons.map,
                label: 'Desired Study Countries',
                value: desiredStudyCountries.join(', '),
                onTap: () {
                  _editText(context, "Desired Study Countries", desiredStudyCountries.join(', '), (value) {
                    setState(() {
                      desiredStudyCountries = value.split(',').map((e) => e.trim()).toList();
                    });
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
