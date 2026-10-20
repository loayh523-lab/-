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
    _MenuItem('الأذكار اليومية', Icons.wb_sunny_outlined),
    _MenuItem('التسبيح الإلكتروني', Icons.fingerprint_rounded),
    _MenuItem('مواقيت الصلاة', Icons.access_time_rounded),
    _MenuItem('القبلة', Icons.explore_rounded),
    _MenuItem('التقويم الهجري', Icons.calendar_month_rounded),
    _MenuItem('الأعمال والعبادات', Icons.auto_awesome_rounded),
    _MenuItem('المناسبات والمواسم', Icons.event_rounded),
    _MenuItem('الصوتيات', Icons.headphones_rounded),
    _MenuItem('أسماء الله الحسنى', Icons.auto_awesome_rounded),
    _MenuItem('المفضلة', Icons.bookmark_rounded),
    _MenuItem('عداد الركعات', Icons.countertops_rounded),
    _MenuItem('سجدتا السهو', Icons.calculate_outlined),
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
      const QuranDesignPage(),
      const CatalogPage(title: 'الأدعية والمناجيات', subtitle: 'رياض الأدعية والمناجيات', groups: <CatalogGroup>[
        CatalogGroup('الأدعية المشهورة', <String>[
          'دعاء كميل', 'دعاء الصباح', 'دعاء التوسل', 'دعاء الندبة', 'دعاء العهد',
          'دعاء الفرج', 'دعاء السمات', 'دعاء المشلول', 'الجوشن الكبير', 'الجوشن الصغير',
          'دعاء العديلة', 'دعاء العديلة عند الموت', 'دعاء العشرات', 'دعاء يَستشير',
          'دعاء المجير', 'دعاء أبي حمزة الثمالي', 'دعاء الافتتاح', 'دعاء البهاء',
          'مكارم الأخلاق', 'دعاء علقمة', 'دعاء صفوان', 'دعاء الحزين', 'دعاء الملهوف',
          'دعاء سريع الإجابة', 'دعاء النور', 'دعاء الاحتجاب', 'إلهي عظم البلاء',
          'دعاء التوبة', 'الاستغفار', 'أدعية قضاء الحوائج'
        ]),
        CatalogGroup('الصحيفة السجادية', <String>['دعاؤه عليه السلام في التحميد لله عز وجل', 'دعاؤه عليه السلام في الصلاة على محمد وآله', 'دعاؤه عليه السلام في الصلاة على حملة العرش', 'دعاؤه عليه السلام في تصديق الرسل', 'دعاؤه عليه السلام لنفسه وخاصته', 'دعاؤه عليه السلام عند الصباح والمساء', 'دعاؤه عليه السلام عند المهمات', 'دعاؤه عليه السلام في الاستعاذة', 'دعاؤه عليه السلام في الاشتياق', 'دعاؤه عليه السلام في اللجأ إلى الله', 'دعاؤه عليه السلام في طلب العفو', 'دعاؤه عليه السلام في الاعتراف', 'دعاؤه عليه السلام في طلب الحوائج', 'دعاؤه عليه السلام عند الظلامات', 'دعاؤه عليه السلام عند المرض', 'دعاؤه عليه السلام في الاستقالة', 'دعاؤه عليه السلام على الشيطان', 'دعاؤه عليه السلام في المحذورات', 'دعاؤه عليه السلام في الاستسقاء', 'دعاؤه عليه السلام في مكارم الأخلاق', 'دعاؤه عليه السلام إذا أحزنه أمر', 'دعاؤه عليه السلام عند الشدة', 'دعاؤه عليه السلام بالعافية', 'دعاؤه عليه السلام للوالدين', 'دعاؤه عليه السلام لولده', 'دعاؤه عليه السلام لجيرانه وأوليائه', 'دعاؤه عليه السلام لأهل الثغور', 'دعاؤه عليه السلام في التفزع', 'دعاؤه عليه السلام عند ضيق الرزق', 'دعاؤه عليه السلام في المعونة على قضاء الدين', 'دعاؤه عليه السلام بالتوبة', 'دعاؤه عليه السلام بعد صلاة الليل', 'دعاؤه عليه السلام في الاستخارة', 'دعاؤه عليه السلام إذا ابتلي أو رأى مبتلى', 'دعاؤه عليه السلام في الرضا بالقضاء', 'دعاؤه عليه السلام عند سماع الرعد', 'دعاؤه عليه السلام في الشكر', 'دعاؤه عليه السلام في الاعتذار', 'دعاؤه عليه السلام في طلب الستر', 'دعاؤه عليه السلام عند ختم القرآن']),
        CatalogGroup('المناجيات الخمس عشرة', <String>['مناجاة التائبين', 'مناجاة الشاكين', 'مناجاة الخائفين', 'مناجاة الراجين', 'مناجاة الراغبين', 'مناجاة الشاكرين', 'مناجاة المريدين', 'مناجاة المحبين', 'مناجاة المطيعين', 'مناجاة المتوسلين', 'مناجاة المفتقرين', 'مناجاة العارفين', 'مناجاة الذاكرين', 'مناجاة المعتصمين', 'مناجاة الزاهدين']),
        CatalogGroup('أدعية الإمام المهدي والفرج', <String>['دعاء الفرج', 'دعاء العهد', 'دعاء الندبة', 'دعاء زمن الغيبة', 'دعاء التوسل بالإمام المهدي عليه السلام', 'دعاء اللهم كن لوليك', 'دعاء السلام عليك يا صاحب الزمان', 'زيارة آل ياسين', 'دعاء تجديد العهد']),
        CatalogGroup('الأدعية اليومية وأوقات الصلاة', <String>[
          'دعاء الصباح', 'دعاء المساء', 'دعاء الاستيقاظ من النوم', 'دعاء النوم',
          'دعاء دخول المنزل والخروج منه', 'دعاء السفر', 'دعاء طلب الرزق', 'دعاء الهم والغم',
          'دعاء الحفظ والحماية', 'دعاء طلب العلم', 'دعاء للوالدين', 'دعاء للمريض',
          'دعاء المطر', 'دعاء الرعد', 'دعاء رؤية الهلال', 'دعاء دخول المسجد والخروج منه',
          'تعقيبات صلاة الفجر', 'تعقيبات صلاة الظهر', 'تعقيبات صلاة العصر',
          'تعقيبات صلاة المغرب', 'تعقيبات صلاة العشاء', 'تعقيبات ما بعد الصلاة',
          'أعمال يوم الجمعة'
        ]),
        CatalogGroup('أدعية شهر رمضان', <String>[
          'دعاء استقبال شهر رمضان',
          'دعاء السحر',
          'دعاء الافتتاح',
          'دعاء أبي حمزة الثمالي',
          'دعاء البهاء',
          'أدعية ليالي القدر',
          'دعاء وداع شهر رمضان',
          'أدعية الإفطار والإمساك',
          'دعاء اليوم 1 من شهر رمضان',
          'دعاء اليوم 2 من شهر رمضان',
          'دعاء اليوم 3 من شهر رمضان',
          'دعاء اليوم 4 من شهر رمضان',
          'دعاء اليوم 5 من شهر رمضان',
          'دعاء اليوم 6 من شهر رمضان',
          'دعاء اليوم 7 من شهر رمضان',
          'دعاء اليوم 8 من شهر رمضان',
          'دعاء اليوم 9 من شهر رمضان',
          'دعاء اليوم 10 من شهر رمضان',
          'دعاء اليوم 11 من شهر رمضان',
          'دعاء اليوم 12 من شهر رمضان',
          'دعاء اليوم 13 من شهر رمضان',
          'دعاء اليوم 14 من شهر رمضان',
          'دعاء اليوم 15 من شهر رمضان',
          'دعاء اليوم 16 من شهر رمضان',
          'دعاء اليوم 17 من شهر رمضان',
          'دعاء اليوم 18 من شهر رمضان',
          'دعاء اليوم 19 من شهر رمضان',
          'دعاء اليوم 20 من شهر رمضان',
          'دعاء اليوم 21 من شهر رمضان',
          'دعاء اليوم 22 من شهر رمضان',
          'دعاء اليوم 23 من شهر رمضان',
          'دعاء اليوم 24 من شهر رمضان',
          'دعاء اليوم 25 من شهر رمضان',
          'دعاء اليوم 26 من شهر رمضان',
          'دعاء اليوم 27 من شهر رمضان',
          'دعاء اليوم 28 من شهر رمضان',
          'دعاء اليوم 29 من شهر رمضان',
          'دعاء اليوم 30 من شهر رمضان'
        ]),
        CatalogGroup('أدعية الأيام والأشهر والمناسبات', <String>['أدعية يوم الجمعة', 'أدعية يوم السبت', 'أدعية يوم الأحد', 'أدعية يوم الاثنين', 'أدعية يوم الثلاثاء', 'أدعية يوم الأربعاء', 'أدعية يوم الخميس', 'أعمال شهر رجب', 'أعمال شهر شعبان', 'أعمال شهر رمضان', 'أعمال شهر شوال', 'أعمال شهر ذي القعدة', 'أعمال شهر ذي الحجة', 'أعمال المحرم وصفر', 'أعمال النصف من شعبان', 'أعمال عيد الفطر', 'أعمال عيد الأضحى', 'أعمال الغدير']),
        CatalogGroup('أدعية التوبة والعبادة والأخلاق', <String>['دعاء التوبة', 'سيد الاستغفار', 'طلب المغفرة', 'دعاء الإخلاص', 'دعاء حسن العاقبة', 'دعاء حسن الخلق', 'دعاء كظم الغيظ', 'دعاء دفع الرياء', 'دعاء ترك المعصية', 'دعاء الثبات على الدين', 'دعاء قضاء الدين', 'دعاء رد المظالم', 'دعاء أداء الأمانة', 'دعاء الشكر', 'دعاء الصبر', 'دعاء التوكل', 'دعاء الرضا', 'دعاء دفع الوسوسة', 'دعاء عند الندم', 'دعاء قبول العمل']),
        CatalogGroup('أدعية الرزق والحوائج والشدائد', <String>['دعاء سعة الرزق', 'دعاء قضاء الحاجة', 'دعاء تفريج الكرب', 'دعاء الدين', 'دعاء دفع الفقر', 'دعاء النجاح والتوفيق', 'دعاء تيسير الأمور', 'دعاء الأمن من الخوف', 'دعاء دفع البلاء', 'دعاء الشفاء', 'دعاء الحفظ من الحسد', 'دعاء دفع الظلم', 'دعاء النصر', 'دعاء الغربة', 'دعاء عند الكرب الشديد', 'دعاء عند تعسر الأمور', 'دعاء عند الضيق', 'دعاء الاستعانة بالله', 'دعاء عند فقدان شيء', 'دعاء طلب الرحمة']),
        CatalogGroup('أدعية وزيارات أهل البيت عليهم السلام', <String>['أدعية النبي محمد صلى الله عليه وآله', 'أدعية أمير المؤمنين عليه السلام', 'أدعية السيدة فاطمة الزهراء عليها السلام', 'أدعية الإمام الحسن عليه السلام', 'أدعية الإمام الحسين عليه السلام', 'أدعية الإمام السجاد عليه السلام', 'أدعية الإمام الباقر عليه السلام', 'أدعية الإمام الصادق عليه السلام', 'أدعية الإمام الكاظم عليه السلام', 'أدعية الإمام الرضا عليه السلام', 'أدعية الإمام الجواد عليه السلام', 'أدعية الإمام الهادي عليه السلام', 'أدعية الإمام العسكري عليه السلام', 'أدعية الإمام المهدي عليه السلام', 'دعاء التوسل بأهل البيت عليهم السلام', 'الصلاة على محمد وآل محمد']),
      ]),
      const CatalogPage(title: 'الزيارات', subtitle: 'السلام على محمد وآل محمد', groups: <CatalogGroup>[
        CatalogGroup('الزيارات الجامعة', <String>['زيارة عاشوراء', 'زيارة أمين الله', 'الزيارة الجامعة الكبيرة', 'زيارة السيدة فاطمة الزهراء عليها السلام']),
        CatalogGroup('زيارات المعصومين عليهم السلام', <String>['زيارة النبي محمد صلى الله عليه وآله', 'زيارة أمير المؤمنين عليه السلام', 'زيارة الإمام الحسن عليه السلام', 'زيارة الإمام الحسين عليه السلام', 'زيارة الإمام زين العابدين عليه السلام', 'زيارة الإمام محمد الباقر عليه السلام', 'زيارة الإمام جعفر الصادق عليه السلام', 'زيارة الإمام موسى الكاظم عليه السلام', 'زيارة الإمام علي الرضا عليه السلام', 'زيارة الإمام محمد الجواد عليه السلام', 'زيارة الإمام علي الهادي عليه السلام', 'زيارة الإمام الحسن العسكري عليه السلام', 'زيارة الإمام المهدي عجل الله فرجه', 'زيارة السيدة فاطمة الزهراء عليها السلام']),
        CatalogGroup('زيارات ومقامات أخرى', <String>['زيارة أبي الفضل العباس عليه السلام', 'زيارة مسلم بن عقيل عليه السلام', 'زيارة شهداء كربلاء عليهم السلام', 'زيارة وارث', 'زيارة الناحية المقدسة', 'زيارة الأربعين', 'زيارة يوم الجمعة', 'زيارة آل ياسين']),
      ]),
      const DhikrDesignPage(),
      const TasbihDesignPage(),
      const PrayerTimesDesignPage(),
      const QiblaDesignPage(),
      const CalendarDesignPage(),
      const AmaalDesignPage(),
      const OccasionsDesignPage(),
      const AudioDesignPage(),
      const AsmaDesignPage(),
      const FavoritesDesignPage(),
      const RakatsCounterDesignPage(),
      const SajdatSahwDesignPage(),
      const SettingsDesignPage(),
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
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('مِيثَاقُ المُؤْمِنِ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                          SizedBox(height: 4),
                          Text('رفيق العبادة والإيمان',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: appMuted, fontSize: 11)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: appSurfaceLight, height: 1),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  key: const Key('drawer-navigation-list'),
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
          icon: const Icon(Icons.menu_rounded, color: appGold, size: 27),
        ),
        title: Text(selectedPage == 0 ? 'مِيثَاقُ المُؤْمِنِ' : menuItems[selectedPage].title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: 'المفضلة',
            onPressed: () => setState(() => selectedPage = 13),
            icon: const Icon(Icons.bookmark_border_rounded, color: appGold),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 900) {
            return Row(
              children: <Widget>[
                SizedBox(
                  width: 238,
                  child: _DesktopSidebar(
                    selectedPage: selectedPage,
                    items: menuItems,
                    onSelect: (int index) => setState(() => selectedPage = index),
                  ),
                ),
                const VerticalDivider(width: 1, color: appSurfaceLight),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: IndexedStack(index: selectedPage, children: pages),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: IndexedStack(index: selectedPage, children: pages),
            ),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  const _MenuItem(this.title, this.icon);
  final String title;
  final IconData icon;
}

class _DesktopSidebar extends StatelessWidget {
  const _DesktopSidebar({
    required this.selectedPage,
    required this.items,
    required this.onSelect,
  });

  final int selectedPage;
  final List<_MenuItem> items;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) => Container(
    color: appBackground,
    padding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 20),
          child: Row(
            children: <Widget>[
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: appSurfaceLight,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: appGold.withValues(alpha: .4)),
                ),
                child: const Icon(Icons.auto_awesome_rounded, color: appGold),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('مِيثَاقُ المُؤْمِنِ',
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
                    SizedBox(height: 4),
                    Text('رفيق العبادة والإيمان',
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: appMuted, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: appSurfaceLight, height: 1),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            children: <Widget>[
              for (int i = 0; i < items.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    dense: true,
                    leading: Icon(items[i].icon,
                      size: 21, color: selectedPage == i ? appGold : appMuted),
                    title: Text(items[i].title,
                      style: TextStyle(
                        fontSize: 12,
                        color: selectedPage == i ? Colors.white : appMuted,
                        fontWeight: selectedPage == i ? FontWeight.w800 : FontWeight.w500,
                      )),
                    selected: selectedPage == i,
                    selectedTileColor: appSurfaceLight,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onTap: () => onSelect(i),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: appSurfaceLight),
          ),
          child: const Text('اللهم اجعل هذا العمل خالصاً لوجهك الكريم',
            textAlign: TextAlign.center,
            style: TextStyle(color: appMuted, fontSize: 10, height: 1.7)),
        ),
      ],
    ),
  );
}

