import 'dart:developer';

import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/data/models/code_model.dart';
import 'package:data_entery/main.dart';
import 'package:data_entery/providers/subcription_provider.dart';
import 'package:data_entery/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

InputDecoration getInputDec(String hintText) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    hintText: hintText,
  );
}

class GoPremium extends StatefulWidget {
  const GoPremium({super.key});

  @override
  State<GoPremium> createState() => _GoPremiumState();
}

class _GoPremiumState extends State<GoPremium> {
  late final TextEditingController _code;
  late final TextEditingController _phone;

  @override
  void initState() {
    super.initState();
    _code = TextEditingController();
    _phone = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final subscriptionNotifier = ref.read(subscriptionProvider.notifier);
        final userNotifier = ref.read(userStateProvider.notifier);
        final code = ref.watch(subscriptionProvider);
        return Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset(
                  premium,
                  filterQuality: FilterQuality.medium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              subscriptionNotifier.resetCode();
                            },
                            controller: _code,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            decoration: getInputDec('Inventation Code'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 55,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              await subscriptionNotifier
                                  .checkCode(_code.text.trim());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  checkCode(code) ? Colors.green : Colors.white,
                              foregroundColor:
                                  checkCode(code) ? Colors.white : Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  side: BorderSide(
                                    color: checkCode(code)
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                            ),
                            icon: const Icon(Icons.check),
                            label: const Text('Check'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    checkCode(code)
                        ? Text('This Code Provided By ${code.providerName}')
                        : const SizedBox(),
                    code.isAvailable != null && code.isAvailable == false
                        ? const Text('Code Expired')
                        : const SizedBox(),
                    const SizedBox(
                      height: 5,
                    ),
                    // TextFormField(

                    //   keyboardType: TextInputType.text,
                    //   decoration: getInputDec('Name'),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: getInputDec('Tel Number'),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          try {
                            if (!checkCode(code)) {
                              return;
                            } else {
                              await userNotifier.unlockUserPremium(
                                  code, _phone.text);
                            }
                          } catch (E) {
                            log('');
                          }
                          if (mounted) {
                            Navigator.pushReplacement(
                              context,
                              customPageRoute(
                                const MyApp(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(),
                        ),
                        icon: const Icon(Icons.lock_open),
                        label: const Text('Unlock'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

bool checkCode(Code code) {
  return code.isAvailable != null && code.isAvailable == true;
}
