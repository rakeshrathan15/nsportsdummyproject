import 'package:flutter/material.dart';
import 'package:flutterdemo/views/authentication/profile_form.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class ProfileSetupScreen extends StatefulWidget {
  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String? selectedSport;
  String? selectedRole;
  String? selectedPosition;
  String? selectedExperienceLevel;
  String? selectedTeam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set Up Your Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.px,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Personalize your profile',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            _buildSectionTitle('Choose the sport*'),
            _buildSelectableChips(
                ['Cricket', 'Badminton', 'Kabaddi', 'Football'], selectedSport,
                (value) {
              setState(() {
                selectedSport = value;
              });
            }),
            SizedBox(height: 16),
            _buildSectionTitle(
                'Select your role to personalize your experience*'),
            _buildSelectableChips(
                ['Player', 'Coach', 'Organizer'], selectedRole, (value) {
              setState(() {
                selectedRole = value;
              });
            }),
            SizedBox(height: 16),
            _buildDropdownField(
                'Select your position*', ['All-Rounder', 'Batsmen', 'Bowler'],
                (value) {
              setState(() {
                selectedPosition = value;
              });
            }),
            SizedBox(height: 16),
            _buildSectionTitle('Select your experience level*'),
            _buildSelectableChips(['Beginner', 'Intermediate', 'Advanced'],
                selectedExperienceLevel, (value) {
              setState(() {
                selectedExperienceLevel = value;
              });
            }),
            SizedBox(height: 16),
            _buildDropdownField(
                'Select Team (if your team has already registered)',
                ['Team A', 'Team B', 'Team C'], (value) {
              setState(() {
                selectedTeam = value;
              });
            }),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle next button press
                Get.to(() => ProfileForm());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.black,
              ),
              child: Text('Next',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget _buildSelectableChips(List<String> options, String? selectedValue,
      ValueChanged<String> onSelected) {
    return Wrap(
      spacing: 8.0,
      children: options.map((option) {
        return ChoiceChip(
          label: Text(option),
          selected: selectedValue == option,
          onSelected: (isSelected) {
            onSelected(option);
          },
          selectedColor: Colors.black,
          labelStyle: TextStyle(
            color: selectedValue == option ? Colors.white : Colors.black,
          ),
          backgroundColor: Colors.grey[200],
        );
      }).toList(),
    );
  }

  Widget _buildDropdownField(
      String label, List<String> items, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
