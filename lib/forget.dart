import 'package:flutter/material.dart';

class ForgetPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>(); 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
      ),
     
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Page Title
            Text(
              "Reset Your Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          
            SizedBox(height: 30),
            // Email TextField SizedBox(height: 20),
             
            TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
              SizedBox(height: 20),
            // Instruction Text
            Text(
              "Enter your email address below to receive a password reset link.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
           SizedBox(height: 40),
                  GestureDetector(
                   onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/verify');
                  }
                },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 123, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4F58FD), Color(0xFF149BF3)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "Reset Link",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            // Back to Login
                Center(
                  child: GestureDetector(
                      onTap: () 
                      {
                        
                        Navigator.pushNamed(context, '/login');
                        
                      },
                      child: Text(
                        "Back to login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                ),
          ],
          ),
        ),
      ),
    );
  }
                  
}
