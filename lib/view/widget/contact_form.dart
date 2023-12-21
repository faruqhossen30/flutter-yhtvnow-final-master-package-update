import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
      children: [
        TextFormField(
          controller: _nameController,
        ),
      ],
    ));
  }
}