class CatalogGroup {
  const CatalogGroup(this.title, this.items);
  final String title;
  final List<String> items;
}

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key, required this.title, required this.subtitle, required this.groups});
  final String title;
  final String subtitle;
  final List<CatalogGroup> groups;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final List<CatalogGroup> visibleGroups = widget.groups
        .map((CatalogGroup group) => CatalogGroup(
              group.title,
              group.items
                  .where((String item) => item.contains(searchQuery.trim()))
                  .toList(growable: false),
            ))
        .where((CatalogGroup group) => group.items.isNotEmpty)
        .toList(growable: false);
    return ListView(
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
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        decoration: BoxDecoration(
          color: appSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: appSurfaceLight),
        ),
        child: TextField(
          textDirection: TextDirection.rtl,
          onChanged: (String value) => setState(() => searchQuery = value),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'ابحث داخل ${widget.title}',
            hintStyle: const TextStyle(color: appMuted, fontSize: 13),
            prefixIcon: const Icon(Icons.search_rounded, color: appGold, size: 21),
            suffixIcon: searchQuery.isEmpty
                ? const Icon(Icons.tune_rounded, color: appMuted, size: 19)
                : IconButton(
                    tooltip: 'مسح البحث',
                    onPressed: () => setState(() => searchQuery = ''),
                    icon: const Icon(Icons.close_rounded, color: appMuted, size: 19),
                  ),
          ),
        ),
      ),
      const SizedBox(height: 22),
      if (visibleGroups.isEmpty)
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: appSurfaceLight),
          ),
          child: const Column(
            children: <Widget>[
              Icon(Icons.search_off_rounded, color: appGold, size: 32),
              SizedBox(height: 12),
              Text('ما لقينا نتيجة مطابقة', style: TextStyle(fontWeight: FontWeight.w800)),
              SizedBox(height: 6),
              Text('جرّب كلمة ثانية من اسم الدعاء أو الزيارة.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: appMuted, fontSize: 12, height: 1.7)),
            ],
          ),
        ),
      for (final CatalogGroup group in visibleGroups) ...<Widget>[
        Row(
          children: <Widget>[
            Expanded(child: Text(group.title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: appSurfaceLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('${group.items.length}',
                style: const TextStyle(color: appGold, fontSize: 11, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(20), border: Border.all(color: appSurfaceLight)),
          child: Column(children: <Widget>[
            for (int i = 0; i < group.items.length; i++)
              Container(
                decoration: BoxDecoration(border: i == group.items.length - 1 ? null : const Border(bottom: BorderSide(color: appSurfaceLight, width: .8))),
                child: Material(
                  color: Colors.transparent,
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
              ),
          ]),
        ),
        const SizedBox(height: 22),
      ],
    ],
  );
  }
}

class QuranDesignPage extends StatelessWidget {
  const QuranDesignPage({super.key});

  static const List<String> surahNames = <String>['الفاتحة', 'البقرة', 'آل عمران', 'النساء', 'المائدة', 'الأنعام', 'الأعراف', 'الأنفال', 'التوبة', 'يونس', 'هود', 'يوسف', 'الرعد', 'إبراهيم', 'الحجر', 'النحل', 'الإسراء', 'الكهف', 'مريم', 'طه', 'الأنبياء', 'الحج', 'المؤمنون', 'النور', 'الفرقان', 'الشعراء', 'النمل', 'القصص', 'العنكبوت', 'الروم', 'لقمان', 'السجدة', 'الأحزاب', 'سبأ', 'فاطر', 'يس', 'الصافات', 'ص', 'الزمر', 'غافر', 'فصلت', 'الشورى', 'الزخرف', 'الدخان', 'الجاثية', 'الأحقاف', 'محمد', 'الفتح', 'الحجرات', 'ق', 'الذاريات', 'الطور', 'النجم', 'القمر', 'الرحمن', 'الواقعة', 'الحديد', 'المجادلة', 'الحشر', 'الممتحنة', 'الصف', 'الجمعة', 'المنافقون', 'التغابن', 'الطلاق', 'التحريم', 'الملك', 'القلم', 'الحاقة', 'المعارج', 'نوح', 'الجن', 'المزمل', 'المدثر', 'القيامة', 'الإنسان', 'المرسلات', 'النبأ', 'النازعات', 'عبس', 'التكوير', 'الانفطار', 'المطففين', 'الانشقاق', 'البروج', 'الطارق', 'الأعلى', 'الغاشية', 'الفجر', 'البلد', 'الشمس', 'الليل', 'الضحى', 'الشرح', 'التين', 'العلق', 'القدر', 'البينة', 'الزلزلة', 'العاديات', 'القارعة', 'التكاثر', 'العصر', 'الهمزة', 'الفيل', 'قريش', 'الماعون', 'الكوثر', 'الكافرون', 'النصر', 'المسد', 'الإخلاص', 'الفلق', 'الناس'];

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
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Icon(Icons.menu_book_rounded, color: appGold, size: 30),
          SizedBox(height: 14),
          Text('الفرقان المبارك', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('فهرس القرآن الكريم وسوره وأجزائه في تصميم مريح للقراءة.',
            style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
        ]),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(19), border: Border.all(color: appGold.withValues(alpha: .25))),
        child: const Row(children: <Widget>[
          Icon(Icons.bookmark_outline_rounded, color: appGold, size: 26),
          SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text('متابعة القراءة', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
            SizedBox(height: 5),
            Text('ستظهر آخر سورة وموضع القراءة بعد تفعيل المتابعة', style: TextStyle(color: appMuted, fontSize: 11, height: 1.6)),
          ])),
        ]),
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(15), border: Border.all(color: appSurfaceLight)),
        child: const Row(children: <Widget>[
          Icon(Icons.search_rounded, color: appMuted),
          SizedBox(width: 10),
          Expanded(child: Text('البحث عن سورة أو جزء', style: TextStyle(color: appMuted, fontSize: 12))),
        ]),
      ),
      const SizedBox(height: 20),
      Row(children: <Widget>[
        const Expanded(child: _SectionTitle(title: 'سور القرآن الكريم')),
        Text('114 سورة', style: TextStyle(color: appGold.withValues(alpha: .9), fontSize: 12, fontWeight: FontWeight.w800)),
      ]),
      const SizedBox(height: 12),
      LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        final int columns = constraints.maxWidth >= 760 ? 4 : constraints.maxWidth >= 500 ? 3 : 2;
        final double width = (constraints.maxWidth - 10 * (columns - 1)) / columns;
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            for (int i = 0; i < surahNames.length; i++)
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(15), border: Border.all(color: appSurfaceLight)),
                child: Row(children: <Widget>[
                  Container(
                    width: 30, height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: appBackground, borderRadius: BorderRadius.circular(10)),
                    child: Text('${i + 1}', style: const TextStyle(color: appGold, fontSize: 10, fontWeight: FontWeight.w800)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(surahNames[i], maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800))),
                ]),
              ),
          ],
        );
      }),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'أجزاء القرآن الكريم'),
      const SizedBox(height: 12),
      Wrap(
        spacing: 9,
        runSpacing: 9,
        children: <Widget>[
          for (int part = 1; part <= 30; part++)
            Container(
              width: 86,
              padding: const EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(13), border: Border.all(color: appSurfaceLight)),
              child: Column(children: <Widget>[
                const Icon(Icons.auto_stories_rounded, color: appGold, size: 20),
                const SizedBox(height: 7),
                Text('الجزء $part', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800)),
              ]),
            ),
        ],
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(17)),
        child: const Row(children: <Widget>[
          Icon(Icons.info_outline_rounded, color: appGold),
          SizedBox(width: 10),
          Expanded(child: Text('هذه واجهة الفهرس فقط. نص المصحف والتلاوة والعلامات المرجعية تُضاف بعد اكتمال التصميم.',
            style: TextStyle(color: appMuted, fontSize: 11, height: 1.7))),
        ]),
      ),
    ],
  );
}

