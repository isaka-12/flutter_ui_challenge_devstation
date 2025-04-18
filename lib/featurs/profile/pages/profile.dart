import 'package:flutter/material.dart';
import 'package:fikratech/core/common/widgets/wavy_appbar.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:fikratech/featurs/profile/widgets/nav.dart';
import 'package:fikratech/main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isDarkMode = themeNotifier.value == ThemeMode.dark;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isDarkMode = themeNotifier.value == ThemeMode.dark;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const WavyAppBar(),
                Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 24),
                      decoration: BoxDecoration(
                        color: _isDarkMode ? Colors.black : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 72, 24, 24),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 8),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: ProfileForm(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -30,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: const Color(0xFF6C63FF),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/avatar.jpg',
                            fit: BoxFit.cover,
                            width: 137,
                            height: 137,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Color(0xFF6C63FF),
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 0),
              child: Nav(
                isStart: false,
                title: 'My Profile',
                startIcon: Icons.chevron_left,
                onIconTap: () {
                  Navigator.pushNamed(context, '/notifications');
                },
                icon: Icons.notifications_outlined,
                onStartIconTap: () {
                  Navigator.pop(context);
                },
                isLast: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        _birthDateController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  Widget buildFormField(
    BuildContext context,
    String label,
    String hint,
    TextEditingController controller, {
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6C63FF),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 15,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6C63FF)),
                borderRadius: BorderRadius.circular(11.75),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6C63FF), width: 2.0),
                borderRadius: BorderRadius.circular(11.75),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.75),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6C63FF),
        ),
      ),
    );
  }

  void _saveProfile() {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _birthDateController.text.isEmpty ||
        _selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFormField(
          context,
          "First Name",
          "Enter your first name",
          _firstNameController,
        ),
        buildFormField(
          context,
          "Last Name",
          "Enter your last name",
          _lastNameController,
        ),
        buildFormField(
          context,
          "Username",
          "Enter your username",
          _usernameController,
        ),
        buildFormField(
          context,
          "Email",
          "Enter your email",
          _emailController,
          keyboardType: TextInputType.emailAddress,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLabel("Phone number"),
            const SizedBox(height: 8),
            SizedBox(
              height: 70,
              child: IntlPhoneField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.75),
                    borderSide: BorderSide(color: Color(0xFF6C63FF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.75),
                    borderSide: BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 2.0,
                    ),
                  ),
                ),
                initialCountryCode: 'TZ',
                onChanged: (phone) {},
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLabel("Birth date"),
            const SizedBox(height: 8),
            SizedBox(
              height: 60,
              child: TextField(
                controller: _birthDateController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  hintText: "Select your birth date",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 15,
                  ),
                  suffixIcon: const Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6C63FF)),
                    borderRadius: BorderRadius.circular(11.75),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(11.75),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.75),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLabel("Gender"),
            const SizedBox(height: 8),
            SizedBox(
              height: 60,
              child: DropdownButtonFormField<String>(
                value: _selectedGender,
                items:
                    ['Male', 'Female', 'Other']
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ),
                        )
                        .toList(),
                onChanged: (value) => setState(() => _selectedGender = value),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 15,
                  ),
                  hintText: "Select gender",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6C63FF)),
                    borderRadius: BorderRadius.circular(11.75),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6C63FF),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(11.75),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.75),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),

        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: _saveProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6C63FF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.75),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 24),
                SizedBox(width: 8),
                Text(
                  'Change Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
