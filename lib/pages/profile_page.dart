import 'package:flutter/material.dart';
import 'package:news_app/pages/saved_articles_page.dart';

class ProfilePage extends StatelessWidget {
  final void Function(bool) onToggleTheme;
  final bool isDark;

  const ProfilePage({Key? key, required this.onToggleTheme, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        // This is the updated line to make the app bar dark in dark mode
        backgroundColor: isDark ? const Color(0xFF212121) : Theme.of(context).primaryColor,
        elevation: 4,
        automaticallyImplyLeading: false, // Prevents back button on this page
      ),
      body: ListView(
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildOptionTile(
            context,
            icon: Icons.person_outline,
            title: "My Details",
            onTap: () {
              // Navigate to My Details page
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MyDetailsPage()));
            },
          ),
          _buildOptionTile(
            context,
            icon: Icons.bookmark_border,
            title: "Saved Articles",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SavedArticlesPage()));
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
            onTap: () {
              // Implement log out logic
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final headerTextColor = isDark ? Colors.white : Theme.of(context).textTheme.bodySmall!.color;
    final emailTextColor = isDark ? Colors.grey : Theme.of(context).textTheme.bodySmall!.color;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: isDark ? Colors.grey[700] : Colors.grey,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            "User Name",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: headerTextColor),
          ),
          const SizedBox(height: 4),
          Text(
            "user@email.com",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: emailTextColor),
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
    final iconColor = isDark ? Theme.of(context).hintColor : Theme.of(context).primaryColor;
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
    final iconColor = isDark ? Theme.of(context).hintColor : Theme.of(context).primaryColor;
    
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