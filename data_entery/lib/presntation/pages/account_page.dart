import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/main.dart';
import 'package:data_entery/presntation/widgets/widgets.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:data_entery/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:data_entery/core/extensions.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset(
                      appUser.premium ? premiumUser : freeUser,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: const Icon(Ionicons.person_outline),
                title: Text(appUser.name?.title ?? ""),
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.edit_outlined,
                //   ),
                // ),
              ),
              ListTile(
                leading: const Icon(Ionicons.mail_outline),
                title: const Text('Email'),
                subtitle: Text(appUser.email),
              ),
              ListTile(
                onTap: !appUser.premium
                    ? () {
                        goPremium(context);
                      }
                    : null,
                leading: const Icon(Ionicons.calendar_outline),
                title: appUser.premium
                    ? const Text('Premium')
                    : const Text('Free'),
                subtitle: appUser.premium
                    ? Text(
                        appUser.subscribedAt?.premium(appUser.time ?? 0) ?? '')
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
