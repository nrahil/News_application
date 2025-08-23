import 'package:flutter/material.dart';
import 'package:news_app/pages/saved_articles_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  final void Function(bool) onToggleTheme;
  final bool isDark;

  const ProfilePage(
      {super.key, required this.onToggleTheme, required this.isDark});

  void _signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white),
        ),
        backgroundColor:
            isDark ? const Color(0xFF212121) : Theme.of(context).primaryColor,
        elevation: 4,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          // Use a StreamBuilder to fetch and display user data
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return _buildHeader(context,
                    userName: "User Name", userEmail: "user@email.com");
              }
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return _buildHeader(context,
                  userName: userData['username'] ?? "User Name",
                  userEmail: userData['email'] ?? "user@email.com");
            },
          ),
          const SizedBox(height: 16),
          _buildOptionTile(
            context,
            icon: Icons.bookmark_border,
            title: "Saved Articles",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SavedArticlesPage()));
            },
          ),
          _buildOptionTile(
            context,
            icon: Icons.settings_outlined,
            title: "Settings",
            onTap: () {
              // Navigate to Settings page
            },
          ),
          _buildToggleTile(
            context,
            icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            title: "Dark Mode",
            value: isDark,
            onChanged: (value) => onToggleTheme(value),
          ),
          _buildOptionTile(
            context,
            icon: Icons.logout,
            title: "Log Out",
            onTap: _signOut,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context,
      {required String userName, required String userEmail}) {
    // This is now a separate function to build the header with the fetched data
    final headerTextColor =
        isDark ? Colors.white : Theme.of(context).textTheme.bodySmall!.color;
    final emailTextColor =
        isDark ? Colors.grey : Theme.of(context).textTheme.bodySmall!.color;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Text(
            userName,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: headerTextColor),
          ),
          const SizedBox(height: 4),
          Text(
            userEmail,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: emailTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final iconColor =
        isDark ? Theme.of(context).hintColor : Theme.of(context).primaryColor;
    final trailingIconColor = isDark ? Colors.grey[600] : Colors.grey;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).cardColor,
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        trailing: Icon(Icons.chevron_right, color: trailingIconColor),
        onTap: onTap,
      ),
    );
  }

  Widget _buildToggleTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final iconColor =
        isDark ? Theme.of(context).hintColor : Theme.of(context).primaryColor;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).cardColor,
      elevation: 2,
      child: SwitchListTile(
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        secondary: Icon(icon, color: iconColor),
        value: value,
        onChanged: onChanged,
        activeColor: Theme.of(context).primaryColor,
        inactiveThumbColor: Colors.grey,
      ),
    );
  }
}
