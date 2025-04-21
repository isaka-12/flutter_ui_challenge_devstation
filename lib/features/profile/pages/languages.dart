import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  // List of languages
  static const List<String> languages = [
    'Spanish',
    'French',
    'German',
    'Italian',
    'Chinese',
    'Japanese',
    'Russian',
    'Arabic',
    'Portuguese',
    'Korean',
  ];
  static const List<String> suggestedLanguages = [
    'English (US)',
    'English (UK)',
  ];

  // Selected language index and name (English US as default)
  int _selectedLanguageIndex = 0;
  String _selectedLanguage = suggestedLanguages[0];

  // Handle language selection
  void _onLanguageSelected(int index, String language) {
    setState(() {
      _selectedLanguageIndex = index;
      _selectedLanguage = language;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$language selected')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Suggested languages section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 8.0,
              ),
              child: Text(
                'Suggested',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Urbanist',
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: suggestedLanguages.length,
              itemBuilder: (context, index) {
                return _buildLanguageTile(
                  index: index,
                  language: suggestedLanguages[index],
                  isSuggested: true,
                );
              },
            ),
            //height from screen width
            Divider(height: 24, color: Colors.grey[300], thickness: 2),
            // All languages section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 8.0,
              ),
              child: Text(
                'Languages',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Urbanist',
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return _buildLanguageTile(
                  index: index + suggestedLanguages.length,
                  language: languages[index],
                  isSuggested: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build language tile
  Widget _buildLanguageTile({
    required int index,
    required String language,
    required bool isSuggested,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 8.0,
      ),
      title: Text(
        language,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Radio<int>(
        value: index,
        groupValue: _selectedLanguageIndex,
        onChanged: (value) => _onLanguageSelected(index, language),
        activeColor: Theme.of(context).colorScheme.secondary,
        fillColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.secondary,
        ),

        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        toggleable: true,
      ),
      onTap: () => _onLanguageSelected(index, language),
    );
  }
}
