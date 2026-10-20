import 'package:flutter/material.dart';

void main() => runApp(const MithaqApp());

const Color appBackground = Color(0xFF081712);
const Color appSurface = Color(0xFF10271F);
const Color appSurfaceLight = Color(0xFF18372B);
const Color appGreen = Color(0xFF3B9B75);
const Color appGold = Color(0xFFD8B875);
const Color appMuted = Color(0xFFA7B9AE);

class MithaqApp extends StatelessWidget {
  const MithaqApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
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

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedPage = 0;

  static const List<_MenuItem> menuItems = <_MenuItem>[
    _MenuItem('الرئيسية', Icons.home_rounded),
    _MenuItem('القرآن الكريم', Icons.menu_book_rounded),
    _MenuItem('الأدعية والمناجيات', Icons.volunteer_activism_rounded),
    _MenuItem('الزيارات', Icons.account_balance_rounded),
    _MenuItem('الأذكار والتسبيح', Icons.fingerprint_rounded),
    _MenuItem('مواقيت الصلاة والقبلة', Icons.explore_rounded),
    _MenuItem('التقويم والأعمال', Icons.calendar_month_rounded),
    _MenuItem('المناسبات والمواسم', Icons.event_rounded),
    _MenuItem('الصوتيات', Icons.headphones_rounded),
    _MenuItem('أسماء الله الحسنى', Icons.auto_awesome_rounded),
    _MenuItem('المفضلة', Icons.bookmark_rounded),
    _MenuItem('الإعدادات', Icons.settings_rounded),
  ];

  void openPage(int index) {
    setState(() => selectedPage = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      const HomePage(),
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
        icon: Icons.calendar_month_rounded,
        title: 'التقويم والأعمال',
        description: 'سيُربط التقويم الهجري بأعمال الأيام والمناسبات والروايات الموثوقة.',
      ),
      const SimplePage(
        icon: Icons.settings_rounded,
        title: 'الإعدادات',
        description: 'هنا ستُضبط المدينة وطريقة حساب مواقيت الصلاة والتنبيهات.',
      ),
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        backgroundColor: appBackground,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: appSurfaceLight,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: appGold.withValues(alpha: .5)),
                      ),
                      child: const Icon(Icons.auto_awesome, color: appGold),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('مِيثَاقُ المُؤْمِنِ',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
                        SizedBox(height: 4),
                        Text('رفيق العبادة والإيمان', style: TextStyle(color: appMuted, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: appSurfaceLight, height: 1),
              const SizedBox(height: 8),
              for (int i = 0; i < menuItems.length; i++)
                ListTile(
                  leading: Icon(menuItems[i].icon,
                      color: selectedPage == i ? appGold : appMuted),
                  title: Text(menuItems[i].title,
                      style: TextStyle(
                        color: selectedPage == i ? Colors.white : appMuted,
                        fontWeight: selectedPage == i ? FontWeight.w800 : FontWeight.w500,
                      )),
                  selected: selectedPage == i,
                  selectedTileColor: appSurfaceLight,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  onTap: () => openPage(i),
                ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('اللهم اجعل هذا العمل خالصاً لوجهك الكريم',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: appMuted, fontSize: 12, height: 1.8)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'القائمة الجانبية',
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(Icons.cloud_outlined, color: appGold, size: 27),
        ),
        title: const Text('مِيثَاقُ المُؤْمِنِ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
        centerTitle: true,
      ),
      body: IndexedStack(index: selectedPage, children: pages),
    );
  }
}

