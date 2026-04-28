import 'package:flutter/material.dart';
import 'auth_storage.dart'; 

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    ));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

void signup() {
  String name = nameController.text.trim();
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  if (name.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Name required"), backgroundColor: Colors.red),
    );
    return;
  }
  if (email.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Email required"), backgroundColor: Colors.red),
    );
    return;
  }
  if (!email.contains("@") || !email.contains(".")) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Enter a valid email address"), backgroundColor: Colors.red),
    );
    return;
  }
  if (password.isEmpty || password.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password must be at least 6 characters"), backgroundColor: Colors.red),
    );
    return;
  }

  savedName = name;
  savedEmail = email;
  savedPassword = password;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Account created successfully!"), backgroundColor: Colors.green),
  );

  Navigator.pushReplacementNamed(context, '/login');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF2C2C2C),
              Color(0xFF1A1A1A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ── Logo / Icon ──────────────────────────────
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha:0.08),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.orange.withValues(alpha:0.5),
                              width: 2),
                        ),
                        child: const Icon(
                          Icons.chair_alt,
                          size: 60,
                          color: Colors.orange,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ── App Name ─────────────────────────────────
                      const Text(
                        "Al-R Furniture",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Georgia',
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Create your account to get started.",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 40),

                      // ── Full Name Field ──────────────────────────
// ── Full Name Field ──────────────────────────
Container(
  decoration: BoxDecoration(
    color: Colors.white.withValues(alpha: 0.08),
    borderRadius: BorderRadius.circular(14),
    border: Border.all(
      color: Colors.grey.shade300, // 🔥 CHANGED
      width: 1,
    ),
  ),
  child: TextField(
    controller: nameController,
    style: const TextStyle(color: Colors.black), // 🔥 CHANGED
    decoration: InputDecoration(
      hintText: "Full Name",
      hintStyle: TextStyle(
        color: Colors.grey.shade600, // 🔥 CHANGED
      ),
      prefixIcon: const Icon(
        Icons.person_outline,
        color: Colors.orange,
      ),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
    ),
  ),
),

const SizedBox(height: 16),

// ── Email Field ──────────────────────────────
Container(
  decoration: BoxDecoration(
    color: Colors.white.withValues(alpha: 0.08),
    borderRadius: BorderRadius.circular(14),
    border: Border.all(
      color: Colors.grey.shade300, // 🔥 CHANGED
      width: 1,
    ),
  ),
  child: TextField(
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    style: const TextStyle(color: Colors.black), // 🔥 CHANGED
    decoration: InputDecoration(
      hintText: "Email Address",
      hintStyle: TextStyle(
        color: Colors.grey.shade600, // 🔥 CHANGED
      ),
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: Colors.orange,
      ),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
    ),
  ),
),

const SizedBox(height: 16),

// ── Password Field ───────────────────────────
Container(
  decoration: BoxDecoration(
    color: Colors.white.withValues(alpha: 0.08),
    borderRadius: BorderRadius.circular(14),
    border: Border.all(
      color: Colors.grey.shade300, // 🔥 CHANGED
      width: 1,
    ),
  ),
  child: TextField(
    controller: passwordController,
    obscureText: _obscurePassword,
    style: const TextStyle(color: Colors.black), // 🔥 CHANGED
    decoration: InputDecoration(
      hintText: "Password",
      hintStyle: TextStyle(
        color: Colors.grey.shade600, // 🔥 CHANGED
      ),
      prefixIcon: const Icon(
        Icons.lock_outline,
        color: Colors.orange,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_off
              : Icons.visibility,
          color: Colors.grey, // 🔥 CHANGED
        ),
        onPressed: () => setState(
          () => _obscurePassword = !_obscurePassword,
        ),
      ),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
    ),
  ),
),
                      const SizedBox(height: 30),

                      // ── Sign Up Button ───────────────────────────
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding:
                                const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 4,
                          ),
                          onPressed: signup,
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ── Login Link ───────────────────────────────
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.white54),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, '/login'),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}