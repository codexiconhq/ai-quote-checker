import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteCheckerApp());
}

class QuoteCheckerApp extends StatelessWidget {
  const QuoteCheckerApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF14213D);
    const blue = Color(0xFF2563EB);

    return MaterialApp(
      title: 'AI Quote Checker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          primary: blue,
          surface: const Color(0xFFF7F9FC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F9FC),
          foregroundColor: navy,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFE8EDF5)),
          ),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final pages = const [
    DashboardScreen(),
    UploadScreen(),
    SampleResultScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.space_dashboard_outlined),
            selectedIcon: Icon(Icons.space_dashboard),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.cloud_upload_outlined),
            selectedIcon: Icon(Icons.cloud_upload),
            label: 'Upload',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics),
            label: 'Results',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
      children: [
        Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF1FF),
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(Icons.fact_check_rounded,
                  color: Color(0xFF2563EB)),
            ),
            const SizedBox(width: 11),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AI Quote Checker',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  Text('Make better decisions with confidence',
                      style: TextStyle(fontSize: 11, color: Colors.black54)),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text('Welcome back',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: Color(0xFF14213D))),
        const SizedBox(height: 7),
        const Text('Review quotations. Understand costs. Choose smarter.',
            style: TextStyle(color: Color(0xFF64748B), height: 1.4)),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1D4ED8), Color(0xFF3B82F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.auto_awesome, color: Colors.white, size: 25),
              const SizedBox(height: 16),
              const Text('Check your next quotation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 7),
              const Text(
                'Upload a quote and let AI help you identify costs, missing details and potential red flags.',
                style: TextStyle(color: Colors.white70, height: 1.45),
              ),
              const SizedBox(height: 18),
              FilledButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const UploadScreen()),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1D4ED8),
                ),
                icon: const Icon(Icons.add),
                label: const Text('Check a quotation'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text('Your workspace',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.description_outlined,
                title: 'Quotes checked',
                value: '0',
                color: Color(0xFF2563EB),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: StatCard(
                icon: Icons.savings_outlined,
                title: 'Potential savings',
                value: '$0',
                color: Color(0xFF059669),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text('How it works',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        const StepTile(
            number: '01',
            title: 'Upload a quotation',
            subtitle: 'Add a PDF or a clear image of your quote.'),
        const StepTile(
            number: '02',
            title: 'AI reviews the details',
            subtitle: 'We organise costs, items and potential issues.'),
        const StepTile(
            number: '03',
            title: 'Understand your options',
            subtitle: 'Review findings before making a decision.'),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 15),
            Text(value,
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(title,
                style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}

class StepTile extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;

  const StepTile({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Text(number,
                style: const TextStyle(
                    color: Color(0xFF2563EB), fontWeight: FontWeight.w800)),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 3),
                Text(subtitle,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 12),
        const Text('Upload quotation',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: Color(0xFF14213D))),
        const SizedBox(height: 8),
        const Text(
          'Add a quotation document to begin your review.',
          style: TextStyle(color: Color(0xFF64748B)),
        ),
        const SizedBox(height: 28),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: const Color(0xFF93B4F8),
                width: 1.5,
                style: BorderStyle.solid),
          ),
          child: const Column(
            children: [
              Icon(Icons.cloud_upload_outlined,
                  size: 54, color: Color(0xFF2563EB)),
              SizedBox(height: 16),
              Text('Choose a quotation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              SizedBox(height: 7),
              Text('PDF, JPG or PNG',
                  style: TextStyle(color: Colors.black54)),
              SizedBox(height: 5),
              Text('File upload will be enabled in the next development step.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black45)),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const Text('Before you upload',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        const StepTile(
            number: '1',
            title: 'Use a clear document',
            subtitle: 'Make sure prices and item descriptions are readable.'),
        const StepTile(
            number: '2',
            title: 'Check the currency',
            subtitle: 'Keep the currency and quotation details visible.'),
        const StepTile(
            number: '3',
            title: 'Protect sensitive details',
            subtitle: 'Avoid sharing information that is not needed for review.'),
      ],
    );
  }
}

class SampleResultScreen extends StatelessWidget {
  const SampleResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 12),
        const Text('Analysis results',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: Color(0xFF14213D))),
        const SizedBox(height: 8),
        const Text('A preview of the insights your quotation report will show.',
            style: TextStyle(color: Color(0xFF64748B))),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF1FF),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFF2563EB), size: 28),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Sample report preview — not an actual AI assessment.',
                  style: TextStyle(
                      color: Color(0xFF1E40AF), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('Quotation overview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
                child: StatCard(
                    icon: Icons.attach_money,
                    title: 'Quoted total',
                    value: '$2,450',
                    color: Color(0xFF2563EB))),
            SizedBox(width: 12),
            Expanded(
                child: StatCard(
                    icon: Icons.list_alt,
                    title: 'Line items',
                    value: '12',
                    color: Color(0xFF7C3AED))),
          ],
        ),
        const SizedBox(height: 22),
        const Text('Review areas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        const ResultTile(
            icon: Icons.price_check,
            title: 'Price breakdown',
            subtitle: 'A clear view of item costs, taxes and totals.',
            color: Color(0xFF2563EB)),
        const ResultTile(
            icon: Icons.warning_amber_rounded,
            title: 'Potential red flags',
            subtitle: 'Unclear charges or details that may need attention.',
            color: Color(0xFFD97706)),
        const ResultTile(
            icon: Icons.fact_check_outlined,
            title: 'Missing information',
            subtitle: 'Terms, quantities or details that may need confirmation.',
            color: Color(0xFF059669)),
        const SizedBox(height: 12),
        const Text(
          'This is illustrative sample content. Real analysis will be connected after secure document upload and AI integration.',
          style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.4),
        ),
      ],
    );
  }
}

class ResultTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const ResultTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.10),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
