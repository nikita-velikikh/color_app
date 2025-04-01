import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 28),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 7),
          SizedBox(
            height: 41,
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword && _isObscure,
              decoration: InputDecoration(
                labelText: widget.hintText,
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                suffixIcon: widget.isPassword
                    ? Padding(
                        padding: const EdgeInsets.only(right: 11),
                        child: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
