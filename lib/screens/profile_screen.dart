import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 24),
              _buildAvatar(),
              const SizedBox(height: 24),
              _buildBudgetCard(),
              const SizedBox(height: 24),
              _buildSettingsTile(Icons.notifications_outlined, 'Notifications', 'Get budget alerts', trailing: Switch(value: true, onChanged: (_) {})),
              _buildSettingsTile(Icons.download_outlined, 'Export Data', 'Download CSV report'),
              _buildSettingsTile(Icons.palette_outlined, 'Appearance', 'Dark / Light mode'),
              _buildSettingsTile(Icons.logout, 'Log Out', 'Sign out of your account', danger: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFF0D9488)]),
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: const Color(0xFF7C3AED).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 6))],
          ),
          child: const Center(
            child: Text('LK', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 12),
        const Text('Layan Khayyat', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text('layan@psut.edu.jo', style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildBudgetCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Monthly Budget', style: TextStyle(color: Colors.grey, fontSize: 13)),
              const Text('\$500.00', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Edit', style: TextStyle(color: Color(0xFF7C3AED), fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle, {Widget? trailing, bool danger = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: danger ? Colors.red.shade50 : const Color(0xFFF3F0FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: danger ? Colors.red : const Color(0xFF7C3AED), size: 20),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: danger ? Colors.red : null)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
        trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