class AsmaDesignPage extends StatelessWidget {
  const AsmaDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> previewNames = <String>[
      'الله', 'الرحمن', 'الرحيم', 'الملك', 'القدوس', 'السلام',
      'المؤمن', 'المهيمن', 'العزيز', 'الجبار', 'المتكبر', 'الخالق',
    ];
    return ListView(
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
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Icon(Icons.auto_awesome_rounded, color: appGold, size: 30),
            SizedBox(height: 14),
            Text('أسماء الله الحسنى', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
            SizedBox(height: 8),
            Text('تأمّل في الأسماء الحسنى وتعرّف إلى معانيها في واجهة هادئة.',
              style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
          ]),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(15), border: Border.all(color: appSurfaceLight)),
          child: const Row(children: <Widget>[
            Icon(Icons.search_rounded, color: appMuted, size: 21),
            SizedBox(width: 10),
            Expanded(child: Text('البحث عن اسم من الأسماء الحسنى', style: TextStyle(color: appMuted, fontSize: 12))),
          ]),
        ),
        const SizedBox(height: 20),
        Row(children: <Widget>[
          const Expanded(child: _SectionTitle(title: 'فهرس الأسماء')),
          Text('99 اسماً', style: TextStyle(color: appGold.withValues(alpha: .9), fontSize: 12, fontWeight: FontWeight.w800)),
        ]),
        const SizedBox(height: 12),
        LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          final int columns = constraints.maxWidth >= 650 ? 4 : 3;
          final double width = (constraints.maxWidth - 10 * (columns - 1)) / columns;
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              for (int i = 0; i < 99; i++)
                Container(
                  width: width,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  decoration: BoxDecoration(
                    color: appSurface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: appGold.withValues(alpha: .18)),
                  ),
                  child: Column(children: <Widget>[
                    Text('${i + 1}', style: const TextStyle(color: appMuted, fontSize: 10)),
                    const SizedBox(height: 8),
                    Text(i < previewNames.length ? previewNames[i] : 'الاسم لاحقاً',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: appGold, fontSize: 13, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 7),
                    const Text('المعنى لاحقاً', textAlign: TextAlign.center,
                      style: TextStyle(color: appMuted, fontSize: 9)),
                  ]),
                ),
            ],
          );
        }),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(17)),
          child: const Row(children: <Widget>[
            Icon(Icons.info_outline_rounded, color: appGold),
            SizedBox(width: 10),
            Expanded(child: Text('هذه معاينة لتصميم الفهرس. تُستكمل الأسماء التسعة والتسعون ومعانيها الموثقة في مرحلة المحتوى.',
              style: TextStyle(color: appMuted, fontSize: 11, height: 1.7))),
          ]),
        ),
      ],
    );
  }
}

