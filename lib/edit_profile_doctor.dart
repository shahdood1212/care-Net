import 'package:flutter/material.dart';

class EditProfileDoctor extends StatefulWidget {
  const EditProfileDoctor({super.key});

  @override
  State<EditProfileDoctor> createState() => _EditProfileDoctorState();
}

class _EditProfileDoctorState extends State<EditProfileDoctor> {
  final TextEditingController nameController = TextEditingController(
    text: "Dr. Julian Smith",
  );

  final TextEditingController specialtyController = TextEditingController(
    text: "Chief Surgeon",
  );

  final TextEditingController phoneController = TextEditingController(
    text: "+1 234 567 890",
  );

  final TextEditingController emailController = TextEditingController(
    text: "julian.smith@carenet.com",
  );

  final TextEditingController addressController = TextEditingController(
    text: "City Medical Center, Building A",
  );

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF0B4EDB),
                  size: 32,
                ),
              ),

              const SizedBox(width: 6),

              const Text(
                "Edit Profile",
                style: TextStyle(
                  color: Color(0xFF0B4EDB),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              IconButton(
                onPressed: () {
                  showMessage("Menu Clicked");
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Color(0xFF0B4EDB),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // PROFILE IMAGE
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=400",
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      showMessage("Change Photo Clicked");
                    },
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B4EDB),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 55),

              buildField(
                title: "Full Name",
                icon: Icons.person_outline,
                controller: nameController,
              ),

              const SizedBox(height: 28),

              buildField(
                title: "Medical Specialty",
                icon: Icons.medical_services_outlined,
                controller: specialtyController,
              ),

              const SizedBox(height: 28),

              buildField(
                title: "Phone Number",
                icon: Icons.phone_outlined,
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 28),

              buildField(
                title: "Email Address",
                icon: Icons.mail_outline,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 28),

              buildField(
                title: "Clinic Address",
                icon: Icons.location_on_outlined,
                controller: addressController,
              ),

              const SizedBox(height: 55),

              // SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    showMessage("Changes Saved Successfully");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B4EDB),
                    elevation: 8,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // DISCARD
              GestureDetector(
                onTap: () {
                  setState(() {
                    nameController.text = "Dr. Julian Smith";
                    specialtyController.text = "Chief Surgeon";
                    phoneController.text = "+1 234 567 890";
                    emailController.text = "julian.smith@carenet.com";
                    addressController.text = "City Medical Center, Building A";
                  });

                  showMessage("Edits Discarded");
                },
                child: const Text(
                  "Discard Edits",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4D5C7A),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({
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
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4D5C7A),
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 14),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFD5D8E2), width: 1.2),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 17, color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 22),
              prefixIcon: Icon(icon, color: const Color(0xFF7B7F92), size: 30),
            ),
          ),
        ),
      ],
    );
  }
}
