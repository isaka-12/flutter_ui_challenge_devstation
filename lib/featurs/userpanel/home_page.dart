import 'package:fikratech/core/common/widgets/wavy_appbar.dart';
import 'package:fikratech/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _users = [
    {
      'name': 'Maria Philbert',
      'email': 'philbert@gmail.com',
      'role': 'Admin',
      'selected': false,
    },
    {
      'name': 'Sifa Obedi',
      'email': 'obedi@gmail.com',
      'role': 'Member',
      'selected': false,
    },
    {
      'name': 'Isaka Isaka',
      'email': 'isaka@gmail.com',
      'role': 'Member',
      'selected': false,
    },
  ];

  String _permissionFilter = 'All';
  String _joinedFilter = 'Anytime';
  int _selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = themeNotifier.value == ThemeMode.dark;
    return Scaffold(
      body: Column(
        children: [
          WavyAppBar(
            title: "Track",
            centerTitle: false,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: null,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: null,
              ),
              // Switch(
              //   value: isDarkMode,
              //   onChanged: (value) {
              //     themeNotifier.value =
              //         value ? ThemeMode.dark : ThemeMode.light;
              //   },
              // ),
              //clickable icon
              IconButton(
                icon: Icon(Icons.dark_mode, color: Colors.white),
                onPressed: () {
                  themeNotifier.value =
                      isDarkMode ? ThemeMode.light : ThemeMode.dark;
                },
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  // Handle settings action
                },
              ),
            ],
          ),
          _buildFiltersSection(),
          _buildUserList(),
          if (_selectedCount > 0) _buildBottomActionBar(),
        ],
      ),
    );
  }

  Widget _buildFiltersSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'User Management',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          //search area with icon
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _permissionFilter,
                  items:
                      ['All', 'Admin', 'Member']
                          .map(
                            (role) => DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      _permissionFilter = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _joinedFilter,
                  items:
                      ['Anytime', 'Last week', 'Last month', 'Last year']
                          .map(
                            (time) => DropdownMenuItem(
                              value: time,
                              child: Text(time),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      _joinedFilter = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 30),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user['email'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color:
                                user['role'] == 'Admin'
                                    ? Colors.blue.withOpacity(0.2)
                                    : Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            user['role'],
                            style: TextStyle(
                              color:
                                  user['role'] == 'Admin'
                                      ? Colors.blue
                                      : Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //the menu icon
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      // Handle menu action
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '$_selectedCount Users selected',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () {
              // Handle suspend action
            },
            child: const Text('Suspend'),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              // Handle export action
            },
            child: const Text('Export'),
          ),
        ],
      ),
    );
  }
}