class _GuideStep extends StatelessWidget {
  const _GuideStep({required this.number, required this.title, required this.subtitle});
  final String number;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 9),
    child: Row(
      children: <Widget>[
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: appSurfaceLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: appGold.withValues(alpha: .25)),
          ),
          child: Text(number, style: const TextStyle(color: appGold, fontWeight: FontWeight.w900)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: appMuted, fontSize: 11, height: 1.6)),
            ],
          ),
        ),
        const Icon(Icons.chevron_left_rounded, color: appMuted, size: 19),
      ],
    ),
  );
}

class OccasionsDesignPage extends StatelessWidget {
  const OccasionsDesignPage({super.key});

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
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Icon(Icons.event_available_rounded, color: appGold, size: 30),
          SizedBox(height: 14),
          Text('المناسبات والمواسم', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('دليل المواسم الإيمانية والأعمال المرتبطة بالأيام المباركة.',
            style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
        ]),
      ),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'المواسم الإيمانية'),
      const SizedBox(height: 12),
      Container(
        height: 150,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(colors: <Color>[Color(0xFF244E3B), Color(0xFF13271E)]),
          border: Border.all(color: appGold.withValues(alpha: .3)),
        ),
        child: const Row(children: <Widget>[
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text('الموسم المبارك', style: TextStyle(color: appGold, fontSize: 12)),
            SizedBox(height: 8),
            Text('تهيّأ لأيام الطاعة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            SizedBox(height: 6),
            Text('أعمال وأدعية وأدلة مرتبة', style: TextStyle(color: Color(0xFFD2DFD6), fontSize: 11)),
          ])),
          Icon(Icons.nights_stay_rounded, color: appGold, size: 58),
        ]),
      ),
      const SizedBox(height: 22),
      for (final _SettingsOption option in const <_SettingsOption>[
        _SettingsOption(Icons.nightlight_round, 'شهر رمضان المبارك', 'أعمال الشهر وأدعية الأيام والليالي'),
        _SettingsOption(Icons.restaurant_outlined, 'الإمساك والإفطار', 'جدول الشهر ومواعيد الإمساك والإفطار'),
        _SettingsOption(Icons.mosque_outlined, 'الحج والعمرة', 'دليل المناسك والإرشادات'),
        _SettingsOption(Icons.directions_walk_rounded, 'دليل زيارة الأربعين', 'إرشادات الزائر والخدمات المهمة'),
        _SettingsOption(Icons.calendar_month_rounded, 'أعمال الأيام المباركة', 'الأعمال المستحبة حسب المناسبة'),
      ])
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(18), border: Border.all(color: appSurfaceLight)),
          child: Row(children: <Widget>[
            Container(
              width: 46, height: 46,
              decoration: BoxDecoration(color: appBackground, borderRadius: BorderRadius.circular(14)),
              child: Icon(option.icon, color: appGold, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text(option.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
              const SizedBox(height: 5),
              Text(option.subtitle, style: const TextStyle(color: appMuted, fontSize: 11, height: 1.5)),
            ])),
            const Icon(Icons.chevron_left_rounded, color: appMuted),
          ]),
        ),
      const SizedBox(height: 14),
      const _SectionTitle(title: 'معاينة جدول رمضان'),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: appSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: appSurfaceLight),
        ),
        child: Column(
          children: <Widget>[
            const Row(
              children: <Widget>[
                Expanded(child: Text('اليوم', style: TextStyle(color: appMuted, fontSize: 11))),
                Expanded(child: Text('الإمساك', textAlign: TextAlign.center,
                  style: TextStyle(color: appMuted, fontSize: 11))),
                Expanded(child: Text('الإفطار', textAlign: TextAlign.end,
                  style: TextStyle(color: appMuted, fontSize: 11))),
              ],
            ),
            const SizedBox(height: 10),
            for (final List<String> row in const <List<String>>[
              <String>['01', '— : —', '— : —'],
              <String>['02', '— : —', '— : —'],
              <String>['03', '— : —', '— : —'],
            ])
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: appSurfaceLight)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('اليوم ${row[0]}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
                    Expanded(child: Text(row[1], textAlign: TextAlign.center,
                      style: const TextStyle(color: appGold, fontSize: 12))),
                    Expanded(child: Text(row[2], textAlign: TextAlign.end,
                      style: const TextStyle(color: appGold, fontSize: 12))),
                  ],
                ),
              ),
            const SizedBox(height: 5),
            const Text('أوقات تجريبية للتصميم — لا تمثل مواقيت فعلية',
              style: TextStyle(color: appMuted, fontSize: 10)),
          ],
        ),
      ),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'دليل الحج والعمرة'),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: appSurfaceLight),
        ),
        child: const Column(
          children: <Widget>[
            _GuideStep(number: '١', title: 'الإحرام', subtitle: 'الاستعداد والنية ومحظورات الإحرام'),
            _GuideStep(number: '٢', title: 'الطواف', subtitle: 'خطوات الطواف وأحكامه'),
            _GuideStep(number: '٣', title: 'السعي', subtitle: 'السعي بين الصفا والمروة'),
            _GuideStep(number: '٤', title: 'إكمال المناسك', subtitle: 'التقصير وبقية الأعمال حسب النسك'),
          ],
        ),
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[Color(0xFF1C4734), appSurface],
          ),
          border: Border.all(color: appGold.withValues(alpha: .22)),
        ),
        child: const Row(
          children: <Widget>[
            Icon(Icons.directions_walk_rounded, color: appGold, size: 30),
            SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('دليل زائر الأربعين', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                  SizedBox(height: 5),
                  Text('مسارات • إرشادات • نقاط خدمة • خريطة الزيارة',
                    style: TextStyle(color: appMuted, fontSize: 11, height: 1.7)),
                ],
              ),
            ),
            Icon(Icons.chevron_left_rounded, color: appMuted),
          ],
        ),
      ),
      const SizedBox(height: 14),
      const Text('الأدلة والخرائط والتوقيتات تُضاف في مرحلة الخدمات',
        textAlign: TextAlign.center, style: TextStyle(color: appMuted, fontSize: 11, height: 1.7)),
    ],
  );
}

