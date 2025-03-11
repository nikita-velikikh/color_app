import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final image = AssetImage('assets/images/groupimage.png');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Дает прокрутку, если элементов слишком много
        child: Column(
          mainAxisSize: MainAxisSize.min, //Занимает только нужную высоту
          children: [
            SizedBox(height: 28),
            Center(
              child: Image(image: image),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 29),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi, Wecome Back! 👋",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello again, youve been missed!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            const EmailField(),
            SizedBox(height: 12),
            const PasswordField(),
            SizedBox(height: 7),
            PasswordInfo(),
            SizedBox(height: 70),
            const ButtonsAndLines(),
          ],
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 27, right: 28),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 7),
          TextField(
            decoration: InputDecoration(
              labelText: "Enter Your Email",
              labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 27, right: 28),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 7),
          TextField(
            decoration: InputDecoration(
              labelText: "Enter Your Password",
              labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordInfo extends StatefulWidget {
  const PasswordInfo({super.key});
  @override
  _PasswordInfo createState() => _PasswordInfo();
}

class _PasswordInfo extends State<PasswordInfo> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: 7),
              Text(
                "Remember Me",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonsAndLines extends StatelessWidget {
  const ButtonsAndLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(child: Divider(color: Colors.black, thickness: 0.5)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19),
                child: Text("Or With", style: TextStyle(fontSize: 14)),
              ),
              Expanded(child: Divider(color: Colors.black, thickness: 0.5)),
            ],
          ),
        ],
      ),
    );
  }
}
