import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemed/controllers/authtentication/auth_controller.dart';
import 'package:telemed/widgets/custom_divider.dart';

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
              margin: const EdgeInsets.only(right: 15),
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 30, right: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(children: [
                _buildListTile(Icons.edit_notifications, "Notifications"),
                const CustomDivider(),
                _buildListTile(Icons.book, "Booking"),
                const CustomDivider(),
                _buildListTile(Icons.lock, "Privacy and Security"),
                const CustomDivider(),
                _buildListTile(Icons.dark_mode, "Appearance"),
              ]),
            ),
            const SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 30, right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: _buildListTile(Icons.logout_rounded, "Log Out")),
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
