import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
//  MAIN
// ─────────────────────────────────────────────
void main() => runApp(const InTailorApp());

class InTailorApp extends StatelessWidget {
  const InTailorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InTailor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Georgia',
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ─────────────────────────────────────────────
//  COLORS & STYLES
// ─────────────────────────────────────────────
class AppColors {
  static const Color primary = Color(0xFF4A3325);
  static const Color primaryLight = Color(0xFF7A5C44);
  static const Color background = Color(0xFFF5EFE6);
  static const Color card = Color(0xFFEDE4D8);
  static const Color cardDark = Color(0xFFD9C9B5);
  static const Color textPrimary = Color(0xFF2E1F14);
  static const Color textSecondary = Color(0xFF7A6555);
  static const Color white = Color(0xFFFFFFFF);
  static const Color star = Color(0xFFE8A838);
  static const Color green = Color(0xFF4CAF50);
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontFamily: 'Georgia',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const TextStyle subheading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
  static const TextStyle buttonText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    letterSpacing: 0.5,
  );
}

// ─────────────────────────────────────────────
//  SHARED WIDGETS
// ─────────────────────────────────────────────
class InTailorLogo extends StatelessWidget {
  final double size;
  const InTailorLogo({super.key, this.size = 72});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(size * 0.22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.35),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset('lib/images/logo.png', fit: BoxFit.contain),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 3,
        ),
        child: Text(text, style: AppTextStyles.buttonText),
      ),
    );
  }
}

class OutlineButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const OutlineButton2({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class AppInputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData? prefixIcon;
  const AppInputField({
    super.key,
    required this.hint,
    this.obscure = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.body,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.textSecondary, size: 20)
            : null,
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cardDark, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}

Widget _imagePlaceholder({
  double width = double.infinity,
  double height = 140,
}) {
  return Container(
    height: 80,
    width: 80,
    padding: const EdgeInsets.all(12),
    child: Image.asset('images/logo.png', fit: BoxFit.contain),
  );
}

// ─────────────────────────────────────────────
//  1. WELCOME / ROLE SELECTION SCREEN
// ─────────────────────────────────────────────
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 56),
              const InTailorLogo(size: 80),
              const SizedBox(height: 16),
              const Text('InTailor', style: AppTextStyles.heading),
              const SizedBox(height: 6),
              const Text(
                'Temukan penjahit terbaik di sekitarmu',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 52),
              const Text(
                'Masuk sebagai:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              _RoleCard(
                icon: Icons.person_outline,
                title: 'Pembeli',
                subtitle: 'Cari & pesan jasa penjahit',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(role: 'Pembeli'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              _RoleCard(
                icon: Icons.content_cut,
                title: 'Penjahit',
                subtitle: 'Kelola pesanan & katalog',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(role: 'Penjahit'),
                    ),
                  );
                },
              ),
              const Spacer(),
              const Text(
                'InTailor v1.0',
                style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.cardDark, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.white, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.subheading),
                  const SizedBox(height: 2),
                  Text(subtitle, style: AppTextStyles.caption),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  2. LOGIN SCREEN
