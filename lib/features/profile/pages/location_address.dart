import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AdressPage extends StatelessWidget {
  const AdressPage({super.key});

  final List<Map<String, String>> locations = const [
    {"name": "Home", "address": "Times Square NYC, Manhattan, 27"},
    {"name": "My Office", "address": "5259 Blue Bill Park, PC 4627"},
    {"name": "My Appartment", "address": "21833 Clyde Gallagher, PC 4662"},
    {"name": "My House", "address": "21833 Clyde Gallagher, PC 4662"},
    {"name": "Parents' House", "address": "6993 Meadow Valley Terra, PC 36"},
    {"name": "My Villa", "address": "61480 Sunbrook Park, PC 5679"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Address",
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(214, 250, 232, 0.658),
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Text(
                              location["name"]!,
                              style: const TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (location["name"] == "Home") ...[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                    214,
                                    250,
                                    232,
                                    0.658,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "default ",
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          location["address"]!,
                          style: const TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            color: Color.fromRGBO(97, 97, 97, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(IconlyBold.edit),
                    color: Theme.of(context).colorScheme.secondary,
                    iconSize: 20,
                    onPressed: () {
                      // Handle edit
                    },
                  ),
                ],
              ),
            ),
          );
        },
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
            "Add New Address",
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
