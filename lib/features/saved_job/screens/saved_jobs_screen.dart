
import 'dart:ui';

import 'package:flutter/material.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Saved Jobs List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SavedJobCard(
                    location: 'Remote',
                    title: 'Senior Product Designer',
                    company: 'Tech Innovators Inc.',
                    salary: '\$120K - \$150K',
                    icon: Icons.lightbulb_outline,
                  ),
                  const SizedBox(height: 15),
                  SavedJobCard(
                    location: 'Remote',
                    title: 'UX/UI Designer',
                    company: 'Creative Solutions Co.',
                    salary: '\$90K - \$110K',
                    icon: Icons.palette_outlined,
                  ),
                  const SizedBox(height: 15),
                  SavedJobCard(
                    location: 'Remote',
                    title: 'Frontend Developer',
                    company: 'Digital Frontier Ltd.',
                    salary: '\$100K - \$130K',
                    icon: Icons.code,
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

class SavedJobCard extends StatelessWidget {
  final String location;
  final String title;
  final String company;
  final String salary;
  final IconData icon;

  const SavedJobCard({
    Key? key,
    required this.location,
    required this.title,
    required this.company,
    required this.salary,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Job Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$company · $salary',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            // Company Logo
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF2D4D3D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white.withOpacity(0.8),
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}