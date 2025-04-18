import 'package:flutter/material.dart';
import 'package:fikratech/core/common/widgets/wavy_appbar.dart';
import 'package:fikratech/featurs/profile/widgets/nav.dart';

class Languages extends StatelessWidget {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const WavyAppBar(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Languages',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const LanguageList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF6C63FF),
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 16),
              child: Nav(
                isStart: false,
                title: 'Languages',
                startIcon: Icons.chevron_left,
                icon: Icons.settings_outlined,
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

class LanguageList extends StatefulWidget {
  const LanguageList({super.key});

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'title': 'English', 'subtitle': 'United States'},
    {'title': 'Español', 'subtitle': 'España'},
    {'title': 'Français', 'subtitle': 'France'},
    {'title': 'Deutsch', 'subtitle': 'Deutschland'},
    {'title': '中文 ', 'subtitle': '中国'},
    {'title': '日本語', 'subtitle': '日本'},
    {'title': 'Русский', 'subtitle': 'Россия'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          languages.map((lang) {
            final isSelected = lang['title'] == selectedLanguage;
            return InkWell(
              onTap: () {
                setState(() {
                  selectedLanguage = lang['title']!;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    const Icon(Icons.language, color: Colors.black),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            lang['subtitle']!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: isSelected ? const Color(0xFF6C63FF) : Colors.grey,
                      size: 26,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}