class SettingsDesignPage extends StatelessWidget {
  const SettingsDesignPage({super.key});

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
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Icon(Icons.tune_rounded, color: appGold, size: 30),
          SizedBox(height: 14),
          Text('الإعدادات', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('رتّب تجربة ميثاق المؤمن بالطريقة التي تناسبك.',
            style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
        ]),
      ),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'المظهر والتخصيص'),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(20), border: Border.all(color: appSurfaceLight)),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Container(
              width: 46, height: 46,
              decoration: BoxDecoration(color: appBackground, borderRadius: BorderRadius.circular(14), border: Border.all(color: appGold.withValues(alpha: .35))),
              child: const Icon(Icons.palette_outlined, color: appGold),
            ),
            const SizedBox(width: 12),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text('الثيم الزمردي', style: TextStyle(fontWeight: FontWeight.w800)),
              SizedBox(height: 4),
              Text('الخلفية الداكنة مع اللمسات الذهبية', style: TextStyle(color: appMuted, fontSize: 11)),
            ])),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: const Color(0xFF204B38), borderRadius: BorderRadius.circular(20)),
              child: const Text('الحالي', style: TextStyle(color: Color(0xFFE6C783), fontSize: 10, fontWeight: FontWeight.w800)),
            ),
          ]),
          const SizedBox(height: 18),
          Row(children: <Widget>[
            for (final Color color in const <Color>[Color(0xFF174B36), Color(0xFF234A69), Color(0xFF553A69), Color(0xFF6B4534)])
              Expanded(child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 38,
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12), border: Border.all(color: appGold.withValues(alpha: .25))),
                child: const Icon(Icons.lock_outline_rounded, color: Colors.white70, size: 15),
              )),
          ]),
          const SizedBox(height: 9),
          const Text('خيارات الألوان الأخرى تُضاف لاحقاً', style: TextStyle(color: appMuted, fontSize: 11)),
        ]),
      ),
      const SizedBox(height: 20),
      const _SectionTitle(title: 'إعدادات التطبيق'),
      const SizedBox(height: 10),
      for (final _SettingsOption option in const <_SettingsOption>[
        _SettingsOption(Icons.language_rounded, 'اللغة واتجاه العرض', 'العربية • من اليمين إلى اليسار'),
        _SettingsOption(Icons.text_fields_rounded, 'حجم الخط', 'ضبط القراءة حسب راحتك'),
        _SettingsOption(Icons.notifications_none_rounded, 'تنبيهات الصلاة', 'تنظيم التذكير بمواقيت الصلاة'),
        _SettingsOption(Icons.volume_up_outlined, 'الأذان والأصوات', 'إعدادات الصوت والتنبيهات'),
        _SettingsOption(Icons.wallpaper_rounded, 'الخلفيات الإسلامية', 'خلفيات عالية الدقة وتنسيقات هادئة'),
        _SettingsOption(Icons.location_on_outlined, 'الموقع وطريقة الحساب', 'المدينة وإعدادات المواقيت'),
      ])
        Container(
          margin: const EdgeInsets.only(bottom: 9),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(17), border: Border.all(color: appSurfaceLight)),
          child: Row(children: <Widget>[
            Container(
              width: 42, height: 42,
              decoration: BoxDecoration(color: appBackground, borderRadius: BorderRadius.circular(13)),
              child: Icon(option.icon, color: appGold, size: 21),
            ),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text(option.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(option.subtitle, style: const TextStyle(color: appMuted, fontSize: 11, height: 1.5)),
            ])),
            const Icon(Icons.chevron_left_rounded, color: appMuted),
          ]),
        ),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(18), border: Border.all(color: appSurfaceLight)),
        child: const Row(children: <Widget>[
          Icon(Icons.info_outline_rounded, color: appGold, size: 24),
          SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text('عن ميثاق المؤمن', style: TextStyle(fontWeight: FontWeight.w800)),
            SizedBox(height: 5),
            Text('رفيق العبادة والإيمان', style: TextStyle(color: appMuted, fontSize: 12)),
            SizedBox(height: 4),
            Text('الإصدار الأولي • واجهات قيد التطوير', style: TextStyle(color: appMuted, fontSize: 10)),
          ])),
        ]),
      ),
    ],
  );
}

class _SettingsOption {
  const _SettingsOption(this.icon, this.title, this.subtitle);
  final IconData icon;
  final String title;
  final String subtitle;
}

class FavoritesDesignPage extends StatelessWidget {
  const FavoritesDesignPage({super.key});

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
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Icon(Icons.bookmark_rounded, color: appGold, size: 30),
          SizedBox(height: 14),
          Text('المفضلة', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('اجمع السور والأدعية والزيارات التي تريد الرجوع إليها بسهولة.',
            style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
        ]),
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(22), border: Border.all(color: appSurfaceLight)),
        child: const Column(children: <Widget>[
          Icon(Icons.bookmark_border_rounded, color: appGold, size: 54),
          SizedBox(height: 16),
          Text('قائمتك تبدأ من هنا', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('ستظهر العناصر المحفوظة هنا بعد تفعيل ميزة المفضلة.',
            textAlign: TextAlign.center, style: TextStyle(color: appMuted, fontSize: 13, height: 1.8)),
        ]),
      ),
      const SizedBox(height: 18),
      TextField(
        decoration: InputDecoration(
          hintText: 'ابحث في المفضلة',
          prefixIcon: const Icon(Icons.search_rounded, color: appGold),
          filled: true,
          fillColor: appSurface,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        ),
      ),
      const SizedBox(height: 12),
      Wrap(spacing: 8, runSpacing: 8, children: <Widget>[
        for (final String filter in <String>['الكل', 'القرآن', 'الأدعية', 'الزيارات', 'الصوتيات'])
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: filter == 'الكل' ? appSurfaceLight : appSurface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: filter == 'الكل' ? appGold.withValues(alpha: .45) : appSurfaceLight),
            ),
            child: Text(filter, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: filter == 'الكل' ? appGold : appMuted)),
          ),
      ]),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'أنواع المحفوظات'),
      const SizedBox(height: 10),
      for (final _AudioCategory item in const <_AudioCategory>[
        _AudioCategory(Icons.menu_book_rounded, 'السور القرآنية', 'السور التي تحفظها'),
        _AudioCategory(Icons.volunteer_activism_rounded, 'الأدعية والمناجيات', 'الأدعية التي تفضلها'),
        _AudioCategory(Icons.account_balance_rounded, 'الزيارات', 'الزيارات المحفوظة'),
        _AudioCategory(Icons.headphones_rounded, 'الصوتيات', 'مقاطع الاستماع المفضلة'),
      ])
        Container(
          margin: const EdgeInsets.only(bottom: 9),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(17), border: Border.all(color: appSurfaceLight)),
          child: Row(children: <Widget>[
            Icon(item.icon, color: appGold, size: 22),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text(item.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(item.subtitle, style: const TextStyle(color: appMuted, fontSize: 11)),
            ])),
            const Icon(Icons.chevron_left_rounded, color: appMuted),
          ]),
        ),
    ],
  );
}

class DhikrDesignPage extends StatelessWidget {
  const DhikrDesignPage({super.key});

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
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Icon(Icons.wb_sunny_outlined, color: appGold, size: 30),
          SizedBox(height: 14),
          Text('الأذكار اليومية', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('أوراد يومية مرتبة تساعدك على المحافظة على الذكر والتعقيب.',
            style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
        ]),
      ),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'الأذكار اليومية'),
      const SizedBox(height: 10),
      for (final _AudioCategory item in const <_AudioCategory>[
        _AudioCategory(Icons.wb_sunny_outlined, 'أذكار الصباح', 'ورد بداية اليوم'),
        _AudioCategory(Icons.nights_stay_outlined, 'أذكار المساء', 'ورد المساء والحفظ'),
        _AudioCategory(Icons.bedtime_outlined, 'أذكار النوم والاستيقاظ', 'أذكار قبل النوم وبعده'),
        _AudioCategory(Icons.shield_outlined, 'أذكار الحفظ والحماية', 'أوراد يومية للحفظ'),
      ])
        Container(
          margin: const EdgeInsets.only(bottom: 9),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(17), border: Border.all(color: appSurfaceLight)),
          child: Row(children: <Widget>[
            Icon(item.icon, color: appGold, size: 23),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text(item.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(item.subtitle, style: const TextStyle(color: appMuted, fontSize: 11)),
            ])),
            const Icon(Icons.chevron_left_rounded, color: appMuted),
          ]),
        ),

    ],
  );
}

class AudioDesignPage extends StatelessWidget {
  const AudioDesignPage({super.key});

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
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Icon(Icons.headphones_rounded, color: appGold, size: 30),
          SizedBox(height: 14),
          Text('الصوتيات', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('مكتبة التلاوات والأذان والأدعية والزيارات الصوتية.',
            style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
        ]),
      ),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'تصفّح المكتبة'),
      const SizedBox(height: 12),
      for (final _AudioCategory category in const <_AudioCategory>[
        _AudioCategory(Icons.menu_book_rounded, 'تلاوات القرآن الكريم', 'تلاوات مرتلة وخيارات استماع'),
        _AudioCategory(Icons.volume_up_rounded, 'الأذان', 'أصوات الأذان والتنبيهات'),
        _AudioCategory(Icons.volunteer_activism_rounded, 'الأدعية والزيارات', 'استماع للأدعية والزيارات'),
        _AudioCategory(Icons.music_note_rounded, 'الأناشيد والابتهالات', 'مكتبة روحانية متنوعة'),
      ])
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(18), border: Border.all(color: appSurfaceLight)),
          child: Row(children: <Widget>[
            Container(
              width: 48, height: 48,
              decoration: BoxDecoration(color: appSurfaceLight, borderRadius: BorderRadius.circular(15)),
              child: Icon(category.icon, color: appGold, size: 23),
            ),
            const SizedBox(width: 13),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text(category.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
              const SizedBox(height: 5),
              Text(category.subtitle, style: const TextStyle(color: appMuted, fontSize: 11, height: 1.5)),
            ])),
            const Icon(Icons.chevron_left_rounded, color: appMuted),
          ]),
        ),
      const SizedBox(height: 12),
      const _SectionTitle(title: 'قوائم الاستماع'),
      const SizedBox(height: 10),
      for (final _AudioCategory track in const <_AudioCategory>[
        _AudioCategory(Icons.play_circle_outline_rounded, 'آخر ما استمعت إليه', 'ستظهر المقاطع الأخيرة هنا'),
        _AudioCategory(Icons.download_outlined, 'المقاطع المحفوظة', 'مساحة للمقاطع المتاحة دون اتصال'),
      ])
        Container(
          margin: const EdgeInsets.only(bottom: 9),
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(16), border: Border.all(color: appSurfaceLight)),
          child: Row(children: <Widget>[
            Icon(track.icon, color: appGold, size: 22),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text(track.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(track.subtitle, style: const TextStyle(color: appMuted, fontSize: 11)),
            ])),
            const Icon(Icons.chevron_left_rounded, color: appMuted),
          ]),
        ),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: appSurface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: appGold.withValues(alpha: .25)),
        ),
        child: Column(children: <Widget>[
          Container(
            width: 76, height: 76,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: <Color>[Color(0xFF2B7657), appSurfaceLight]),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(Icons.graphic_eq_rounded, color: appGold, size: 38),
          ),
          const SizedBox(height: 13),
          const Text('لم يتم اختيار مقطع', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
          const SizedBox(height: 5),
          const Text('سيظهر اسم المقطع هنا', style: TextStyle(color: appMuted, fontSize: 12)),
          const SizedBox(height: 18),
          const LinearProgressIndicator(value: 0, color: appGold, backgroundColor: appSurfaceLight),
          const SizedBox(height: 12),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
            Text('00:00', style: TextStyle(color: appMuted, fontSize: 11)),
            Text('--:--', style: TextStyle(color: appMuted, fontSize: 11)),
          ]),
          const SizedBox(height: 8),
          const Icon(Icons.play_circle_fill_rounded, color: appMuted, size: 54),
          const SizedBox(height: 4),
          const Text('مشغل الصوتيات - تصميم أولي', style: TextStyle(color: appMuted, fontSize: 11)),
        ]),
      ),
    ],
  );
}


