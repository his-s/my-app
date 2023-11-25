import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/presntation/pages/sign_in.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'topics_premium_widget.dart';

class SearchPremiumListWidget extends ConsumerWidget {
  const SearchPremiumListWidget({
    super.key,
    required this.searched,
  });

  final Section searched;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider.notifier);
    return ListTile(
      leading: Image.asset(
        premium,
        scale: 15,
        filterQuality: FilterQuality.medium,
      ),
      tileColor: Colors.grey.shade500,
      title: Text(
        searched.title,
        style: const TextStyle(
          color: Colors.white,
        ),
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
          Navigator.pushReplacement(
            context,
            customPageRoute(
              const SignUp(),
            ),
          );
        }
      },
    );
  }
}
