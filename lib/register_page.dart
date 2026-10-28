import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _birthdateController = TextEditingController();

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _birthdateController.text =
          '${picked.month}/${picked.day}/${picked.year}';
    }
  }

  @override
  void dispose() {
    _birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mokasim Activity 2')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Column(
          children: [
            const CustomTextField(label: 'FullName', icon: Icons.person),
            const CustomTextField(label: 'Username', icon: Icons.account_circle),
            const CustomTextField(
              label: 'Password',
              icon: Icons.lock,
              obscure: true,
            ),
            const CustomTextField(
              label: 'Confirm Password',
              icon: Icons.lock_outline,
              obscure: true,
            ),
            const CustomTextField(label: 'Gender', icon: Icons.male),
            const CustomTextField(label: 'Civil Status', icon: Icons.people),
            CustomTextField(
              label: 'Birthdate',
              icon: Icons.calendar_today,
              controller: _birthdateController,
              readOnly: true,
              onTap: _pickDate,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}