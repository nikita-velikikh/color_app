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
            SizedBox(height: 110),
            const ButtonsAndLines(),
            SizedBox(height: 32),
            const IconButtons(),
            SizedBox(
              height: 15,
            ),
            const Registration(),
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
          SizedBox(
            height: 41,
            child: TextField(
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
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;

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
          SizedBox(
            height: 41,
            child: TextField(
              obscureText: _isObscure,
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
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 11),
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
                    padding: EdgeInsets.symmetric(vertical: 13),
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

class IconButtons extends StatelessWidget {
  const IconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset('assets/images/github.png', width: 24),
          label: const Text(
            "GitHub",
            style: TextStyle(color: Color.fromARGB(255, 101, 72, 72)),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        const SizedBox(width: 13),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset('assets/images/gitlab.png', width: 24),
          label: const Text(
            "GitLab",
            style: TextStyle(color: Color.fromARGB(255, 96, 58, 58)),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Dont have an account ?",
            style: TextStyle(color: Colors.grey),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Sign up",
                style: TextStyle(color: Colors.deepPurple, fontSize: 14),
              ))
        ],
      ),
    );
  }
}
