import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Herb Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,  // 2 columns layout
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            DashboardCard(
              icon: Icons.local_florist,
              label: 'Herbs',
              onTap: () {
                // Navigate to Herbs screen
                Navigator.pushNamed(context, '/herbs');
              },
            ),
            DashboardCard(
              icon: Icons.book,
              label: 'Knowledge',
              onTap: () {
                // Navigate to Knowledge screen
                Navigator.pushNamed(context, '/knowledge');
              },
            ),
            DashboardCard(
              icon: Icons.favorite,
              label: 'Favorites',
              onTap: () {
                // Navigate to Favorites screen
                Navigator.pushNamed(context, '/favorites');
              },
            ),
            DashboardCard(
              icon: Icons.help,
              label: 'Remedies',
              onTap: () {
                // Navigate to Remedies screen
                Navigator.pushNamed(context, '/remedies');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  DashboardCard({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Theme.of(context).primaryColor),
            SizedBox(height: 12),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
