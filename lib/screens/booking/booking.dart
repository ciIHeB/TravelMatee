import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingPage extends StatefulWidget 
{
  final double basePrice;

  BookingPage({required this.basePrice});

  @override
  BookingPageState createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  final TextEditingController _dateController = TextEditingController();
  int _adults = 1;
  int _children = 0;
  int _infants = 0;
  double totalPrix = 0.0;
  DateTimeRange? _selectedDateRange;

  @override
  void initState() {
    super.initState();
    calculateTotalPrix();
  }

  void calculateTotalPrix() {
    double total = 0.0;
    int days = _selectedDateRange != null
        ? _selectedDateRange!.duration.inDays + 1
        : 1;

    total += _adults * widget.basePrice * days;
    total += _children * (widget.basePrice * 0.8) * days;
    total += _infants * (widget.basePrice * 0.6) * days;

    setState(() {
      totalPrix = total;
    });
  }

  void _onBookNow() {
    if (_selectedDateRange == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select dates before booking!")),
      );
      return;
    }
    Navigator.pushNamed(context, '/clictopay', arguments: totalPrix);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("From", style: TextStyle(fontWeight: FontWeight.bold)),
            _buildDropdown(["Tunis (TUN)", "Jerba (TUN)", "Nfidha (TUN)"]),
            SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Select Dates *',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTimeRange? pickedDate = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDateRange = pickedDate;
                    _dateController.text =
                        "${pickedDate.start.toLocal().toString().split(' ')[0]} to ${pickedDate.end.toLocal().toString().split(' ')[0]}";
                  });
                  calculateTotalPrix();
                }
              },
            ),
            SizedBox(height: 20),
            _buildCounter("Adults", _adults, (value) {
              setState(() => _adults = value);
              calculateTotalPrix();
            }),
            _buildCounter("Children  -20%", _children, (value) {
              setState(() => _children = value);
              calculateTotalPrix();
            }),
            _buildCounter("Infants    -40%", _infants, (value) {
              setState(() => _infants = value);
              calculateTotalPrix();
            }),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _onBookNow,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.blue,
                ),
                child: Text("Book Now",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Total Price: ${totalPrix.toStringAsFixed(2)} dt",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(List<String> items) {
    return DropdownButtonFormField<String>(
      value: items.first,
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (val) {},
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }

  Widget _buildCounter(String label, int value, ValueChanged<int> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: value > 0 ? () => onChanged(value - 1) : null,
            ),
            Text("$value", style: TextStyle(fontSize: 16)),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () => onChanged(value + 1),
            ),
          ],
        ),
      ],
    );
  }
}

Future<double> getBasePrice(DocumentSnapshot doc) async {
  var basePrice = doc['basePrice'];
  if (basePrice is String) {
    return double.tryParse(basePrice) ?? 0.0;
  } else if (basePrice is int) {
    return basePrice.toDouble();
  } else if (basePrice is double) {
    return basePrice;
  }
  return 0.0;
}

class BookingScreenWrapper extends StatelessWidget {
  final String docId;

  BookingScreenWrapper({required this.docId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('/destinations')
          .doc(docId)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text("Error loading data"));
        }
        return FutureBuilder<double>(
          future: getBasePrice(snapshot.data!),
          builder: (context, priceSnapshot) {
            if (!priceSnapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return BookingPage(basePrice: priceSnapshot.data!);
          },
        );
      },
    );
  }
}
