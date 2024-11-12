import 'package:flutter/material.dart';

// void main() => runApp(PrivacySettingsApp());

// class PrivacySettingsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PrivacySettingsScreen(),
//     );
//   }
// }

class PrivacySettingsScreen extends StatefulWidget {
  @override
  _PrivacySettingsScreenState createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  // State variables for switches
  bool displayContactInfo = false;
  bool allowConnectionRequests = false;
  bool receiveInvitations = false;
  bool allowProfileDiscovery = false;
  bool allowAlerts = false;

  // State variables for radio buttons
  String profileVisibility = 'Public';
  String directMessageOption = 'Everyone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Visibility Section
            sectionTitle('Profile Visibility'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Public', 'Private', 'My Team'].map((option) {
                return Flexible(
                  child: RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: profileVisibility,
                    onChanged: (value) {
                      setState(() {
                        profileVisibility = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),

            // Toggle Options
            Divider(),
            buildSwitchTile(
                'Display your email and phone number to other users',
                displayContactInfo, (value) {
              setState(() {
                displayContactInfo = value;
              });
            }),
            buildSwitchTile('Allow connection requests from other users',
                allowConnectionRequests, (value) {
              setState(() {
                allowConnectionRequests = value;
              });
            }),
            buildSwitchTile('Receive invitations to join events, tournaments',
                receiveInvitations, (value) {
              setState(() {
                receiveInvitations = value;
              });
            }),
            buildSwitchTile(
                'Allow teams or players to find your profile when searching for participants',
                allowProfileDiscovery, (value) {
              setState(() {
                allowProfileDiscovery = value;
              });
            }),

            // Direct Messages Section
            Divider(),
            sectionTitle('Set who can send you direct messages'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Everyone', 'Teammates', 'None'].map((option) {
                return Flexible(
                  child: RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: directMessageOption,
                    onChanged: (value) {
                      setState(() {
                        directMessageOption = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),

            // Alerts Option
            Divider(),
            buildSwitchTile(
                'Allow alerts via emails & in-app notifications', allowAlerts,
                (value) {
              setState(() {
                allowAlerts = value;
              });
            }),

            // Submit Button
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Implement submission logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Settings saved successfully!')),
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 15, 15, 15), // Dark background for the button
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white, // White text for contrast
                      fontSize: 16.0, // Suitable font size
                      fontWeight: FontWeight.bold, // Bold for emphasis
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for section titles
  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper method to build switch tiles
  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