class _UtilityPreviewCard extends StatelessWidget {
  const _UtilityPreviewCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.footer,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String footer;

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 148),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: appSurface,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: appSurfaceLight),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: appSurfaceLight,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(icon, color: appGold, size: 21),
        ),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: appMuted, fontSize: 11, height: 1.5)),
        const SizedBox(height: 10),
        Text(footer, style: const TextStyle(color: appGold, fontSize: 11, fontWeight: FontWeight.w700)),
      ],
    ),
  );
}

class _AudioCategory {
  const _AudioCategory(this.icon, this.title, this.subtitle);
  final IconData icon;
  final String title;
  final String subtitle;
}

class CalendarDesignPage extends StatelessWidget {
  const CalendarDesignPage({super.key});

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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.calendar_month_rounded, color: appGold, size: 30),
                SizedBox(height: 14),
                Text('التقويم الهجري',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text('تقويم مستقل لمتابعة اليوم والشهر الهجري والتنقل بين أيامه.',
                    style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: appSurfaceLight),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('التاريخ الهجري', style: TextStyle(color: appGold, fontSize: 13)),
                SizedBox(height: 8),
                Text('يُعرض بعد ربط مصدر تقويم موثوق',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
                SizedBox(height: 5),
                Text('لن يُعرض تاريخ تقديري على أنه تاريخ فعلي.',
                    style: TextStyle(color: appMuted, fontSize: 12, height: 1.7)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: appSurfaceLight),
            ),
            child: Column(
              children: <Widget>[
                const Row(
                  children: <Widget>[
                    Icon(Icons.date_range_rounded, color: appGold),
                    SizedBox(width: 10),
                    Expanded(child: Text('عرض الشهر',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900))),
                    Text('هجري', style: TextStyle(color: appMuted, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: <Widget>[
                    for (final String dayName in <String>['س', 'ح', 'ن', 'ث', 'ر', 'خ', 'ج'])
                      Expanded(
                        child: Center(
                          child: Text(dayName,
                              style: const TextStyle(color: appGold, fontWeight: FontWeight.w800)),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 7,
                  runSpacing: 8,
                  children: <Widget>[
                    for (int day = 1; day <= 30; day++)
                      Container(
                        width: 34,
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: appBackground,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: appSurfaceLight),
                        ),
                        child: Text('$day',
                            style: const TextStyle(fontSize: 11, color: appMuted)),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'أيام الشهر ومطابقة بدايته تُربط بمصدر معتمد في مرحلة الخدمات.',
            textAlign: TextAlign.center,
            style: TextStyle(color: appMuted, fontSize: 11, height: 1.8),
          ),
        ],
      );
}

class AmaalDesignPage extends StatelessWidget {
  const AmaalDesignPage({super.key});

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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.auto_awesome_rounded, color: appGold, size: 30),
                SizedBox(height: 14),
                Text('الأعمال والعبادات',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text('صفحة مستقلة للأعمال اليومية والأسبوعية والشهرية والليالي المباركة.',
                    style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const _SectionTitle(title: 'أعمال يومية وتعقيبات'),
          const SizedBox(height: 10),
          for (final _SettingsOption option in const <_SettingsOption>[
            _SettingsOption(Icons.wb_sunny_outlined, 'أعمال كل يوم',
                'مساحة مرتبة للأعمال اليومية'),
            _SettingsOption(Icons.mosque_outlined, 'تعقيبات الصلوات',
                'الفجر والظهر والعصر والمغرب والعشاء'),
            _SettingsOption(Icons.nightlight_round, 'أعمال صلاة الليل',
                'ترتيب الأعمال المرتبطة بصلاة الليل'),
          ])
            _AmaalPreviewTile(option: option),
          const SizedBox(height: 16),
          const _SectionTitle(title: 'أعمال الأسبوع'),
          const SizedBox(height: 10),
          for (final _SettingsOption option in const <_SettingsOption>[
            _SettingsOption(Icons.calendar_view_week_rounded, 'أعمال يوم الجمعة',
                'أعمال وأدعية يوم الجمعة'),
            _SettingsOption(Icons.volunteer_activism_rounded, 'دعاء الندبة',
                'اختصار للوصول إلى الدعاء ضمن مكتبة الأدعية'),
          ])
            _AmaalPreviewTile(option: option),
          const SizedBox(height: 16),
          const _SectionTitle(title: 'أعمال الأشهر والليالي'),
          const SizedBox(height: 10),
          for (final _SettingsOption option in const <_SettingsOption>[
            _SettingsOption(Icons.nights_stay_outlined, 'أعمال الليالي المباركة',
                'ليالي القدر والنصف من شعبان وغيرها'),
            _SettingsOption(Icons.calendar_month_rounded, 'أعمال شهر رجب',
                'الأعمال والأدعية الخاصة بالشهر'),
            _SettingsOption(Icons.calendar_month_rounded, 'أعمال شهر شعبان',
                'الأعمال والأدعية الخاصة بالشهر'),
            _SettingsOption(Icons.nightlight_round, 'أعمال شهر رمضان',
                'أدعية الأيام والليالي والأعمال'),
            _SettingsOption(Icons.event_available_rounded, 'أعمال ذي الحجة ومحرم وصفر',
                'ترتيب مستقل لأعمال الأشهر'),
          ])
            _AmaalPreviewTile(option: option),
          const SizedBox(height: 16),
          const _SectionTitle(title: 'المتابعة الشخصية'),
          const SizedBox(height: 10),
          const _AmaalPreviewTile(
            option: _SettingsOption(Icons.menu_book_rounded, 'متابعة ختمة القرآن',
                'عرض تقدّم القراءة وعدد الأجزاء بعد تفعيل الميزة'),
          ),
          const SizedBox(height: 14),
          const Text(
            'هذه معاينة للواجهة؛ تفاصيل الأعمال ومصادرها تُراجع قبل تفعيلها.',
            textAlign: TextAlign.center,
            style: TextStyle(color: appMuted, fontSize: 11, height: 1.8),
          ),
        ],
      );
}

class _AmaalPreviewTile extends StatelessWidget {
  const _AmaalPreviewTile({required this.option});

  final _SettingsOption option;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 9),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: appSurface,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: appSurfaceLight),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: appBackground,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(option.icon, color: appGold, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(option.title,
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
                  const SizedBox(height: 5),
                  Text(option.subtitle,
                      style: const TextStyle(color: appMuted, fontSize: 11, height: 1.5)),
                ],
              ),
            ),
            const Icon(Icons.chevron_left_rounded, color: appMuted),
          ],
        ),
      );
}

