import 'package:flutter/material.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({super.key});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  DateTime currentDate = DateTime.now();
  int? selectedDay;
  int selectedTime = 1;
  int selectedPayment = 0;
  List<DateTime> getDaysInMonth(DateTime date) {
    final nextMonth = DateTime(date.year, date.month + 1, 1);
    final lastDay = nextMonth.subtract(const Duration(days: 1));

    return List.generate(
      lastDay.day,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }

  void changeMonth(int step) {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + step, 1);
    });
  }

  final List<String> times = [
    "9:00 AM",
    "10:30 AM",
    "11:00 AM",
    "2:00 PM",
    "3:30 PM",
    "4:30 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// BOTTOM BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 65,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2563EB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Confirm Booking",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF0A4EDB),
                          size: 34,
                        ),
                      ),

                      const SizedBox(width: 18),

                      const Text(
                        "Book\nAppointment",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2563EB),
                        ),
                      ),
                    ],
                  ),

                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.person, color: Colors.blue),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// DOCTOR CARD
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    /// IMAGE PLACEHOLDER
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. James Wilson",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 6),

                          Text(
                            "Dermatology",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.green, size: 22),

                              SizedBox(width: 6),

                              Text(
                                "4.9 (120 reviews)",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 20,
                                color: Colors.black54,
                              ),

                              SizedBox(width: 6),

                              Expanded(
                                child: Text(
                                  "CareNet Central Clinic",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const SizedBox(height: 30),

              /// DATE TITLE (IMPROVED)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select Date",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff2563EB).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => changeMonth(-1),
                            child: const Icon(Icons.chevron_left, size: 22),
                          ),

                          const SizedBox(width: 8),

                          Text(
                            "${currentDate.month}/${currentDate.year}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2563EB),
                            ),
                          ),

                          const SizedBox(width: 8),

                          GestureDetector(
                            onTap: () => changeMonth(1),
                            child: const Icon(Icons.chevron_right, size: 22),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              /// CALENDAR (Improved UI)
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    /// Days grid
                    Wrap(
                      spacing: 10,
                      runSpacing: 12,
                      children: getDaysInMonth(currentDate).map((day) {
                        final isSelected = selectedDay == day.day;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDay = day.day;
                              });
                            },
                            child: Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xff2563EB)
                                    : Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xff2563EB)
                                      : Colors.grey.shade300,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: const Color(
                                            0xff2563EB,
                                          ).withValues(alpha: 0.25),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Center(
                                child: Text(
                                  "${day.day}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              /// TIME TITLE
              const Text(
                "Available Time",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              /// TIME GRID
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: times.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  bool selected = selectedTime == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected ? Colors.blue.shade100 : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: selected
                              ? const Color(0xff2563EB)
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          times[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: selected
                                ? const Color(0xff2563EB)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              /// PRICE CARD
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 22,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffEEF3FF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "\$150.00",
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 80, child: VerticalDivider(thickness: 1)),

                    Column(
                      children: [
                        Text(
                          "Duration",
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "30\nmins",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// PAYMENT TITLE
              const Text(
                "Payment Method",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              /// CASH + WALLET
              Row(
                children: [
                  Expanded(
                    child: smallPaymentCard(
                      title: "Cash",
                      icon: Icons.money,
                      selected: selectedPayment == 0,
                      onTap: () {
                        setState(() {
                          selectedPayment = 0;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: smallPaymentCard(
                      title: "Wallet",
                      icon: Icons.wallet_outlined,
                      selected: selectedPayment == 1,
                      onTap: () {
                        setState(() {
                          selectedPayment = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xff2563EB) : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.blue),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              ),
            ),

            CircleAvatar(
              radius: 16,
              backgroundColor: selected
                  ? const Color(0xff2563EB)
                  : Colors.grey.shade300,
              child: const Icon(Icons.check, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallPaymentCard({
    required String title,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? const Color(0xff2563EB) : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blue, size: 30),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
