import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/main.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final authState = ref.watch(authStateProvider.notifier);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SupaEmailAuth(
            onSignInComplete: (response) async {
              // Perform asynchronous operation (e.g., await authState.signIn(response);)
              await authState.signIn(response);

              // Ensure that the captured context is still valid and the widget is mounted
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  customPageRoute(
                    const MyApp(),
                  ),
                );
              }
            },
            onSignUpComplete: (response) async {
              await authState.signUp(response);
              if (context.mounted) {
                showSnakeBar(context);
                Navigator.pushReplacement(
                  context,
                  customPageRoute(
                    const MyApp(),
                  ),
                );
              }
            },
            metadataFields: [
              MetaDataField(
                prefixIcon: const Icon(Icons.person),
                label: 'Username',
                key: 'username',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter something';
                  }
                  return null;
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

showSnakeBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Confirmation link sent to your email')));
}
