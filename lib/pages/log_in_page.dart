import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/color.dart';
import 'package:sine_fil_app/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.secondarycolor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'WELLCOME TO SINEFIL!',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: ConstantColor.kMainColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: ConstantColor.kMainColor),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: ConstantColor.kMainColor),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ConstantColor.kMainColor)),
                  onPressed: () {
                    // Perform login logic here
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(color: ConstantColor.secondarycolor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) {
                      return const RegisterPage();
                    }));
                  },
                  child: Text('Register',
                      style: TextStyle(color: ConstantColor.kMainColor)),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to password reset page
                  },
                  child: Text('Forgot Password?',
                      style: TextStyle(color: ConstantColor.kMainColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