// ─────────────────────────────────────────────
class LoginScreen extends StatelessWidget {
  final String role;
  const LoginScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                const InTailorLogo(size: 48),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hallo!', style: AppTextStyles.heading),
                    Text(
                      'Selamat datang di InTailor',
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login akun $role', style: AppTextStyles.subheading),
                  const SizedBox(height: 20),
                  const AppInputField(
                    hint: 'Email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 12),
                  const AppInputField(
                    hint: 'Password',
                    obscure: true,
                    prefixIcon: Icons.lock_outline,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Lupa sandi?',
                        style: TextStyle(
                          color: AppColors.primaryLight,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  PrimaryButton(
                    text: 'Login',
                    onTap: () {
                      if (role == 'Penjahit') {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TailorDashboard(),
                          ),
                          (_) => false,
                        );
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BuyerHomeScreen(),
                          ),
                          (_) => false,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(child: Divider(color: AppColors.cardDark)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'atau login dengan',
                          style: AppTextStyles.caption,
                        ),
                      ),
                      const Expanded(child: Divider(color: AppColors.cardDark)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _SocialLoginButton(
                          icon: Icons.g_mobiledata,
                          label: 'Google',
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _SocialLoginButton(
                          icon: Icons.facebook,
                          label: 'Facebook',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Tidak punya akun? ', style: AppTextStyles.body),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegisterScreen(role: role),
                      ),
                    );
                  },
                  child: const Text(
                    'Daftar sekarang',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _SocialLoginButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: AppColors.primary, size: 22),
      label: Text(
        label,
        style: const TextStyle(color: AppColors.primary, fontSize: 13),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.cardDark),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  3. REGISTER SCREEN
// ─────────────────────────────────────────────
class RegisterScreen extends StatelessWidget {
  final String role;
  const RegisterScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Daftar Akun',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Buat Akun $role', style: AppTextStyles.subheading),
                  const SizedBox(height: 20),
                  const AppInputField(
                    hint: 'Nama Lengkap',
                    prefixIcon: Icons.person_outline,
                  ),
                  const SizedBox(height: 12),
                  const AppInputField(
                    hint: 'Email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 12),
                  const AppInputField(
                    hint: 'Sandi',
                    obscure: true,
                    prefixIcon: Icons.lock_outline,
                  ),
                  const SizedBox(height: 12),
                  const AppInputField(
                    hint: 'Konfirmasi Sandi',
                    obscure: true,
                    prefixIcon: Icons.lock_outline,
                  ),
                  const SizedBox(height: 12),
                  const AppInputField(
                    hint: 'No. Handphone',
                    prefixIcon: Icons.phone_outlined,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Daftar',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Text(
                'Kembali ke halaman login',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  4. BUYER HOME SCREEN (with bottom nav)
// ─────────────────────────────────────────────
class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const _HomeTab(),
    const TailorListScreen(),
    const OrderHistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            backgroundColor: AppColors.primary,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.white.withOpacity(0.5),
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.content_cut_outlined),
                activeIcon: Icon(Icons.content_cut),
                label: 'Penjahit',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined),
                activeIcon: Icon(Icons.receipt_long),
                label: 'Pemesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  4a. HOME TAB
// ─────────────────────────────────────────────
class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo, Channil 👋',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Temukan penjahit terbaik hari ini',
                                style: TextStyle(
                                  color: Color(0xFFD9C9B5),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.primaryLight,
                          radius: 22,
                          child: const Icon(
                            Icons.person,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: AppColors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Cari penjahit atau produk...',
                            style: TextStyle(
                              color: Color(0xFFD9C9B5),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Banner Promo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6B4226), Color(0xFF4A3325)],
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Diskon Jahit',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                            const Text(
                              '20% OFF',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Lihat lebih lanjut',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.local_offer,
                        color: Color(0x44FFFFFF),
                        size: 80,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Filter Chips
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _FilterChip(label: 'Terbaru', selected: true),
                    const SizedBox(width: 10),
                    _FilterChip(label: 'Populer', selected: false),
                    const SizedBox(width: 10),
                    _FilterChip(label: 'Terdekat', selected: false),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Rekomendasi
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Rekomendasi', style: AppTextStyles.subheading),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _dummyProducts.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (context, i) {
                    final p = _dummyProducts[i];
                    return _ProductCard(
                      product: p,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: p),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Penjahit Populer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Penjahit Populer',
                      style: AppTextStyles.subheading,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ..._dummyTailors
                  .take(3)
                  .map((t) => _TailorListTile(tailor: t))
                  .toList(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _FilterChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.cardDark,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? AppColors.white : AppColors.textSecondary,
          fontSize: 13,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  5. TAILOR LIST SCREEN
// ─────────────────────────────────────────────
class TailorListScreen extends StatelessWidget {
  const TailorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Daftar Penjahit',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _dummyTailors.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final t = _dummyTailors[i];
          return _TailorCard(
            tailor: t,
            onCatalogTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CatalogScreen(tailorName: t.name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _TailorCard extends StatelessWidget {
  final _TailorData tailor;
  final VoidCallback onCatalogTap;
  const _TailorCard({required this.tailor, required this.onCatalogTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.cardDark,
            child: Icon(Icons.content_cut, color: AppColors.primary, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tailor.name, style: AppTextStyles.subheading),
                const SizedBox(height: 2),
                Text(tailor.address, style: AppTextStyles.caption),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.star, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      tailor.rating.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${tailor.sold} terjual',
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              _SmallButton(
                icon: Icons.chat_bubble_outline,
                label: 'Chat',
                onTap: () {},
              ),
              const SizedBox(height: 8),
              _SmallButton(
                icon: Icons.storefront_outlined,
                label: 'Katalog',
                onTap: onCatalogTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TailorListTile extends StatelessWidget {
  final _TailorData tailor;
  const _TailorListTile({required this.tailor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.06),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.cardDark,
              child: const Icon(
                Icons.content_cut,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tailor.name, style: AppTextStyles.subheading),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.star, size: 12),
                      const SizedBox(width: 3),
                      Text(
                        '${tailor.rating}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _SmallButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: AppColors.primary),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  6. CATALOG SCREEN
// ─────────────────────────────────────────────
class CatalogScreen extends StatelessWidget {
  final String tailorName;
  const CatalogScreen({super.key, required this.tailorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Katalog - $tailorName',
          style: const TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _dummyProducts.length,
        itemBuilder: (context, i) {
          final p = _dummyProducts[i];
          return _CatalogItem(
            product: p,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: p),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CatalogItem extends StatelessWidget {
  final _ProductData product;
  final VoidCallback onTap;
  const _CatalogItem({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.checkroom,
                    color: AppColors.textSecondary,
                    size: 48,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.star, size: 12),
                      const SizedBox(width: 3),
                      Text(
                        '${product.rating} | ${product.sold}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary,
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
    );
  }
}

class _ProductCard extends StatelessWidget {
  final _ProductData product;
  final VoidCallback onTap;
  const _ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.07),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.checkroom,
                    color: AppColors.textSecondary,
                    size: 40,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  7. PRODUCT DETAIL SCREEN
// ─────────────────────────────────────────────
class ProductDetailScreen extends StatefulWidget {
  final _ProductData product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = 'L';
  String _selectedColor = 'Hijau';
  int _stock = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Detail Produk',
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Big image
            Container(
              height: 280,
              color: AppColors.cardDark,
              child: const Center(
                child: Icon(
                  Icons.checkroom,
                  color: AppColors.textSecondary,
                  size: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Text(
                        widget.product.price,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.star, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.product.rating}  •  ${widget.product.sold} terjual',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: AppColors.cardDark),
                  const SizedBox(height: 12),

                  // Description
                  const Text(
                    'Deskripsi Produk',
                    style: AppTextStyles.subheading,
                  ),
                  const SizedBox(height: 6),
                  Text(widget.product.description, style: AppTextStyles.body),
                  const SizedBox(height: 20),

                  // Ukuran
                  const Text('Ukuran Produk:', style: AppTextStyles.subheading),
                  const SizedBox(height: 10),
                  Row(
                    children: ['S', 'M', 'L', 'XL', 'XXL'].map((s) {
                      final sel = _selectedSize == s;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedSize = s),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: sel ? AppColors.primary : AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: sel
                                  ? AppColors.primary
                                  : AppColors.cardDark,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              s,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: sel
                                    ? AppColors.white
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // Warna
                  const Text('Warna Produk:', style: AppTextStyles.subheading),
                  const SizedBox(height: 10),
                  Row(
                    children: ['Hijau', 'Hitam', 'Putih'].map((c) {
                      final sel = _selectedColor == c;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColor = c),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: sel ? AppColors.primary : AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: sel
                                  ? AppColors.primary
                                  : AppColors.cardDark,
                            ),
                          ),
                          child: Text(
                            c,
                            style: TextStyle(
                              fontSize: 13,
                              color: sel
                                  ? AppColors.white
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  Text('Stok tersedia: $_stock', style: AppTextStyles.caption),
                  const SizedBox(height: 28),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlineButton2(
                          text: 'Hubungi Penjahit',
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: PrimaryButton(
                          text: 'Pesan Sekarang',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CustomSizeScreen(
                                  product: widget.product,
                                  size: _selectedSize,
                                  color: _selectedColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  8. CUSTOM SIZE / REQUEST UKURAN SCREEN
// ─────────────────────────────────────────────
class CustomSizeScreen extends StatefulWidget {
  final _ProductData product;
  final String size;
  final String color;
  const CustomSizeScreen({
    super.key,
    required this.product,
    required this.size,
    required this.color,
  });

  @override
  State<CustomSizeScreen> createState() => _CustomSizeScreenState();
}

class _CustomSizeScreenState extends State<CustomSizeScreen> {
  bool _useCustom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Request Ukuran',
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order summary card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.cardDark),
              ),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.cardDark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.checkroom,
                      color: AppColors.textSecondary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: AppTextStyles.subheading,
                        ),
                        Text(
                          'Ukuran: ${widget.size}  •  Warna: ${widget.color}',
                          style: AppTextStyles.caption,
                        ),
                        Text(
                          widget.product.price,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Toggle custom size
            Row(
              children: [
                const Text(
                  'Gunakan Ukuran Custom',
                  style: AppTextStyles.subheading,
                ),
                const Spacer(),
                Switch(
                  value: _useCustom,
                  activeColor: AppColors.primary,
                  onChanged: (v) => setState(() => _useCustom = v),
                ),
              ],
            ),

            if (_useCustom) ...[
              const SizedBox(height: 16),
              const Text(
                'Masukkan ukuran tubuh Anda (dalam cm):',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 12),
              _SizeInputRow(label: 'Lebar Dada', hint: 'contoh: 90'),
              const SizedBox(height: 10),
              _SizeInputRow(label: 'Panjang Baju', hint: 'contoh: 65'),
              const SizedBox(height: 10),
              _SizeInputRow(label: 'Lingkar Pinggang', hint: 'contoh: 72'),
              const SizedBox(height: 10),
              _SizeInputRow(label: 'Lingkar Lengan', hint: 'contoh: 35'),
              const SizedBox(height: 10),
              _SizeInputRow(label: 'Panjang Lengan', hint: 'contoh: 60'),
              const SizedBox(height: 10),
              _SizeInputRow(label: 'Lingkar Bahu', hint: 'contoh: 42'),
            ],

            const SizedBox(height: 20),
            const Text('Catatan Tambahan:', style: AppTextStyles.subheading),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardDark),
              ),
              child: const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Tulis catatan untuk penjahit...',
                  hintStyle: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14),
                ),
              ),
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              text: 'Lanjut ke Pembayaran',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        PaymentConfirmScreen(product: widget.product),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _SizeInputRow extends StatelessWidget {
  final String label;
  final String hint;
  const _SizeInputRow({required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 140, child: Text(label, style: AppTextStyles.body)),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.cardDark),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.cardDark),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              suffixText: 'cm',
              suffixStyle: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  9. PAYMENT CONFIRM SCREEN
// ─────────────────────────────────────────────
class PaymentConfirmScreen extends StatefulWidget {
  final _ProductData product;
  const PaymentConfirmScreen({super.key, required this.product});

  @override
  State<PaymentConfirmScreen> createState() => _PaymentConfirmScreenState();
}

class _PaymentConfirmScreenState extends State<PaymentConfirmScreen> {
  String _selectedPayment = 'Transfer Bank';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Konfirmasi Pesanan',
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product summary
            _SectionCard(
              title: 'Detail Pesanan',
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.cardDark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.checkroom,
                      color: AppColors.textSecondary,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: AppTextStyles.subheading,
                        ),
                        Text(
                          '1 pcs • Ukuran L • Warna Hijau',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.product.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Shipping address
            _SectionCard(
              title: 'Alamat Pengiriman',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Channil', style: AppTextStyles.subheading),
                  const SizedBox(height: 4),
                  const Text(
                    'Jl. Balearjosari No. 5, Kab. Malang',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Ganti alamat',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Payment method
            _SectionCard(
              title: 'Metode Pembayaran',
              child: Column(
                children: ['Transfer Bank', 'E-Wallet', 'COD'].map((method) {
                  return RadioListTile<String>(
                    value: method,
                    groupValue: _selectedPayment,
                    onChanged: (v) => setState(() => _selectedPayment = v!),
                    title: Text(method, style: AppTextStyles.body),
                    activeColor: AppColors.primary,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),

            // Price breakdown
            _SectionCard(
              title: 'Rincian Biaya',
              child: Column(
                children: [
                  _PriceRow(label: 'Harga produk', value: widget.product.price),
                  const _PriceRow(label: 'Biaya jahit', value: 'Rp 25.000'),
                  const _PriceRow(label: 'Ongkos kirim', value: 'Rp 12.000'),
                  const Divider(color: AppColors.cardDark),
                  const _PriceRow(
                    label: 'Total',
                    value: 'Rp 151.500',
                    isBold: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              text: 'Konfirmasi & Bayar',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    title: const Text(
                      'Pesanan Berhasil!',
                      style: AppTextStyles.heading,
                    ),
                    content: const Text(
                      'Pesanan kamu telah dikonfirmasi. Penjahit akan segera memproses pesananmu.',
                      style: AppTextStyles.body,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BuyerHomeScreen(),
                            ),
                            (_) => false,
                          );
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.06), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.subheading),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  const _PriceRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  10. ORDER HISTORY SCREEN
// ─────────────────────────────────────────────
class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Riwayat Pemesanan',
          style: TextStyle(color: AppColors.white),
        ),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _OrderCard(
            productName: 'Jacket Regen',
            qty: '1 pcs',
            price: 'Rp 114.500',
            date: '2 hari lalu',
            status: 'Sedang Dikerjakan',
            statusColor: Color(0xFFE8A838),
          ),
          SizedBox(height: 12),
          _OrderCard(
            productName: 'Blouse Ruffle Silk',
            qty: '2 pcs',
            price: 'Rp 229.000',
            date: '5 hari lalu',
            status: 'Siap Dikirim',
            statusColor: AppColors.green,
          ),
          SizedBox(height: 12),
          _OrderCard(
            productName: 'Cardigan Putih',
            qty: '3 pcs',
            price: 'Rp 450.000',
            date: '1 minggu lalu',
            status: 'Selesai',
            statusColor: Color(0xFF888888),
          ),
          SizedBox(height: 12),
          _OrderCard(
            productName: 'Rok Jeans Pendek',
            qty: '5 pcs',
            price: 'Rp 2.500.000',
            date: '2 minggu lalu',
            status: 'Selesai',
            statusColor: Color(0xFF888888),
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String productName;
  final String qty;
  final String price;
  final String date;
  final String status;
  final Color statusColor;
  const _OrderCard({
    required this.productName,
    required this.qty,
    required this.price,
    required this.date,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.06), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.checkroom,
              color: AppColors.textSecondary,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: AppTextStyles.subheading),
                Text('$qty  •  $date', style: AppTextStyles.caption),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 11,
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  11. SEARCH SCREEN
// ─────────────────────────────────────────────
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: AppColors.white, size: 18),
              SizedBox(width: 8),
              Text(
                'Tuliskan nama penjahit / produk',
                style: TextStyle(color: Color(0xFFD9C9B5), fontSize: 13),
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rekomendasi', style: AppTextStyles.subheading),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  [
                    'Jahitan Pak Mat',
                    'Jahitan Pak Jon',
                    'Jahitan Pak Ron',
                    'Jaket Tebal',
                    'Gaun Pendek',
                    'Celana Jeans',
                  ].map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.cardDark),
                      ),
                      child: Text(tag, style: AppTextStyles.caption),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Riwayat Pencarian',
                  style: AppTextStyles.subheading,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Hapus Semua',
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...['Seragam SD', 'Baju Wisuda'].map(
              (h) => ListTile(
                leading: const Icon(
                  Icons.history,
                  color: AppColors.textSecondary,
                  size: 18,
                ),
                title: Text(h, style: AppTextStyles.body),
                trailing: const Icon(
                  Icons.close,
                  color: AppColors.textSecondary,
                  size: 16,
                ),
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  12. PROFILE SCREEN
// ─────────────────────────────────────────────
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Profil', style: TextStyle(color: AppColors.white)),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 28),
              color: AppColors.primary,
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 44,
                          backgroundColor: AppColors.primaryLight,
                          child: Icon(
                            Icons.person,
                            color: AppColors.white,
                            size: 44,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 14,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Channil',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'JL. Balearjosari, Kab Malang',
                      style: TextStyle(color: Color(0xFFD9C9B5), fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Menu items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _ProfileMenuItem(
                    icon: Icons.person_outline,
                    label: 'Akun Saya',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                  _ProfileMenuItem(
                    icon: Icons.receipt_long_outlined,
                    label: 'Riwayat Transaksi',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.location_on_outlined,
                    label: 'Daftar Alamat',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.help_outline,
                    label: 'Pusat Bantuan',
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  _ProfileMenuItem(
                    icon: Icons.lock_outline,
                    label: 'Ubah Kata Sandi',
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WelcomeScreen(),
                          ),
                          (_) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 20,
                      ),
                      label: const Text(
                        'Keluar',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.06), blurRadius: 6),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary, size: 22),
        title: Text(label, style: AppTextStyles.body),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: AppColors.textSecondary,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  13. EDIT PROFILE SCREEN
// ─────────────────────────────────────────────
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Edit Profil',
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.primaryLight,
              child: Icon(Icons.person, color: AppColors.white, size: 48),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nama', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: 'Channil'),
                  const SizedBox(height: 14),
                  const Text('Username', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: 'Channil.id'),
                  const SizedBox(height: 14),
                  const Text('Nomor Telepon', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: '(+62) 234 567 890'),
                  const SizedBox(height: 14),
                  const Text('Email', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: 'Channil@gmail.com'),
                  const SizedBox(height: 14),
                  const Text('Kata Sandi', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: '••••••••', obscure: true),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Simpan',
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  14. TAILOR DASHBOARD (Penjahit)
// ─────────────────────────────────────────────
class TailorDashboard extends StatefulWidget {
  const TailorDashboard({super.key});

  @override
  State<TailorDashboard> createState() => _TailorDashboardState();
}

class _TailorDashboardState extends State<TailorDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const _TailorHomeTab(),
    const TailorInputCatalogTab(),
    const TailorHistoryTab(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            backgroundColor: AppColors.primary,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.white.withOpacity(0.5),
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                activeIcon: Icon(Icons.add_circle),
                label: 'Input Stok',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                activeIcon: Icon(Icons.history),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TailorHomeTab extends StatelessWidget {
  const _TailorHomeTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat Datang,',
                                style: TextStyle(
                                  color: Color(0xFFD9C9B5),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Bu Titik',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.primaryLight,
                          radius: 22,
                          child: const Icon(
                            Icons.person,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            label: 'Pendapatan Bulan Ini',
                            value: 'Rp 50.500.000',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            label: 'Pendapatan Hari Ini',
                            value: 'Rp 2.500.000',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Permintaan terbaru
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Permintaan Terbaru',
                      style: AppTextStyles.subheading,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TailorRequestScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ..._dummyRequests
                  .take(2)
                  .map(
                    (r) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      child: _RequestTile(request: r),
                    ),
                  ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xFFD9C9B5), fontSize: 11),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestTile extends StatelessWidget {
  final _RequestData request;
  const _RequestTile({required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.06), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.cardDark,
            child: Icon(Icons.person, color: AppColors.textSecondary, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(request.customerName, style: AppTextStyles.subheading),
                Text(request.address, style: AppTextStyles.caption),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TailorConfirmScreen(request: request),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Konfirmasi',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  15. TAILOR REQUEST SCREEN
// ─────────────────────────────────────────────
class TailorRequestScreen extends StatelessWidget {
  const TailorRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Permintaan dari Pelanggan',
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _dummyRequests.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) => _RequestTile(request: _dummyRequests[i]),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  16. TAILOR CONFIRM SCREEN
// ─────────────────────────────────────────────
class TailorConfirmScreen extends StatelessWidget {
  final _RequestData request;
  const TailorConfirmScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Konfirmasi',
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: AppColors.cardDark,
                        child: Icon(
                          Icons.person,
                          color: AppColors.textSecondary,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            request.customerName,
                            style: AppTextStyles.subheading,
                          ),
                          Text(request.address, style: AppTextStyles.caption),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _InfoRow(label: 'Produk', value: request.product),
                  _InfoRow(label: 'Ukuran', value: request.size),
                  _InfoRow(label: 'Warna', value: request.color),
                  _InfoRow(label: 'Alamat', value: request.address),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Waktu Pengiriman:', style: AppTextStyles.subheading),
            const SizedBox(height: 8),
            const AppInputField(hint: 'Ketik estimasi waktu...'),
            const SizedBox(height: 14),
            const Text('Catatan Tambahan:', style: AppTextStyles.subheading),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardDark),
              ),
              child: const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Ketik catatan...',
                  hintStyle: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: OutlineButton2(
                    text: 'Batal',
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryButton(
                    text: 'Konfirmasi',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pesanan berhasil dikonfirmasi!'),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: AppTextStyles.caption),
          ),
          Text(': ', style: AppTextStyles.caption),
          Expanded(child: Text(value, style: AppTextStyles.body)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  17. TAILOR INPUT CATALOG TAB
// ─────────────────────────────────────────────
class TailorInputCatalogTab extends StatelessWidget {
  const TailorInputCatalogTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Input Katalog',
          style: TextStyle(color: AppColors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Penjahit info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.cardDark,
                    child: Icon(
                      Icons.content_cut,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Penjahit Bu Titik',
                        style: AppTextStyles.subheading,
                      ),
                      const Text(
                        'Jl. Jakarta No. 16',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Tambah Produk Baru', style: AppTextStyles.subheading),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add photo area
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              color: AppColors.primary,
                              size: 32,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Tambah Foto Produk',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Nama Produk', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: 'Contoh: Atasan Biru Kaos'),
                  const SizedBox(height: 12),
                  const Text('Harga', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: 'Rp 0'),
                  const SizedBox(height: 12),
                  const Text('Ukuran Tersedia', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: 'Contoh: S, M, L, XL'),
                  const SizedBox(height: 12),
                  const Text('Stok', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  const AppInputField(hint: '0'),
                  const SizedBox(height: 12),
                  const Text('Deskripsi Produk', style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.cardDark),
                    ),
                    child: const TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Tuliskan deskripsi produk...',
                        hintStyle: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Simpan Perubahan',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Produk berhasil disimpan!'),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  18. TAILOR HISTORY TAB
// ─────────────────────────────────────────────
class TailorHistoryTab extends StatelessWidget {
  const TailorHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Riwayat Pendapatan',
          style: TextStyle(color: AppColors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: AppColors.primary.withOpacity(0.05),
            child: Row(
              children: [
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: AppColors.primary,
                  size: 22,
                ),
                const SizedBox(width: 10),
                const Text('Total Pendapatan', style: AppTextStyles.body),
                const Spacer(),
                const Text(
                  'Rp 50.500.000',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                _IncomeCard(
                  product: 'Celana Pendek Abu-Abu',
                  customer: 'Chalista Anggun',
                  qty: '1 pcs',
                  price: 'Rp 500.000',
                  date: '2 hari lalu',
                ),
                SizedBox(height: 10),
                _IncomeCard(
                  product: 'Atasan Biru Pantai',
                  customer: 'Jennifer Bella',
                  qty: '2 pcs',
                  price: 'Rp 800.000',
                  date: '2 hari lalu',
                ),
                SizedBox(height: 10),
                _IncomeCard(
                  product: 'Rok Jeans Pendek',
                  customer: 'Alya Putri',
                  qty: '5 pcs',
                  price: 'Rp 2.500.000',
                  date: '3 hari lalu',
                ),
                SizedBox(height: 10),
                _IncomeCard(
                  product: 'Cardigan Putih',
                  customer: 'Widia Renata',
                  qty: '3 pcs',
                  price: 'Rp 1.000.000',
                  date: '3 hari lalu',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IncomeCard extends StatelessWidget {
  final String product;
  final String customer;
  final String qty;
  final String price;
  final String date;
  const _IncomeCard({
    required this.product,
    required this.customer,
    required this.qty,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.06), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.checkroom,
              color: AppColors.textSecondary,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product, style: AppTextStyles.subheading),
                Text('$qty  •  $customer', style: AppTextStyles.caption),
                Text(date, style: AppTextStyles.caption),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.green,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  DUMMY DATA
// ─────────────────────────────────────────────
class _ProductData {
  final String name;
  final String price;
  final double rating;
  final String sold;
  final String description;
  const _ProductData({
    required this.name,
    required this.price,
    required this.rating,
    required this.sold,
    required this.description,
  });
}

const List<_ProductData> _dummyProducts = [
  _ProductData(
    name: 'Blouse Ruffle Silk',
    price: 'Rp 114.500',
    rating: 4.9,
    sold: 'Terjual 200+',
    description:
        'Blouse cantik dengan detail ruffle dari bahan silk premium. Model elegan cocok untuk acara formal maupun casual.',
  ),
  _ProductData(
    name: 'Sky Blue Ribbon',
    price: 'Rp 138.000',
    rating: 4.8,
    sold: 'Terjual 120+',
    description:
        'Baju warna biru langit dengan aksen ribbon yang anggun. Bahan adem dan nyaman dipakai sepanjang hari.',
  ),
  _ProductData(
    name: 'Soft Pink Puff Sleeve',
    price: 'Rp 150.000',
    rating: 4.7,
    sold: 'Terjual 50+',
    description:
        'Atasan lengan balon warna pink lembut yang trendi dan feminin. Cocok untuk tampilan sehari-hari.',
  ),
  _ProductData(
    name: 'Rose Premium Silk',
    price: 'Rp 165.000',
    rating: 5.0,
    sold: 'Terjual 30+',
    description:
        'Kemeja silk premium warna rose dengan kualitas jahitan terbaik. Sangat cocok untuk acara spesial.',
  ),
  _ProductData(
    name: 'Jacket Regen',
    price: 'Rp 114.500',
    rating: 4.8,
    sold: 'Terjual 200+',
    description:
        'Jaket wanita trendy bahan tebal premium, model estetik classic modern. Harga diskon 50%!',
  ),
  _ProductData(
    name: 'Vintage White Ruffle',
    price: 'Rp 140.000',
    rating: 4.8,
    sold: 'Terjual 95+',
    description:
        'Blouse putih klasik dengan sentuhan ruffle vintage yang tidak pernah ketinggalan zaman.',
  ),
];

class _TailorData {
  final String name;
  final String address;
  final double rating;
  final int sold;
  const _TailorData({
    required this.name,
    required this.address,
    required this.rating,
    required this.sold,
  });
}

const List<_TailorData> _dummyTailors = [
  _TailorData(
    name: 'Pak Rony',
    address: 'Jl. Raya Ijen No. 12',
    rating: 4.9,
    sold: 200,
  ),
  _TailorData(
    name: 'Bu Titik',
    address: 'Jl. Jakarta No. 16',
    rating: 4.8,
    sold: 150,
  ),
  _TailorData(
    name: 'Pak Jon',
    address: 'Jl. Veteran No. 5',
    rating: 4.7,
    sold: 120,
  ),
  _TailorData(
    name: 'Bu Ratna',
    address: 'Jl. Semeru No. 33',
    rating: 4.9,
    sold: 300,
  ),
];

class _RequestData {
  final String customerName;
  final String address;
  final String product;
  final String size;
  final String color;
  const _RequestData({
    required this.customerName,
    required this.address,
    required this.product,
    required this.size,
    required this.color,
  });
}

const List<_RequestData> _dummyRequests = [
  _RequestData(
    customerName: 'Mita Ramadhani',
    address: 'Jl. Raya Cempaka No. 12',
    product: 'Jaket Regen',
    size: 'L',
    color: 'Hijau',
  ),
  _RequestData(
    customerName: 'Bella Agustina',
    address: 'Jl. Raya Ijen No. 9',
    product: 'Blouse Ruffle',
    size: 'M',
    color: 'Putih',
  ),
  _RequestData(
    customerName: 'Dinda Ayu',
    address: 'Jl. Raya Anggrek No. 119',
    product: 'Rok Jeans',
    size: 'S',
    color: 'Hitam',
  ),
];