class TasbihDesignPage extends StatelessWidget {
  const TasbihDesignPage({super.key});

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
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Icon(Icons.fingerprint_rounded, color: appGold, size: 30),
          SizedBox(height: 14),
          Text('التسبيح الإلكتروني', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 8),
          Text('عداد مستقل للتسبيح والأوراد العددية، بتصميم هادئ وواضح.',
            style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
        ]),
      ),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'تسبيح الزهراء عليها السلام'),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: appSurface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: appSurfaceLight),
        ),
        child: Column(children: <Widget>[
          const Text('معاينة العداد', style: TextStyle(color: appMuted, fontSize: 12)),
          const SizedBox(height: 18),
          Container(
            width: 156,
            height: 156,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appBackground,
              border: Border.all(color: appGold, width: 4),
              boxShadow: <BoxShadow>[
                BoxShadow(color: appGold.withValues(alpha: .08), blurRadius: 22, spreadRadius: 3),
              ],
            ),
            child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('0', style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900)),
              SizedBox(height: 3),
              Text('من 34', style: TextStyle(color: appMuted, fontSize: 12)),
            ]),
          ),
          const SizedBox(height: 18),
          const Text('الله أكبر', style: TextStyle(color: appGold, fontSize: 15, fontWeight: FontWeight.w900)),
          const SizedBox(height: 5),
          const Text('المرحلة الأولى من تسبيح الزهراء عليها السلام',
            textAlign: TextAlign.center, style: TextStyle(color: appMuted, fontSize: 12, height: 1.7)),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton.icon(
              onPressed: null,
              icon: const Icon(Icons.add_rounded),
              label: const Text('اضغط للتسبيح — يُفعّل لاحقاً'),
            ),
          ),
          const SizedBox(height: 10),
          const Text('34 الله أكبر • 33 الحمد لله • 33 سبحان الله',
            textAlign: TextAlign.center, style: TextStyle(color: appMuted, fontSize: 11)),
        ]),
      ),
      const SizedBox(height: 22),
      const _SectionTitle(title: 'عدادات أخرى'),
      const SizedBox(height: 10),
      const _UtilityPreviewCard(
        icon: Icons.repeat_rounded,
        title: 'عداد تسبيح عام',
        subtitle: 'للذكر والاستغفار والصلوات على محمد وآل محمد',
        footer: '٠ تسبيحة',
      ),
      const SizedBox(height: 10),
      const _UtilityPreviewCard(
        icon: Icons.tune_rounded,
        title: 'هدف التكرار',
        subtitle: 'تحديد عدد التسبيحات لهذا الورد فقط',
        footer: 'هدف الورد: 100 تكرار',
      ),
      const SizedBox(height: 14),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: appSurface, borderRadius: BorderRadius.circular(17), border: Border.all(color: appSurfaceLight)),
        child: const Row(children: <Widget>[
          Icon(Icons.info_outline_rounded, color: appGold),
          SizedBox(width: 10),
          Expanded(child: Text('هذه معاينة تصميم فقط؛ العدّاد والحفظ وإعادة التصفير ستُبرمج بعد اكتمال الواجهات.',
            style: TextStyle(color: appMuted, fontSize: 12, height: 1.7))),
        ]),
      ),
    ],
  );
}

class PrayerTimesDesignPage extends StatelessWidget {
  const PrayerTimesDesignPage({super.key});

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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.access_time_rounded, color: appGold, size: 30),
                SizedBox(height: 14),
                Text('مواقيت الصلاة',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text('صفحة مخصصة للصلوات الخمس ووقت الصلاة القادمة وإعدادات الحساب.',
                    style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: appGold.withValues(alpha: .28)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('الصلاة القادمة', style: TextStyle(color: appGold, fontSize: 13)),
                SizedBox(height: 8),
                Text('تُحدَّد بعد ضبط الموقع',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                SizedBox(height: 5),
                Text('— : —  المتبقي للصلاة',
                    style: TextStyle(color: appMuted, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const _SectionTitle(title: 'مواقيت اليوم'),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: appSurfaceLight),
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
          const _SectionTitle(title: 'ضبط المواقيت'),
          const SizedBox(height: 10),
          const Row(
            children: <Widget>[
              Expanded(
                child: _UtilityPreviewCard(
                  icon: Icons.location_on_outlined,
                  title: 'الموقع',
                  subtitle: 'المدينة أو GPS',
                  footer: 'غير محدد',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _UtilityPreviewCard(
                  icon: Icons.tune_rounded,
                  title: 'طريقة الحساب',
                  subtitle: 'ضبط المواقيت',
                  footer: 'تُختار لاحقاً',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: appSurfaceLight),
            ),
            child: const Row(
              children: <Widget>[
                Icon(Icons.info_outline_rounded, color: appGold),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'المواقيت المعروضة حالياً هي هيكل تصميم، وليست أوقاتاً فعلية.',
                    style: TextStyle(color: appMuted, fontSize: 12, height: 1.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

class QiblaDesignPage extends StatelessWidget {
  const QiblaDesignPage({super.key});

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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.explore_rounded, color: appGold, size: 30),
                SizedBox(height: 14),
                Text('اتجاه القبلة',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text('بوصلة مستقلة لتحديد اتجاه القبلة بعد تفعيل الموقع ومستشعر الاتجاه.',
                    style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: appSurfaceLight),
            ),
            child: Column(
              children: <Widget>[
                const Text(
                  'تُحدَّد جهة القبلة بعد تفعيل الموقع والبوصلة',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: appMuted, fontSize: 12, height: 1.7),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appBackground,
                    border: Border.all(color: appGold.withValues(alpha: .65), width: 2),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 178,
                        height: 178,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: appSurfaceLight, width: 2),
                        ),
                      ),
                      Container(
                        width: 136,
                        height: 136,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: appSurfaceLight),
                        ),
                      ),
                      const Positioned(
                        top: 12,
                        child: Text('N',
                            style: TextStyle(color: appMuted, fontWeight: FontWeight.w800)),
                      ),
                      const Positioned(
                        bottom: 12,
                        child: Text('QIBLA',
                            style: TextStyle(color: appMuted, fontSize: 10, letterSpacing: 2)),
                      ),
                      const Icon(Icons.navigation_rounded, color: appGold, size: 62),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const Text('لم يتم تحديد الاتجاه بعد',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                const Text('ستظهر درجة الاتجاه بعد ربط المستشعر',
                    style: TextStyle(color: appMuted, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const _SectionTitle(title: 'متطلبات تحديد القبلة'),
          const SizedBox(height: 10),
          for (final _SettingsOption option in const <_SettingsOption>[
            _SettingsOption(Icons.location_on_outlined, 'تحديد الموقع',
                'اختيار المدينة أو السماح باستخدام GPS'),
            _SettingsOption(Icons.explore_outlined, 'معايرة البوصلة',
                'التحقق من عمل مستشعر الاتجاه بالجهاز'),
          ])
            _AmaalPreviewTile(option: option),
          const SizedBox(height: 8),
          const Text(
            'لا يُعرض اتجاه تخميني على أنه اتجاه قبلة مؤكد.',
            textAlign: TextAlign.center,
            style: TextStyle(color: appMuted, fontSize: 11, height: 1.8),
          ),
        ],
      );
}

class PlaceholderDetailPage extends StatefulWidget {
  const PlaceholderDetailPage({super.key, required this.title, required this.section});
  final String title;
  final String section;

  @override
  State<PlaceholderDetailPage> createState() => _PlaceholderDetailPageState();
}

class _PlaceholderDetailPageState extends State<PlaceholderDetailPage> {
  int selectedTab = 0;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
      actions: <Widget>[
        IconButton(
          tooltip: isSaved ? 'إزالة من المفضلة' : 'حفظ في المفضلة',
          onPressed: () => setState(() => isSaved = !isSaved),
          icon: Icon(
            isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
            color: appGold,
          ),
        ),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[Color(0xFF205640), appSurface, Color(0xFF0C1E17)],
            ),
            border: Border.all(color: appGold.withValues(alpha: .3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .06),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: appGold.withValues(alpha: .35)),
                ),
                child: const Icon(Icons.auto_awesome_rounded, color: appGold, size: 25),
              ),
              const SizedBox(height: 20),
              Text(widget.section, style: const TextStyle(color: appGold, fontSize: 12, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text(widget.title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900, height: 1.5)),
              const SizedBox(height: 12),
              const Text('صفحة المحتوى', style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
              const SizedBox(height: 18),
              const Row(
                children: <Widget>[
                  Icon(Icons.text_fields_rounded, color: appGold, size: 17),
                  SizedBox(width: 7),
                  Text('عرض مريح للقراءة', style: TextStyle(color: appMuted, fontSize: 12)),
                  Spacer(),
                  Icon(Icons.headphones_rounded, color: appGold, size: 17),
                  SizedBox(width: 6),
                  Text('الصوت لاحقاً', style: TextStyle(color: appMuted, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: appSurfaceLight),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => selectedTab = 0),
                  child: _DetailTab(label: 'النص', icon: Icons.menu_book_rounded, selected: selectedTab == 0),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => selectedTab = 1),
                  child: _DetailTab(label: 'المعاني', icon: Icons.notes_rounded, selected: selectedTab == 1),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => selectedTab = 2),
                  child: _DetailTab(label: 'المصادر', icon: Icons.library_books_rounded, selected: selectedTab == 2),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 22),
          decoration: BoxDecoration(
            color: appSurface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: appSurfaceLight),
          ),
          child: Column(
            children: <Widget>[
              const Icon(Icons.menu_book_rounded, color: appGold, size: 34),
              const SizedBox(height: 14),
              Text(
                <String>['سيُضاف النص المعتمد هنا', 'سيُضاف شرح المعاني هنا', 'ستُعرض المصادر الموثوقة هنا'][selectedTab],
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                <String>[
                  'نرتّب النص والتشكيل قبل تفعيل المحتوى، حتى تكون القراءة واضحة.',
                  'سيُصمّم عرض المعاني والشرح في هذه المساحة بعد توثيق المحتوى.',
                  'ستظهر بيانات المصدر والكتاب والباب والموضع هنا بعد المراجعة.',
                ][selectedTab],
                textAlign: TextAlign.center,
                style: const TextStyle(color: appMuted, fontSize: 13, height: 1.9),
              ),
              const SizedBox(height: 22),
              for (final double width in <double>[.94, .82, .9, .68])
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: FractionallySizedBox(
                    widthFactor: width,
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: appSurfaceLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: <Widget>[
            Expanded(
              child: OutlinedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.chevron_right_rounded),
                label: const Text('السابق'),
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.chevron_left_rounded),
                label: const Text('التالي'),
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'هذه معاينة للواجهة؛ الحفظ هنا داخل الصفحة فقط، والمحتوى الفعلي يُضاف بعد اكتمال التصميم.',
          textAlign: TextAlign.center,
          style: TextStyle(color: appMuted, fontSize: 11, height: 1.8),
        ),
      ],
    ),
  );
}

class _DetailTab extends StatelessWidget {
  const _DetailTab({required this.label, required this.icon, this.selected = false});
  final String label;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
    decoration: BoxDecoration(
      color: selected ? appSurfaceLight : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      border: selected ? Border.all(color: appGold.withValues(alpha: .2)) : null,
    ),
    child: Column(
      children: <Widget>[
        Icon(icon, size: 18, color: selected ? appGold : appMuted),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 11, fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
          color: selected ? Colors.white : appMuted)),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 4, 2, 18),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('السلام عليكم ورحمة الله', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
                    SizedBox(height: 5),
                    Text('رفيقك اليومي للعبادة والطمأنينة', style: TextStyle(color: appMuted, fontSize: 12)),
                  ],
                ),
              ),
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: appSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: appGold.withValues(alpha: .35)),
                ),
                child: const Icon(Icons.auto_awesome_rounded, color: appGold, size: 23),
              ),
            ],
          ),
        ),
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
            final int columns = constraints.maxWidth >= 900
                ? 4
                : constraints.maxWidth >= 600
                    ? 3
                    : 2;
            final double itemWidth =
                (constraints.maxWidth - (12 * (columns - 1))) / columns;
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.menu_book_rounded, title: 'القرآن الكريم', subtitle: 'المصحف والختمة', onTap: () => onOpen(1))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.volunteer_activism_rounded, title: 'الأدعية والمناجيات', subtitle: 'مكتبة الأدعية', onTap: () => onOpen(2))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.account_balance_rounded, title: 'الزيارات', subtitle: 'زيارات أهل البيت', onTap: () => onOpen(3))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.wb_sunny_outlined, title: 'الأذكار اليومية', subtitle: 'أوراد الصباح والمساء', onTap: () => onOpen(4))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.fingerprint_rounded, title: 'التسبيح الإلكتروني', subtitle: 'تسبيح الزهراء والعداد', onTap: () => onOpen(5))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.access_time_rounded, title: 'مواقيت الصلاة', subtitle: 'الصلوات الخمس', onTap: () => onOpen(6))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.explore_rounded, title: 'القبلة', subtitle: 'بوصلة الاتجاه', onTap: () => onOpen(7))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.calendar_month_rounded, title: 'التقويم الهجري', subtitle: 'عرض الشهر والأيام', onTap: () => onOpen(8))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.auto_awesome_rounded, title: 'الأعمال والعبادات', subtitle: 'يومي وأسبوعي وشهري', onTap: () => onOpen(9))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.event_rounded, title: 'المناسبات والمواسم', subtitle: 'رمضان والحج والأربعين', onTap: () => onOpen(10))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.headphones_rounded, title: 'الصوتيات', subtitle: 'تلاوات وأذان وأدعية', onTap: () => onOpen(11))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.auto_awesome_rounded, title: 'أسماء الله الحسنى', subtitle: 'الأسماء والمعاني', onTap: () => onOpen(12))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.bookmark_border_rounded, title: 'المفضلة', subtitle: 'محفوظاتك', onTap: () => onOpen(13))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.countertops_rounded, title: 'عداد الركعات', subtitle: 'قسم مستقل', onTap: () => onOpen(14))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.calculate_outlined, title: 'سجدتا السهو', subtitle: 'قسم مستقل', onTap: () => onOpen(15))),
                SizedBox(width: itemWidth, child: _CategoryCard(icon: Icons.settings_rounded, title: 'الإعدادات', subtitle: 'تخصيص التطبيق', onTap: () => onOpen(16))),
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

