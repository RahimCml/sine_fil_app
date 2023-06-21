import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _nameController;
  late TextEditingController _surNameController;
  late TextEditingController _mailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _surNameController = TextEditingController();
    _mailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surNameController.dispose();
    _mailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.secondarycolor,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Text(
                'Register Page',
                style: TextStyle(color: ConstantColor.kMainColor, fontSize: 28),
              )),
              const SizedBox(height: 40.0),
              TextField(
                controller: _nameController,
                style: TextStyle(color: ConstantColor.kMainColor),
                decoration: InputDecoration(
                    labelText: 'Isim',
                    labelStyle: TextStyle(color: ConstantColor.kMainColor),
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _surNameController,
                style: TextStyle(color: ConstantColor.kMainColor),
                decoration: InputDecoration(
                    labelText: 'Nik name',
                    labelStyle: TextStyle(color: ConstantColor.kMainColor),
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _mailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: ConstantColor.kMainColor),
                decoration: InputDecoration(
                    labelText: 'mail',
                    labelStyle: TextStyle(color: ConstantColor.kMainColor),
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: ConstantColor.kMainColor),
                decoration: InputDecoration(
                    labelText: 'sifre',
                    labelStyle: TextStyle(color: ConstantColor.kMainColor),
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(height: 20.0),

              TextButton(onPressed: (){}, child: Text('Kayd ol',style: TextStyle(color: ConstantColor.kMainColor),))
            ],
          )),
    );
  }
}
