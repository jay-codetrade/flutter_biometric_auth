import 'package:auth/service/service_auth.dart';
import 'package:flutter/material.dart';
import '../home.dart';

class BiometericScreen extends StatelessWidget {
  const BiometericScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          TextButton(
            onPressed: () async {
              print('i');
              final isAuthenticate = await LocalAuthApi.hasBiometrics();
              showDialog(context: context,
                  builder: (context) => AlertDialog(
                    title: Text("ALERT"),
                    content: Column(
                      children: [
                        buildT("biometric", isAuthenticate)
                      ],
                    ),
                  ));
            },
            child: const Text("Check"),
          ),
          TextButton(
            onPressed: () async {
              print('i');
              final isAuthenticate = await LocalAuthApi.authenticate();
              if (isAuthenticate == true) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              } else {
                print('error no auth');
              }
            },
            child: const Text("AUTH"),
          ),
        ],
      )),
    ));
  }

  Widget buildT(String text, bool checked) {
    return Row(
      children: [
        checked ? const Icon(Icons.check) : Icon(Icons.close),
        Text("Biometrics"),
      ],
    );
  }
}
