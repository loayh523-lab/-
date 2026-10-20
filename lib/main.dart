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
      HomePage(onOpen: (int index) => setState(() => selectedPage = index)),
      const CatalogPage(title: 'القرآن الكريم', subtitle: 'الفرقان المبارك', groups: <CatalogGroup>[
        CatalogGroup('المصحف الشريف', <String>['فهرس السور الـ114', 'أجزاء القرآن الكريم', 'متابعة القراءة', 'ختمة القرآن']),
        CatalogGroup('أدوات القراءة', <String>['علامات الوقف والمتابعة', 'العلامات المرجعية', 'إعدادات العرض']),
      ]),
      const CatalogPage(title: 'الأدعية والمناجيات', subtitle: 'رياض الأدعية والمناجيات', groups: <CatalogGroup>[
        CatalogGroup('الأدعية المشهورة', <String>['دعاء كميل', 'دعاء الصباح', 'دعاء التوسل', 'دعاء الندبة', 'دعاء العهد', 'دعاء الفرج', 'دعاء السمات', 'الجوشن الكبير والصغير', 'دعاء أبي حمزة الثمالي', 'دعاء الافتتاح', 'مكارم الأخلاق', 'دعاء المشلول', 'دعاء المجير', 'دعاء البهاء', 'دعاء العديلة', 'دعاء علقمة وصفوان', 'دعاء الحزين والملهوف', 'التوبة والاستغفار', 'قضاء الحوائج']),
        CatalogGroup('المكتبات', <String>['الصحيفة السجادية', 'المناجيات الخمس عشرة', 'أدعية الإمام المهدي والفرج', 'أدعية الأيام والليالي', 'أدعية شهر رمضان', 'أدعية المناسبات', 'أدعية التوبة والأخلاق', 'أدعية الرزق والشدائد']),
      ]),
      const CatalogPage(title: 'الزيارات', subtitle: 'السلام على محمد وآل محمد', groups: <CatalogGroup>[
        CatalogGroup('الزيارات الجامعة', <String>['زيارة عاشوراء', 'زيارة أمين الله', 'الزيارة الجامعة الكبيرة', 'زيارة السيدة فاطمة الزهراء عليها السلام']),
        CatalogGroup('زيارات المعصومين', <String>['النبي محمد صلى الله عليه وآله', 'أمير المؤمنين عليه السلام', 'الإمام الحسن عليه السلام', 'الإمام الحسين عليه السلام', 'أبو الفضل العباس عليه السلام', 'بقية الأئمة عليهم السلام']),
      ]),
      const CatalogPage(title: 'الأذكار والتسبيح', subtitle: 'حصن الذاكرين', groups: <CatalogGroup>[
        CatalogGroup('الأذكار اليومية', <String>['أذكار الصباح', 'أذكار المساء', 'أذكار النوم', 'أذكار الاستيقاظ', 'أذكار الحفظ والحماية']),
        CatalogGroup('العدادات', <String>['التسبيح الإلكتروني', 'تسبيح الزهراء عليها السلام', 'عداد الركعات', 'حساب سجدتي السهو']),
      ]),
      const CatalogPage(title: 'مواقيت الصلاة والقبلة', subtitle: 'مواقيت ووجهة الصلاة', groups: <CatalogGroup>[
        CatalogGroup('الصلاة', <String>['مواقيت الصلوات الخمس', 'الصلاة القادمة والعد التنازلي', 'التعقيبات بعد الصلاة', 'أذان وتنبيهات الصلاة']),
        CatalogGroup('الموقع والاتجاه', <String>['تحديد المدينة', 'اتجاه القبلة', 'طريقة حساب المواقيت']),
      ]),
      const CatalogPage(title: 'التقويم والأعمال', subtitle: 'الأيام والمناسبات', groups: <CatalogGroup>[
        CatalogGroup('التقويم', <String>['التقويم الهجري', 'المناسبات الإسلامية', 'مواليد ووفيات أهل البيت عليهم السلام']),
        CatalogGroup('الأعمال', <String>['أعمال الأيام', 'أعمال الأشهر', 'الليالي المباركة', 'أعمال يوم الجمعة']),
      ]),
      const CatalogPage(title: 'المناسبات والمواسم', subtitle: 'دليل المواسم الإيمانية', groups: <CatalogGroup>[
        CatalogGroup('المواسم', <String>['شهر رمضان المبارك', 'جدول الإمساك والإفطار', 'الأعمال اليومية لشهر رمضان', 'الحج والعمرة', 'دليل زيارة الأربعين']),
        CatalogGroup('الأدلة', <String>['أحكام ومناسك الحج والعمرة', 'دليل الزائر', 'الإرشادات والخرائط']),
      ]),
      const CatalogPage(title: 'الصوتيات', subtitle: 'مكتبة الاستماع', groups: <CatalogGroup>[
        CatalogGroup('الصوتيات الدينية', <String>['تلاوات القرآن الكريم', 'الأذان', 'الأدعية الصوتية', 'الزيارات الصوتية', 'الأناشيد والابتهالات']),
        CatalogGroup('قوائم الاستماع', <String>['المحفوظات الصوتية', 'آخر ما استمعت إليه']),
      ]),
      const CatalogPage(title: 'أسماء الله الحسنى', subtitle: 'تعرّف إلى الأسماء ومعانيها', groups: <CatalogGroup>[
        CatalogGroup('الأسماء الحسنى', <String>['فهرس الأسماء الـ99', 'معاني الأسماء', 'الأسماء المفضلة']),
      ]),
      const CatalogPage(title: 'المفضلة', subtitle: 'ما حفظته للرجوع إليه', groups: <CatalogGroup>[
        CatalogGroup('المحفوظات', <String>['السور المفضلة', 'الأدعية والزيارات المفضلة', 'الأذكار المحفوظة', 'الصوتيات المفضلة']),
      ]),
      const CatalogPage(title: 'الإعدادات', subtitle: 'خصص تجربتك', groups: <CatalogGroup>[
        CatalogGroup('التخصيص', <String>['المظهر الأخضر الزمردي', 'حجم الخط وطريقة العرض', 'اللغة واتجاه العرض']),
        CatalogGroup('التنبيهات والصوت', <String>['تنبيهات الصلاة', 'الأذان والأصوات', 'التذكير بالأذكار']),
        CatalogGroup('الموقع والتطبيق', <String>['المدينة وطريقة حساب المواقيت', 'عن التطبيق', 'المصادر والتوثيق']),
      ]),
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
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: <Widget>[
                    for (int i = 0; i < menuItems.length; i++)
                      ListTile(
                        leading: Icon(menuItems[i].icon,
                            color: selectedPage == i ? appGold : appMuted),
                        title: Text(menuItems[i].title,
                            style: TextStyle(
                              color: selectedPage == i ? Colors.white : appMuted,
                              fontWeight: selectedPage == i ? FontWeight.w800 : FontWeight.w500,
                              fontSize: 14,
                            )),
                        selected: selectedPage == i,
                        selectedTileColor: appSurfaceLight,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                        onTap: () => openPage(i),
                      ),
                  ],
                ),
              ),
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
        title: Text(selectedPage == 0 ? 'مِيثَاقُ المُؤْمِنِ' : menuItems[selectedPage].title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: 'المفضلة',
            onPressed: () => setState(() => selectedPage = 10),
            icon: const Icon(Icons.bookmark_border_rounded, color: appGold),
          ),
        ],
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

