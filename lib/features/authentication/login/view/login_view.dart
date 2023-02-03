import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/widgets/social/social_adapter.dart';
import 'package:flutter_architecture_template/core/components/widgets/social/social_button.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(
              socialAdapter: FacebookAdapter(),
              onComplate: print,
            ),
            SocialButton(
              socialAdapter: GoogleAdapter(),
              onComplate: print,
            ),
            SocialButton(
              socialAdapter: AppleAdapter(),
              onComplate: print,
            ),
          ],
        ),
      ),
    );
  }
}
