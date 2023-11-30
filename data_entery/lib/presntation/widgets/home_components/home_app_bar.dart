import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/presntation/pages/account_page.dart';
import 'package:data_entery/presntation/pages/search_page.dart';
import 'package:data_entery/presntation/pages/sign_in.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: true,
      title: Text(
        "QuickToBe",
        style: GoogleFonts.roboto(),
      ),
      actions: [
        Consumer(
          builder: (_, WidgetRef ref, __) {
            final authState = ref.watch(authStateProvider.notifier);

            return IconButton(
              onPressed: () {
                if (authState.user) {
                  navigate(const AccountPage(), context);
                } else {
                  navigate(const SignUp(), context);
                }
              },
              icon: const Icon(Ionicons.person_circle_outline),
            );
          },
        ),
      ],
      foregroundColor: Colors.black,
      floating: true,
      centerTitle: true,
      leadingWidth: 45,
      pinned: true,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            customPageRoute(
              const SearchPage(),
            ),
          );
        },
        icon: const Icon(Ionicons.search),
      ),
    );
  }
}