class CatalogGroup {
  const CatalogGroup(this.title, this.items);
  final String title;
  final List<String> items;
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key, required this.title, required this.subtitle, required this.groups});
  final String title;
  final String subtitle;
  final List<CatalogGroup> groups;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[Color(0xFF205640), appSurface, Color(0xFF0C1E17)],
          ),
          border: Border.all(color: appGold.withValues(alpha: .28)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          const Text('مِيثَاقُ المُؤْمِنِ', style: TextStyle(color: appGold, fontSize: 12, fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(color: Color(0xFFD2DFD6), height: 1.7, fontSize: 13)),
          const SizedBox(height: 18),
          Container(height: 3, width: 58, decoration: BoxDecoration(color: appGold, borderRadius: BorderRadius.circular(8))),
        ]),
      ),
      const SizedBox(height: 24),
      for (final CatalogGroup group in groups) ...<Widget>[
        Text(group.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
        const SizedBox(height: 11),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(20), border: Border.all(color: appSurfaceLight)),
          child: Column(children: <Widget>[
            for (int i = 0; i < group.items.length; i++)
              Container(
                decoration: BoxDecoration(border: i == group.items.length - 1 ? null : const Border(bottom: BorderSide(color: appSurfaceLight, width: .8))),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  title: Text(group.items[i], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.5)),
                  trailing: const Icon(Icons.chevron_left_rounded, color: appMuted),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => PlaceholderDetailPage(
                        title: group.items[i],
                        section: title,
                      ),
                    ),
                  ),
                ),
              ),
          ]),
        ),
        const SizedBox(height: 22),
      ],
    ],
  );
}

