import 'package:fikratech/features/profile/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:fikratech/main.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile avatar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    Positioned(
                      bottom: -1,
                      right: -1,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.edit,
                          color: Theme.of(context).colorScheme.primary,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Name fields
            CustomTextField(prefilledText: "Andrew Ainsley"),
            const SizedBox(height: 16),
            CustomTextField(prefilledText: "Andrew"),
            const SizedBox(height: 16),

            // DOB field
            CustomTextField(
              prefilledText: "12/27/1995",
              suffixIcon: Icon(Icons.calendar_today_outlined),
            ),
            const SizedBox(height: 16),

            // Gender field
            CustomTextField(
              prefilledText: "Male",
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 16),

            // Email field
            CustomTextField(
              prefilledText: "andrew_ainsley@yourdomain.com",
              suffixIcon: Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 16),

            // ✅ IntlPhoneField for Phone with dropdown & flag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 250, 250, 1.0),
                borderRadius: BorderRadius.circular(16),
              ),
              child: IntlPhoneField(
                initialCountryCode: 'US',

                initialValue: '1234567890',
                disableLengthCheck: true,
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                dropdownIcon: Icon(
                  Icons.arrow_drop_down,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                dropdownIconPosition: IconPosition.trailing,

                decoration: InputDecoration(border: InputBorder.none),
                onChanged: (phone) {
                  print(phone.completeNumber); // handle updated number
                },
                onCountryChanged: (country) {
                  print('Country changed to: ${country.name}');
                },
              ),
            ),
            const SizedBox(height: 16),

            // Country field
            CustomTextField(
              prefilledText: "United States",
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),

            // Save button
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Handle add new address
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: const Text(
            "Update",
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
