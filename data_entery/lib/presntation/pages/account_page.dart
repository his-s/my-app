import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/main.dart';
import 'package:data_entery/presntation/pages/home_page.dart';
import 'package:data_entery/presntation/widgets/widgets.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:data_entery/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  @override
  void initState() {
    super.initState();
    ref.read(userStateProvider.notifier).getUser();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authStateProvider.notifier);
    final appUser = ref.watch(userStateProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            foregroundColor: Colors.black,
            title: Text(
              'Account Settings',
              style: GoogleFonts.roboto(
                color: Colors.black87,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    appUser.premium ? premiumUser : freeUser,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      width: 1.2,
                      color: getRandomColor(),
                    )),
                  ),
                  child: Text(
                    appUser.name ?? 'Edit Your Name',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: const Icon(Ionicons.mail_outline),
                title: const Text('Email'),
                subtitle: Text(appUser.email),
              ),
              ListTile(
                onTap: () {
                  if (!appUser.premium) {
                    goPremium(context);
                  }
                },
                leading: const Icon(Ionicons.calendar_outline),
                title: appUser.premium
                    ? const Text('Premium')
                    : const Text('Free'),
                subtitle: appUser.premium
                    ? Text(
                        'Premium will end in ${appUser.subscribedAt?.add(Duration(days: appUser.time! * 30))}')
                    : const SizedBox(),
              ),
              ListTile(
                onTap: () async {
                  await auth.logOut().then(
                        (value) => Navigator.pushReplacement(
                          context,
                          customPageRoute(
                            const MyApp(),
                          ),
                        ),
                      );
                },
                leading: const Icon(Ionicons.log_out_outline),
                title: const Text('Logout'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
