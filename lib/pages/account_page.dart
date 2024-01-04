import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemed/controllers/authtentication/auth_controller.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            onPressed: () {
              // Add your edit button functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    // Add your avatar image or initials here
                    radius: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Your Name",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "your.email@example.com",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                _buildListTile(Icons.notifications, "Notifications"),
                _buildListTile(Icons.book, "Booking"),
                _buildListTile(Icons.lock, "Privacy and Security"),
                _buildListTile(Icons.dark_mode, "Appearance"),
              ]),
            ),
            const SizedBox(height: 20),
            _buildListTile(Icons.logout_rounded, "Log Out"),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData leadingIcon, String title) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        if (title == "Log Out") {
          AuthController.instance.logout();
          debugPrint("Loged Out");
        } else if (title == "Notifications") {
          debugPrint("notifications");
        } else if (title == "Booking") {
          debugPrint("Bookin");
        } else if (title == "Privacy and Security") {
          debugPrint("Privacy and Security");
        } else if (title == "Appearance") {
          debugPrint("Appearance");
        }
        // Add functionality for each list item
      },
    );
  }
}
