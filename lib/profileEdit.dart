import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileEditPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void saveChanges() {
    String name = nameController.text;
    String location = locationController.text;
    String email = emailController.text;

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Profile updated')));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.045),
        color: Colors.white,
        width: screenWidth * 0.9,
        height: screenHeight * 0.9,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.045),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 51,
                      backgroundColor: Colors.orange,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/profile_picture.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                          border: Border.all(
                            color: Colors.orange,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Abdhy Samoedra',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Sentul, Bogor',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'abdhysamoedra@gmail.com',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 100.0),
                child: ElevatedButton(
                  onPressed: saveChanges,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                  child: const Text('Save Changes'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
