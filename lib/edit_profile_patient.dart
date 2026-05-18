import 'package:flutter/material.dart';
import 'patient_home_page.dart';

class EditPatientProfilePage extends StatefulWidget {
  const EditPatientProfilePage({super.key});

  @override
  State<EditPatientProfilePage> createState() => _EditPatientProfilePageState();
}

class _EditPatientProfilePageState extends State<EditPatientProfilePage> {
  final TextEditingController nameController = TextEditingController(
    text: "Elena Rodriguez",
  );

  final TextEditingController ageController = TextEditingController(text: "28");

  final TextEditingController emailController = TextEditingController(
    text: "elena.r@healthcare.net",
  );

  final TextEditingController addressController = TextEditingController(
    text: "742 Evergreen Terrace, Springfield",
  );

  final TextEditingController phoneController = TextEditingController(
    text: "+1 (555) 012-3456",
  );

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (_) => const PatientDashboard()),
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF0A4EDB),
                size: 34,
              ),
            ),

            const SizedBox(width: 8),

            const Text(
              "Edit Patient Profile",
              style: TextStyle(
                color: Color(0xFF0A4EDB),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Color(0xFF2F3243),
                size: 32,
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 15),

                // PROFILE IMAGE
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=400",
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        showMessage("Edit Photo Clicked");
                      },
                      child: Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A4EDB),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // NAME
                const Text(
                  "Elena Rodriguez",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Patient ID: #CN-20485",
                  style: TextStyle(fontSize: 20, color: Color(0xFF4F5365)),
                ),

                const SizedBox(height: 50),

                buildInputField(
                  title: "Full Name",
                  icon: Icons.person_outline,
                  controller: nameController,
                ),

                const SizedBox(height: 30),

                buildInputField(
                  title: "Age",
                  icon: Icons.cake_outlined,
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 30),

                buildInputField(
                  title: "Email Address",
                  icon: Icons.mail_outline,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 30),

                buildInputField(
                  title: "Home Address",
                  icon: Icons.location_on_outlined,
                  controller: addressController,
                ),

                const SizedBox(height: 30),

                buildInputField(
                  title: "Phone Number",
                  icon: Icons.phone_outlined,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 50),

                // SAVE BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: () {
                      showMessage("Changes Saved Successfully");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A4EDB),
                      elevation: 10,
                      shadowColor: Colors.blue.withValues(alpha: 0.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      "SAVE CHANGES",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // INPUT FIELD WIDGET
  Widget buildInputField({
    required String title,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: Color(0xFF3E455A),
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 14),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFD5D8E6), width: 1.3),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 24),
              prefixIcon: Icon(icon, color: const Color(0xFF767A8C), size: 32),
            ),
          ),
        ),
      ],
    );
  }
}
