import 'package:flutter/material.dart';
import 'package:flutter_practical_project/screens/SearchView.dart';
import 'package:flutter_practical_project/screens/Setting.dart';
import 'package:flutter_practical_project/screens/login.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  final String email;
  final String password;
  final String name;
  Homescreen(
      {super.key,
      required this.email,
      required this.name,
      required this.password});
  List<String> image = [
    "BBQ_mixed.jpg",
    "buffalo_chicken.jpg",
    "BBQ_mixed.jpg",
    "buffalo_chicken.jpg",
    "BBQ_mixed.jpg",
    "buffalo_chicken.jpg",
    "BBQ_mixed.jpg",
    "buffalo_chicken.jpg",
    "BBQ_salad.jpg",
    "buffalo_chicken.jpg",
    "butterchicken.jpg",
    "chicken_briyani.jpg",
    "butterchicken.jpg",
    "chicken_briyani.jpg",
    "butterchicken.jpg",
    "chicken_briyani.jpg",
    "butterchicken.jpg",
    "chicken_briyani.jpg",
    "chinese.jpg",
    "chicken_briyani.jpg",
    "chinese.jpg",
    "chocolate.jpg",
    "chinese.jpg",
    "chocolate.jpg",
    "chinese.jpg",
    "chocolate.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text('Search clicked')),
              // );
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchView()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications clicked')),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/ahmed.jpg")),
                  const SizedBox(height: 10),
                  Text(
                    'Hi $name!',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    email,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SettingScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LOG OUT'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Login(
                                  email: email,
                                  password: password,
                                  name: name)));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Logged out successfully')),
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                  barrierDismissible: true,
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset("assets/images/desatr.jpg"),
            );
          },
        ),
      ),
    );
  }
}
