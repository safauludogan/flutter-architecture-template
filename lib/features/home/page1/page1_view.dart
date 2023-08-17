import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/authentication_manager/authentication_manager.dart';
import 'package:flutter_architecture_template/core/init/styles/textstyles.dart';
import 'package:flutter_architecture_template/features/authentication/login/model/login_response_model.dart';
import 'package:flutter_architecture_template/product/manager/database/operations/login_hive_operation.dart';
import 'package:flutter_architecture_template/product/manager/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class Page1View extends StatefulWidget {
  const Page1View({super.key});

  @override
  State<Page1View> createState() => _Page1ViewState();
}

class _Page1ViewState extends State<Page1View> {
  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  Future<void> getLoginData() async {
    await _loginHiveOperation.open();
    final result = _loginHiveOperation.getItem(LoginResponseModel().key);
    print(result?.key);
    print(result?.token);
  }

  final _loginHiveOperation = LoginHiveOperation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.read<ThemeManager>().changeTheme(),
              style: Styles.buttonStyle,
              child: const Text(
                'Change Theme',
              ),
            ),
            IconButton(
              onPressed: () async {
                await AuthenticationManager().logOut();
              },
              icon: const Icon(Icons.login_rounded),
            ),
            TextButton(
              onPressed: () async {
                await _loginHiveOperation.clear();
              },
              child: Text('Delete', style: Styles.textStyle),
            )
          ],
        ),
      ),
    );
  }
}
