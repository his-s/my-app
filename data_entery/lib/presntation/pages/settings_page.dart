import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SliverList.list(children: [
            SettingGroupTile(
              title: 'Account',
              childrens: [
                ListTile(
                  onTap: () {},
                  leading: Icon(Ionicons.person_outline),
                  title: Text('Hisham'),
                  subtitle: Text('admin@gmail.com'),
                  trailing: Icon(Ionicons.chevron_forward),
                )
              ],
            ),
            SettingGroupTile(
              title: 'App Settings',
              childrens: [
                ListTile(
                  onTap: () {},
                  leading: Icon(Ionicons.notifications_outline),
                  title: Text('Notifications'),
                  trailing: Icon(Ionicons.chevron_forward),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Ionicons.notifications_outline),
                  title: const Text('Dark Theme'),
                  trailing:
                      Switch.adaptive(value: false, onChanged: (value) {}),
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}

class SettingGroupTile extends StatelessWidget {
  const SettingGroupTile({
    super.key,
    required this.title,
    required this.childrens,
  });

  final String title;
  final List<Widget> childrens;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: childrens,
            ),
          ),
        ],
      ),
    );
  }
}
