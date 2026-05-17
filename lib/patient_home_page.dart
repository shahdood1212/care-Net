import 'package:flutter/material.dart';
import 'book_appointment_page.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Doctor App',
//       theme: ThemeData(
//         fontFamily: 'Arial',
//         scaffoldBackgroundColor: const Color(0xFFF5F6FA),
//       ),
//       home: const HomePage(),
//     );
//   }
// }

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int selectedCategory = 0;
  int selectedBottom = 0;

  final List<Map<String, dynamic>> categories = [
    {"title": "Cardiology", "icon": Icons.favorite},
    {"title": "Dentistry", "icon": Icons.medical_services},
    {"title": "Internal Medicine", "icon": Icons.local_hospital},
    {"title": "Orthopedics", "icon": Icons.accessibility_new},
  ];

  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Sophia Miller",
      "specialty": "Cardiologist",
      "hospital": "City Medical Center",
      "experience": "12 years experience",
      "rating": "4.9",
      "image":
          "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?q=80&w=400",
    },
    {
      "name": "Dr. Michael Chen",
      "specialty": "Dentist",
      "hospital": "Bright Smile Clinic",
      "experience": "10 years experience",
      "rating": "4.8",
      "image":
          "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=400",
    },
    {
      "name": "Dr. Sarah Jenkins",
      "specialty": "Internal Medicine",
      "hospital": "General Health Hospital",
      "experience": "15 years experience",
      "rating": "4.7",
      "image":
          "https://images.unsplash.com/photo-1594824476967-48c8b964273f?q=80&w=400",
    },
    {
      "name": "Dr. Marcus Thorne",
      "specialty": "Orthopedic",
      "hospital": "North Wellness Clinic",
      "experience": "8 years experience",
      "rating": "4.8",
      "image":
          "https://images.unsplash.com/photo-1582750433449-648ed127bb54?q=80&w=400",
    },
  ];

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome,",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Alex",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showMessage("Logout Clicked");
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Color(0xFF0D5BE1),
                        size: 30,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // SEARCH
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: TextField(
                    onTap: () {
                      showMessage("Search Clicked");
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search doctors or specialties",
                      contentPadding: EdgeInsets.only(top: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // SPECIALITIES
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "SPECIALITIES",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedCategory == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                          });

                          showMessage("${categories[index]["title"]} Selected");
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 14),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF0D5BE1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                categories[index]["icon"],
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                categories[index]["title"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "RECOMMENDED DOCTORS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 18),

                // DOCTORS LIST
                Column(
                  children: List.generate(
                    doctors.length,
                    (index) => doctorCard(doctors[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: Container(
        height: 85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomItem(Icons.home, "Home", 0),
            bottomItem(Icons.calendar_today, "Schedule", 1),
            bottomItem(Icons.person_outline, "Profile", 2),
          ],
        ),
      ),
    );
  }

  Widget doctorCard(Map<String, dynamic> doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  doctor["image"],
                  width: 95,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor["name"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      doctor["specialty"],
                      style: const TextStyle(
                        color: Color(0xFF0D5BE1),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            doctor["hospital"],
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.history,
                          size: 18,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          doctor["experience"],
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5EE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.green, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      doctor["rating"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BookAppointmentPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D5BE1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Book Appointment",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomItem(IconData icon, String title, int index) {
    bool isSelected = selectedBottom == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBottom = index;
        });

        showMessage("$title Clicked");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFDCE8FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF0D5BE1) : Colors.black54,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFF0D5BE1) : Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
