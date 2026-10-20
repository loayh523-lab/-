import 'package:flutter/material.dart';

void main() {
  runApp(const MithaqApp());
}

const Color appBackground = Color(0xFF081712);
const Color appSurface = Color(0xFF10271F);
const Color appSurfaceLight = Color(0xFF18372B);
const Color appGreen = Color(0xFF3B9B75);
const Color appGold = Color(0xFFD8B875);
const Color appMuted = Color(0xFFA7B9AE);

class MithaqApp extends StatelessWidget {
  const MithaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مِيثَاقُ المُؤْمِنِ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: appGreen,
          brightness: Brightness.dark,
          surface: appSurface,
        ),
        scaffoldBackgroundColor: appBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: appBackground,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MainShell(),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selectedIndex = 0;

  static const List<String> titles = <String>[
    'الرئيسية',
    'القرآن الكريم',
    'الأدعية والزيارات',
    'التسبيح',
    'الإعدادات',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      HomePage(onNavigate: (int index) => setState(() => selectedIndex = index)),
      const SimplePage(
        icon: Icons.menu_book_rounded,
        title: 'القرآن الكريم',
        description: 'سيُضاف فهرس السور ونص المصحف من مصدر موثوق بعد التحقق منه.',
      ),
      const SimplePage(
        icon: Icons.volunteer_activism_rounded,
        title: 'الأدعية والزيارات',
        description: 'ستُضاف النصوص مع توثيق مصادرها ومراجعتها قبل اعتمادها.',
      ),
      const TasbeehPage(),
      const SimplePage(
        icon: Icons.tune_rounded,
        title: 'الإعدادات',
        description: 'خيارات المظهر والتنبيهات والمصادر ستُضاف على مراحل.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: appSurfaceLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: appGold.withValues(alpha: 0.5)),
              ),
              child: const Icon(Icons.auto_awesome, color: appGold, size: 21),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'مِيثَاقُ المُؤْمِنِ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                ),
                Text(
                  titles[selectedIndex],
                  style: const TextStyle(fontSize: 11, color: appMuted),
                ),
              ],
            ),
          ],
        ),
      ),
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() => selectedIndex = index);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'القرآن',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border_rounded),
            selectedIcon: Icon(Icons.volunteer_activism_rounded),
            label: 'الأدعية',
          ),
          NavigationDestination(
            icon: Icon(Icons.fingerprint_rounded),
            selectedIcon: Icon(Icons.fingerprint_rounded),
            label: 'التسبيح',
          ),
          NavigationDestination(
            icon: Icon(Icons.tune_rounded),
            selectedIcon: Icon(Icons.tune_rounded),
            label: 'الإعدادات',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey<String>('home-page'),
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xFF205640),
                Color(0xFF10271F),
                Color(0xFF0C1E17),
              ],
            ),
            border: Border.all(color: appGold.withValues(alpha: 0.28)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'رفيقك في العبادة',
                style: TextStyle(
                  color: appGold,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 18),
              Text(
                'السلام على قلبك',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 8),
              Text(
                'خذ من يومك لحظةً تقرّبك إلى الله.',
                style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8),
              ),
              SizedBox(height: 18),
              Row(
                children: <Widget>[
                  Icon(Icons.spa_outlined, color: appGold, size: 18),
                  SizedBox(width: 7),
                  Text(
                    'بداية هادئة، وأثر يبقى',
                    style: TextStyle(color: appGold, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'مساحة يومك',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        const Row(
          children: <Widget>[
            Expanded(
              child: _StatCard(
                icon: Icons.menu_book_rounded,
                title: 'القرآن',
                subtitle: 'ابدأ وردك',
                color: appGreen,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _StatCard(
                icon: Icons.favorite_rounded,
                title: 'الذكر',
                subtitle: 'لحظة طمأنينة',
                color: appGold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'الوصول السريع',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.4,
          children: <Widget>[
            _ActionCard(
              icon: Icons.menu_book_rounded,
              title: 'القرآن الكريم',
              subtitle: 'السور والقراءة',
              onTap: () => onNavigate(1),
            ),
            _ActionCard(
              icon: Icons.volunteer_activism_rounded,
              title: 'الأدعية والزيارات',
              subtitle: 'مناجاة وزيارة',
              onTap: () => onNavigate(2),
            ),
            _ActionCard(
              icon: Icons.fingerprint_rounded,
              title: 'التسبيح',
              subtitle: 'عداد الذكر',
              onTap: () => onNavigate(3),
            ),
            _ActionCard(
              icon: Icons.tune_rounded,
              title: 'الإعدادات',
              subtitle: 'تخصيص التطبيق',
              onTap: () => onNavigate(4),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.lightbulb_outline_rounded, color: appGold, size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'نيّة اليوم',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'اجعل لك وقتاً هادئاً مع القرآن والذكر، ولو كان قليلاً.',
                      style: TextStyle(color: appMuted, height: 1.7, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: appSurface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: color, size: 23),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: appMuted, fontSize: 11)),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: appSurface,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, color: appGold, size: 24),
              const SizedBox(height: 10),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: appMuted, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  const SimplePage({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: appGold.withValues(alpha: 0.17)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: appSurfaceLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: appGold, size: 28),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(color: appMuted, height: 1.9),
              ),
              const SizedBox(height: 16),
              const Text(
                'هذه المرحلة قيد الإعداد؛ لم نضع نصوصاً دينية غير متحققة أو وظائف ندّعي أنها مكتملة.',
                style: TextStyle(color: appGold, fontSize: 12, height: 1.8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TasbeehPage extends StatefulWidget {
  const TasbeehPage({super.key});

  @override
  State<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends State<TasbeehPage> {
  int count = 0;
  String phrase = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: <Widget>[
        const Text(
          'التسبيح',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        const Text(
          'عداد بسيط لمتابعة الذكر',
          style: TextStyle(color: appMuted),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: appGold.withValues(alpha: 0.2)),
          ),
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                initialValue: phrase,
                decoration: InputDecoration(
                  labelText: 'الذكر',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'سبحان الله',
                    child: Text('سبحان الله'),
                  ),
                  DropdownMenuItem(
                    value: 'الحمد لله',
                    child: Text('الحمد لله'),
                  ),
                  DropdownMenuItem(
                    value: 'الله أكبر',
                    child: Text('الله أكبر'),
                  ),
                  DropdownMenuItem(
                    value: 'أستغفر الله',
                    child: Text('أستغفر الله'),
                  ),
                  DropdownMenuItem(
                    value: 'اللهم صل على محمد وآل محمد',
                    child: Text('اللهم صل على محمد وآل محمد'),
                  ),
                ],
                onChanged: (String? value) {
                  if (value != null) setState(() => phrase = value);
                },
              ),
              const SizedBox(height: 28),
              Container(
                width: 190,
                height: 190,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: appGold, width: 5),
                  color: appBackground,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      count.toString(),
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text('تسبيحة', style: TextStyle(color: appMuted)),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Text(
                phrase,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: appGold,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: () => setState(() => count += 1),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('تسبيحة جديدة'),
                  style: FilledButton.styleFrom(
                    backgroundColor: appGreen,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () => setState(() => count = 0),
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('تصفير العداد'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'العدد لا يُحفظ بعد إغلاق التطبيق في هذه النسخة الأولية؛ سنضيف التخزين المحلي لاحقاً.',
          textAlign: TextAlign.center,
          style: TextStyle(color: appMuted, fontSize: 12, height: 1.7),
        ),
      ],
    );
  }
}
