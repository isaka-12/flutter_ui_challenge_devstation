import 'package:fikratech/core/common/widgets/wavy_appbar.dart';
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
    return Scaffold(
      body: Column(
        children: [
          WavyAppBar(
            title: "Fikra",
            centerTitle: false,
            leading: CircleAvatar(
              radius: 48,
              backgroundColor: const Color(0xFF6C63FF),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/fikra.jpg',
                  fit: BoxFit.cover,
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/view-profile');
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
    const borderColor = Color(0xFF6C63FF);

    OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: borderColor, width: 1.5),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'User Management',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              enabledBorder: customBorder,
              focusedBorder: customBorder,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
          ),
          const SizedBox(height: 12),
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
                    hintText: 'Permission',
                    enabledBorder: customBorder,
                    focusedBorder: customBorder,
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
                    hintText: 'Joined',
                    enabledBorder: customBorder,
                    focusedBorder: customBorder,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(40, 55),
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                ),
                child: const Icon(Icons.add, size: 24),
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
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                radius: 28,
                child: Icon(Icons.person, size: 28),
              ),
              title: Text(
                user['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user['email'], style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          user['role'] == 'Admin'
                              ? Colors.blue.shade50
                              : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      user['role'],
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            user['role'] == 'Admin'
                                ? Colors.blue
                                : Colors.grey[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  // Handle more actions
                },
              ),
              onTap: () {
                // Optional: Toggle selection or show user details
              },
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
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '$_selectedCount selected',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () {
              // Suspend selected
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Suspend'),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              // Export selected
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Export'),
          ),
        ],
      ),
    );
  }
}
