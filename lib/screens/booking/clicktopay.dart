import 'package:flutter/material.dart';
import 'dart:async';

class ClicToPayApp extends StatefulWidget {
  final double totalPrice;

  ClicToPayApp({required this.totalPrice});

  @override
  _ClicToPayAppState createState() => _ClicToPayAppState();
}

class _ClicToPayAppState extends State<ClicToPayApp> {
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  

  String _selectedMonth = '03';
  String _selectedYear = '2025';
  int _countdownSeconds = 815;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdownSeconds > 0) {
        if (mounted) {
          setState(() {
            _countdownSeconds--;
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatCountdown(int seconds) {
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}m:${remainingSeconds.toString().padLeft(2, '0')}s';
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  bool isValidCardNumber(String cardNumber) {
    cardNumber = cardNumber.replaceAll(' ', '');
    if (cardNumber.length < 13 || cardNumber.length > 19) return false;

    int sum = 0;
    bool alternate = false;
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);
      if (alternate) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  bool isValidCVV(String cvv) {
    return RegExp(r'^\d{3,4}$').hasMatch(cvv);
  }

  bool isDateValid() {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    int selectedYear = int.parse(_selectedYear);
    int selectedMonth = int.parse(_selectedMonth);

    return (selectedYear > currentYear) ||
        (selectedYear == currentYear && selectedMonth >= currentMonth);
  }

  void processPayment() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing payment...')),
      );
      Future.delayed(Duration(seconds: 2), () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment successful!')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Image.asset('assets/clickk.png',
          width: screenWidth *.5  ,
              height: screenWidth ,),
          
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: 
      SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, // Masquer le clavier au scroll
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Summary of your order',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              buildSummaryRow('Order', 'REF492981-183065528'),
              buildSummaryRow('Merchant', 'TravelMate'),
              buildSummaryRow('Purchase Amount',
                  '${widget.totalPrice.toStringAsFixed(2)} dt'),
              buildSummaryRow('Purchase Date',
                  '${DateTime.now().toString().split(' ')[0]} ${DateTime.now().toString().split(' ')[1].substring(0, 5)}'),
              SizedBox(height: 20),
              Text('Payment expires in: ${formatCountdown(_countdownSeconds)}',
                  style: TextStyle(color: Colors.red)),
              SizedBox(height: 20),
              buildTextField('Customer', controller: _customerController),
              buildTextField('Email',
                  controller: _emailController,
                  validator: (value) =>
                      isValidEmail(value!) ? null : "Invalid email"),
              buildTextField('Card number',
                  controller: _cardNumberController,
                  validator: (value) =>
                      isValidCardNumber(value!) ? null : "Invalid card number"),
              buildTextField('CVV2/Internet ID',
                  controller: _cvvController,
                  isPassword: true,
                  validator: (value) =>
                      isValidCVV(value!) ? null : "Invalid CVV"),
              Row(
                children: [
                  Expanded(
                    child: buildDropdown('Month', [
                      '01', '02', '03', "04", "05", "06", "07", "08", "09",
                      "10", "11", '12'
                    ], onChanged: (value) {
                      setState(() {
                        _selectedMonth = value!;
                      });
                    }, value: _selectedMonth),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDropdown('Year', [
                      '2025', '2026', '2027', '2028', '2029', '2030'
                    ], onChanged: (value) {
                      setState(() {
                        _selectedYear = value!;
                      });
                    }, value: _selectedYear),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: processPayment,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Pay', style: TextStyle(fontSize: 18)),
                ),
                
              ),
            ],
            
          ),
          
        ),
      
      ),
      ),
    );
  }

  Widget buildSummaryRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget buildTextField(String label,
      {bool isPassword = false,
      required TextEditingController controller,
      String? Function(String?)? validator}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildDropdown(String hint, List<String> items,
      {required ValueChanged<String?> onChanged, required String value}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(),
      ),
      value: value,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