class PlaceholderDetailPage extends StatelessWidget {
  const PlaceholderDetailPage({super.key, required this.title, required this.section});
  final String title;
  final String section;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800))),
    body: ListView(
      padding: const EdgeInsets.all(18),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[Color(0xFF205640), appSurface, Color(0xFF0C1E17)],
            ),
            border: Border.all(color: appGold.withValues(alpha: .3)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            const Icon(Icons.auto_awesome_rounded, color: appGold, size: 30),
            const SizedBox(height: 18),
            Text(section, style: const TextStyle(color: appGold, fontSize: 12, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.5)),
            const SizedBox(height: 12),
            const Text('مساحة مخصصة لهذا المحتوى ضمن تصميم ميثاق المؤمن.',
              style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
          ]),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: appSurfaceLight),
          ),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text('قيد استكمال المحتوى', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            SizedBox(height: 8),
            Text('التصميم الأساسي جاهز لهذه الصفحة. سيُضاف النص والمصادر والأدوات بعد اكتمال مرحلة تصميم الواجهات.',
              style: TextStyle(color: appMuted, height: 1.9, fontSize: 13)),
          ]),
        ),
        const SizedBox(height: 14),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_forward_rounded),
          label: const Text('العودة إلى القسم'),
          style: OutlinedButton.styleFrom(
            foregroundColor: appGold,
            side: const BorderSide(color: appGold),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onOpen});
  final ValueChanged<int> onOpen;

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
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            children: <Widget>[
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
        const _SectionTitle(title: 'تصفّح أقسام التطبيق'),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double itemWidth = (constraints.maxWidth - 12) / 2;
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.menu_book_rounded, title: 'القرآن الكريم', subtitle: 'المصحف والختمة', onTap: () => onOpen(1))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.volunteer_activism_rounded, title: 'الأدعية', subtitle: 'الأدعية والمناجيات', onTap: () => onOpen(2))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.account_balance_rounded, title: 'الزيارات', subtitle: 'زيارات أهل البيت', onTap: () => onOpen(3))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.fingerprint_rounded, title: 'الأذكار', subtitle: 'الأوراد والتسبيح', onTap: () => onOpen(4))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.explore_rounded, title: 'الصلاة والقبلة', subtitle: 'المواقيت والاتجاه', onTap: () => onOpen(5))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.calendar_month_rounded, title: 'التقويم', subtitle: 'الأيام والمناسبات', onTap: () => onOpen(6))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.event_rounded, title: 'المواسم', subtitle: 'رمضان والحج والأربعين', onTap: () => onOpen(7))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.headphones_rounded, title: 'الصوتيات', subtitle: 'تلاوات وأذان وأدعية', onTap: () => onOpen(8))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.auto_awesome_rounded, title: 'أسماء الله', subtitle: 'الأسماء والمعاني', onTap: () => onOpen(9))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.bookmark_border_rounded, title: 'المفضلة', subtitle: 'محفوظاتك', onTap: () => onOpen(10))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.settings_rounded, title: 'الإعدادات', subtitle: 'تخصيص التطبيق', onTap: () => onOpen(11))),
              ],
            );
          },
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

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
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
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: const BoxConstraints(minHeight: 132),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: appSurfaceLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[Color(0xFF2B7657), appSurfaceLight],
                ),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: appGold.withValues(alpha: .22)),
              ),
              child: Icon(icon, color: appGold, size: 21),
            ),
            const Spacer(),
            const SizedBox(height: 16),
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: appMuted, fontSize: 11, height: 1.5)),
          ],
        ),
      ),
    ),
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