class RakatsCounterDesignPage extends StatelessWidget {
  const RakatsCounterDesignPage({super.key});

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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.countertops_rounded, color: appGold, size: 30),
                SizedBox(height: 14),
                Text('عداد الركعات',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text('واجهة مستقلة لمتابعة عدد الركعات أثناء الصلاة.',
                    style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: appGold.withValues(alpha: .25)),
            ),
            child: Column(
              children: <Widget>[
                const Text('الركعة الحالية',
                    style: TextStyle(color: appMuted, fontSize: 13)),
                const SizedBox(height: 12),
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appBackground,
                    border: Border.all(color: appGold.withValues(alpha: .7), width: 2),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: appGreen.withValues(alpha: .12), blurRadius: 26),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('٠', style: TextStyle(fontSize: 54, fontWeight: FontWeight.w900)),
                      SizedBox(height: 3),
                      Text('ركعات', style: TextStyle(color: appMuted, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: appSurfaceLight,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: appSurfaceLight),
                        ),
                        child: const Column(
                          children: <Widget>[
                            Icon(Icons.remove_rounded, color: appGold, size: 23),
                            SizedBox(height: 5),
                            Text('إنقاص', style: TextStyle(fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: appGreen.withValues(alpha: .16),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: appGreen.withValues(alpha: .45)),
                        ),
                        child: const Column(
                          children: <Widget>[
                            Icon(Icons.add_rounded, color: appGold, size: 23),
                            SizedBox(height: 5),
                            Text('زيادة', style: TextStyle(fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const _SectionTitle(title: 'اختيار الصلاة'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              for (final String prayer in <String>['الفجر', 'الظهر', 'العصر', 'المغرب', 'العشاء'])
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: appSurface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: appSurfaceLight),
                  ),
                  child: Text(prayer,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: appSurfaceLight),
            ),
            child: const Row(
              children: <Widget>[
                Icon(Icons.info_outline_rounded, color: appGold),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'هذه معاينة شكلية؛ أزرار العدّ واختيار الصلاة ستُفعّل في مرحلة الخدمات.',
                    style: TextStyle(color: appMuted, fontSize: 12, height: 1.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

class SajdatSahwDesignPage extends StatelessWidget {
  const SajdatSahwDesignPage({super.key});

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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.calculate_outlined, color: appGold, size: 30),
                SizedBox(height: 14),
                Text('سجدتا السهو',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text('قسم مستقل لتنظيم المسائل والرجوع إلى الحكم الموثق عند الحاجة.',
                    style: TextStyle(color: Color(0xFFD2DFD6), height: 1.8, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: appSurface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: appGold.withValues(alpha: .25)),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.verified_user_outlined, color: appGold, size: 22),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'لن يصدر التطبيق حكماً فقهياً قبل مراجعة المسألة ومصدرها وفق المرجع المعتمد.',
                    style: TextStyle(color: appMuted, fontSize: 12, height: 1.8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const _SectionTitle(title: 'موضوعات القسم'),
          const SizedBox(height: 10),
          for (final _SettingsOption option in const <_SettingsOption>[
            _SettingsOption(Icons.menu_book_outlined, 'أحكام سجدتي السهو',
                'عرض الحكم ومصدره بعد المراجعة الفقهية'),
            _SettingsOption(Icons.help_outline_rounded, 'تحديد المسألة',
                'ترتيب المعلومات اللازمة لفهم الحالة'),
            _SettingsOption(Icons.bookmark_border_rounded, 'المسائل المحفوظة',
                'الرجوع إلى المسائل التي تحفظها لاحقاً'),
          ])
            _AmaalPreviewTile(option: option),
          const SizedBox(height: 8),
          const Text(
            'المحتوى الحالي تصميم للواجهة فقط، وليس فتوى أو إرشاداً عملياً.',
            textAlign: TextAlign.center,
            style: TextStyle(color: appMuted, fontSize: 11, height: 1.8),
          ),
        ],
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