class _MenuItem {
  const _MenuItem(this.title, this.icon);
  final String title;
  final IconData icon;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String date = _formatDate(DateTime.now());
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[Color(0xFF205640), appSurface, Color(0xFF0C1E17)],
            ),
            border: Border.all(color: appGold.withValues(alpha: .28)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('الصلاة القادمة', style: TextStyle(color: appGold, fontSize: 13)),
              const SizedBox(height: 10),
              const Text('تُحدَّد بعد ضبط الموقع',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              const SizedBox(height: 7),
              const Text('فعّل تحديد المدينة من الإعدادات لعرض الوقت الصحيح.',
                  style: TextStyle(color: Color(0xFFD2DFD6), height: 1.7, fontSize: 12)),
              const SizedBox(height: 18),
              Row(
                children: <Widget>[
                  const Icon(Icons.calendar_today_rounded, color: appGold, size: 16),
                  const SizedBox(width: 8),
                  Text(date, style: const TextStyle(color: appGold, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const _SectionTitle(title: 'أوقات الصلاة'),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: const BorderRadius.circular(20),
          ),
          child: Column(
            children: const <Widget>[
              _PrayerRow(title: 'الفجر', icon: Icons.nightlight_round),
              _PrayerRow(title: 'الشروق', icon: Icons.wb_twilight_rounded),
              _PrayerRow(title: 'الظهر', icon: Icons.wb_sunny_outlined),
              _PrayerRow(title: 'العصر', icon: Icons.sunny),
              _PrayerRow(title: 'المغرب', icon: Icons.wb_twilight_rounded),
              _PrayerRow(title: 'العشاء', icon: Icons.nights_stay_outlined, last: true),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const _SectionTitle(title: 'القرآن الكريم'),
        const SizedBox(height: 10),
        _FeatureTile(
          icon: Icons.menu_book_rounded,
          title: 'وردك من القرآن',
          subtitle: 'افتح المصحف وتابع قراءتك',
          onTap: () => _showNotReady(context, 'القرآن الكريم'),
        ),
        const SizedBox(height: 22),
        const _SectionTitle(title: 'أعمال اليوم المصادف'),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: appGold.withValues(alpha: .15)),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.event_note_rounded, color: appGold, size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'ستظهر هنا أعمال اليوم والمناسبات بحسب التاريخ الهجري بعد ربط تقويم موثوق.',
                  style: TextStyle(color: appMuted, height: 1.8, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String _formatDate(DateTime date) =>
    '${date.day} / ${date.month} / ${date.year} م';

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      );
}

class _PrayerRow extends StatelessWidget {
  const _PrayerRow({required this.title, required this.icon, this.last = false});
  final String title;
  final IconData icon;
  final bool last;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        decoration: BoxDecoration(
          border: last ? null : const Border(bottom: BorderSide(color: appSurfaceLight)),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: appGold, size: 20),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600))),
            const Text('--:--', style: TextStyle(color: appMuted)),
          ],
        ),
      );
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
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
  Widget build(BuildContext context) => Material(
        color: appSurface,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: appSurfaceLight,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: appGold),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                      const SizedBox(height: 5),
                      Text(subtitle, style: const TextStyle(color: appMuted, fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_left_rounded, color: appMuted),
              ],
            ),
          ),
        ),
      );
}

void _showNotReady(BuildContext context, String feature) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('$feature قيد الإعداد وسيُضاف بمحتوى موثوق.')),
  );
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
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(18),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: appGold.withValues(alpha: .17)),
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
                Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                Text(description, style: const TextStyle(color: appMuted, height: 1.9)),
              ],
            ),
          ),
        ],
      );
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
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(18),
        children: <Widget>[
          const Text('التسبيح', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          const Text('عداد بسيط لمتابعة الذكر', style: TextStyle(color: appMuted)),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: appGold.withValues(alpha: .2)),
            ),
            child: Column(
              children: <Widget>[
                DropdownButtonFormField<String>(
                  initialValue: phrase,
                  decoration: InputDecoration(
                    labelText: 'الذكر',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(value: 'سبحان الله', child: Text('سبحان الله')),
                    DropdownMenuItem(value: 'الحمد لله', child: Text('الحمد لله')),
                    DropdownMenuItem(value: 'الله أكبر', child: Text('الله أكبر')),
                    DropdownMenuItem(value: 'أستغفر الله', child: Text('أستغفر الله')),
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
                      Text('$count', style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w900)),
                      const Text('تسبيحة', style: TextStyle(color: appMuted)),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Text(phrase,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: appGold, fontWeight: FontWeight.w800)),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: () => setState(() => count += 1),
                    icon: const Icon(Icons.add_rounded),
                    label: const Text('تسبيحة جديدة'),
                    style: FilledButton.styleFrom(backgroundColor: appGreen, foregroundColor: Colors.white),
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
        ],
      );
}
