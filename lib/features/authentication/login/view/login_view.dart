import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/authentication_manager/authentication_manager.dart';
import 'package:flutter_architecture_template/core/components/widgets/social/social_adapter.dart';
import 'package:flutter_architecture_template/core/components/widgets/social/social_button.dart';
import 'package:flutter_architecture_template/features/authentication/login/model/login_response_model.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

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
              onComplate: (result) async {
                await AuthenticationManager().login(
                  context,
                  LoginResponseModel(token: 'token'),
                );
              },
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
