import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remorquage/ConfirmationPage.dart';
import 'package:remorquage/utils/constants/colors.dart';

class SelectTimeScreen extends StatefulWidget {
  @override
  _SelectTimeScreenState createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  bool _isNowSelected = true;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _showTimePicker() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = const Color(0xFF6677D6);
    final Color unselectedColor = const Color(0xFF6677D6); // couleur différente

    return Scaffold(
      appBar: AppBar(
        title: Text('Select time'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: _isNowSelected,
                        onChanged: (value) {
                          setState(() {
                            _isNowSelected = true;
                            _selectedDate = null;
                            _selectedTime = null;
                          });
                        },
                      ),
                      Text(
                        'Now (As soon as possible)',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  Icon(Icons.timer, color: Colors.white, size: 24),
                ],
              ),
            ),
            SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: _isNowSelected ? unselectedColor : selectedColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio<bool>(
                        value: false,
                        groupValue: _isNowSelected,
                        onChanged: (value) {
                          setState(() {
                            _isNowSelected = false;
                          });
                        },
                      ),
                      Text(
                        'Schedule for later',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  Icon(Icons.calendar_today, color: Colors.white, size: 24),
                ],
              ),
            ),

            if (!_isNowSelected)
              Container(
                decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_left),
                                  onPressed: () {
                                    setState(() {
                                      _selectedDate = (_selectedDate ??
                                              DateTime.now())
                                          .subtract(Duration(days: 30));
                                    });
                                  },
                                ),
                                Text(
                                  DateFormat.yMMMM().format(
                                    _selectedDate ?? DateTime.now(),
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_right),
                                  onPressed: () {
                                    setState(() {
                                      _selectedDate = (_selectedDate ??
                                              DateTime.now())
                                          .add(Duration(days: 30));
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 7,
                              physics: NeverScrollableScrollPhysics(),
                              children: List.generate(42, (index) {
                                final day = _getDayFromIndex(index);
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDate = day;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color:
                                          _isSelected(day)
                                              ? selectedColor
                                              : null,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '${day.day}',
                                      style: TextStyle(
                                        color:
                                            _isSelected(day)
                                                ? Colors.white
                                                : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Pick-up time',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: _selectedTime?.format(context) ?? '10:00',
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: _showTimePicker,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Spacer(),

            ElevatedButton(
              onPressed: () {
                if (_isNowSelected ||
                    (_selectedDate != null && _selectedTime != null)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => ConfirmationPage(
                            isNowSelected: _isNowSelected,
                            selectedDate: _isNowSelected ? null : _selectedDate,
                            selectedTime: _isNowSelected ? null : _selectedTime,
                            userName:
                                "Hanin Alimi", // remplace par données réelles plus tard
                            vehiclePlate: "123 TU 456",
                            vehicleBrand: "Kia Rio",
                            pickupLocation: "Bab Saadoun, Tunis",
                            destination: "Garage Manouba",
                          ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a date and time."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.primary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Confirm Time',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime _getDayFromIndex(int index) {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    return startOfWeek.add(Duration(days: index));
  }

  bool _isSelected(DateTime day) {
    return _selectedDate != null &&
        day.year == _selectedDate!.year &&
        day.month == _selectedDate!.month &&
        day.day == _selectedDate!.day;
  }
}
