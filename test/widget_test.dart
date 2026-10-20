import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mithaq_al_mumin/main.dart';

void main() {
  testWidgets('home and expanded navigation render', (tester) async {
    await tester.pumpWidget(const MithaqApp());
    expect(find.text('مِيثَاقُ المُؤْمِنِ'), findsWidgets);
    expect(find.text('الصلاة القادمة'), findsOneWidget);
    expect(find.text('أوقات الصلاة'), findsOneWidget);

    await tester.tap(find.byTooltip('القائمة الجانبية'));
    await tester.pumpAndSettle();
    final navList = find.byKey(const Key('drawer-navigation-list'));
    expect(find.text('القرآن الكريم'), findsWidgets);
    expect(find.text('الأدعية والمناجيات'), findsWidgets);

    await tester.drag(navList, const Offset(0, -350));
    await tester.pumpAndSettle();
    expect(find.text('مواقيت الصلاة'), findsWidgets);
    expect(find.text('القبلة'), findsWidgets);
    expect(find.text('التقويم الهجري'), findsWidgets);
    expect(find.text('الأعمال والعبادات'), findsWidgets);

    await tester.drag(navList, const Offset(0, -700));
    await tester.pumpAndSettle();
    expect(find.text('الإعدادات'), findsWidgets);
  });

  testWidgets('prayer times open on their own page', (tester) async {
    await tester.pumpWidget(const MithaqApp());
    await tester.tap(find.byTooltip('القائمة الجانبية'));
    await tester.pumpAndSettle();

    final navList = find.byKey(const Key('drawer-navigation-list'));
    final prayerTile = find.widgetWithText(ListTile, 'مواقيت الصلاة');
    await tester.drag(navList, const Offset(0, -300));
    await tester.pumpAndSettle();
    await tester.tap(prayerTile);
    await tester.pumpAndSettle();

    expect(find.text('مواقيت اليوم'), findsOneWidget);
    expect(find.text('اتجاه القبلة'), findsNothing);
  });

  testWidgets('qibla opens on its own page', (tester) async {
    await tester.pumpWidget(const MithaqApp());
    await tester.tap(find.byTooltip('القائمة الجانبية'));
    await tester.pumpAndSettle();

    final navList = find.byKey(const Key('drawer-navigation-list'));
    final qiblaTile = find.widgetWithText(ListTile, 'القبلة');
    await tester.drag(navList, const Offset(0, -350));
    await tester.pumpAndSettle();
    await tester.tap(qiblaTile);
    await tester.pumpAndSettle();

    expect(find.text('اتجاه القبلة'), findsWidgets);
    expect(find.text('مواقيت اليوم'), findsNothing);
  });
}
