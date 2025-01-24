import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _guestsController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bali Paradise Resort",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "\$299 /night",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Select Dates',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTimeRange? pickedDate = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    _dateController.text =
                        "${pickedDate.start.toLocal().toString().split(' ')[0]} to ${pickedDate.end.toLocal().toString().split(' ')[0]}";
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select dates';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _guestsController,
                decoration: InputDecoration(
                  labelText: 'Number of Guests',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.people),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of guests';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _cardController,
                decoration: InputDecoration(
                  labelText: 'Card Details',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.credit_card),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter card details';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Process booking logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Booking Successful!"),
                        ),
                      );
                      Navigator.pop(context); // Go back to the previous page
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF4F58FD), Color(0xFF149BF3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      "Confirm Booking",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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