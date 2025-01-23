import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
  bool isCodeComplete = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_checkCodeCompletion);
    }
  }

  void _checkCodeCompletion() {
    setState(() {
      isCodeComplete = _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Check your email",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Enter the code mentioned in the email.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
         Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: List.generate(5, (index) {
    return Container(
      width: screenWidth * 0.12,
      height: screenWidth * 0.12,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 4) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              _focusNodes[index].unfocus();
            }
          }
        },
      ),
    );
  }),
),

            SizedBox(height: 50),
            GestureDetector(
              onTap: isCodeComplete
                  ? () {
                      Navigator.pushNamed(context, '/login');
                    }
                  : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isCodeComplete
                        ? [Color(0xFF4F58FD), Color(0xFF149BF3)]
                        : [Colors.grey, Colors.grey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Add logic to resend email
              },
              child: Text(
                "Haven't got the email yet? Resend email",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
