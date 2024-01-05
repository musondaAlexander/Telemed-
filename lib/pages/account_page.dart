import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemed/controllers/authtentication/auth_controller.dart';
import 'package:telemed/data/json.dart';
import 'package:telemed/pages/booking_page.dart';
import 'package:telemed/widgets/avatar_image.dart';
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AvatarImage(chatsData[0]["image"].toString()),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Alexander",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "alexander@example.com",
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
                // pass right orange as color
                _buildListTile(
                  Icons.notifications,
                  "Notifications",
                  const Color.fromARGB(255, 241, 162, 83),
                  const Color.fromARGB(255, 241, 162, 83),
                ),
                const CustomDivider(),
                _buildListTile(Icons.book, "Booking", Colors.lightGreen,
                    Colors.lightGreen),
                const CustomDivider(),
                _buildListTile(
                  Icons.lock,
                  "Privacy and Security",
                  Colors.redAccent,
                  Colors.redAccent,
                ),
                const CustomDivider(),
                _buildListTile(Icons.dark_mode, "Appearance", Colors.lightBlue,
                    Colors.lightBlue),
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
                child: _buildListTile(
                    Icons.logout_rounded, "Log Out", Colors.grey, Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
    IconData leadingIcon,
    String title,
    Color iconColor,
    Color backgroundColor,
  ) {
    return ListTile(
      contentPadding:
          const EdgeInsets.all(0), // Remove default ListTile padding
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            leadingIcon,
            color: iconColor,
          ),
        ),
      ),
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        if (title == "Log Out") {
          AuthController.instance.logout();
          debugPrint("Loged Out");
        } else if (title == "Notifications") {
          debugPrint("notifications");
        } else if (title == "Booking") {
          Get.to(() => const BookingPage());
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
