import 'package:flutter/material.dart';

class SingUpPasswordField extends StatefulWidget {
  final String? label;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  const SingUpPasswordField({
    super.key,
    this.label,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    required this.onChanged,
    this.validator,
  });
  @override
  State<SingUpPasswordField> createState() => _SingUpPasswordField();
}
class _SingUpPasswordField extends State<SingUpPasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 28),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 7),
          ],
          TextFormField(
            onChanged: (email) {
              widget.onChanged(email);
            },
            controller: widget.controller,
            obscureText: widget.isPassword && _isObscure,
            validator: widget.validator,
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
              errorStyle: TextStyle(color: Colors.red),
              suffixIcon: widget.isPassword
                  ? Padding(
                      padding: const EdgeInsets.only(right: 11),
                      child: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
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
        ],
      ),
    );
  }
}
