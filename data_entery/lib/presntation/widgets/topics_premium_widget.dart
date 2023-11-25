import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/presntation/pages/sign_in.dart';
import 'package:data_entery/presntation/widgets/widgets.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicsPremiumListTileWidget extends ConsumerWidget {
  const TopicsPremiumListTileWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider.notifier);
    return ListTile(
      tileColor: Colors.grey,
      contentPadding:
          const EdgeInsets.only(right: 0, left: 10, top: 2, bottom: 2),
      title: Text(
        title,
        style: GoogleFonts.roboto(color: Colors.white),
      ),
      leading: Image.asset(
        premium,
        filterQuality: FilterQuality.medium,
      ),
      subtitle: const Text(
        'For Premium User Only',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: () {
        if (auth.user) {
          goPremium(context);
        } else {
          Navigator.pushReplacement(context, customPageRoute(const SignUp()));
        }
      },
      trailing: const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.lock,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

void goPremium(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const GoPremium();
    },
  );
}
