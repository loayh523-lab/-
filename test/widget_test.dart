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
    expect(find.text('القرآن الكريم'), findsWidgets);
    expect(find.text('الأدعية والمناجيات'), findsWidgets);
    expect(find.text('مواقيت الصلاة'), findsWidgets);
    expect(find.text('القبلة'), findsWidgets);
    expect(find.text('التقويم الهجري'), findsWidgets);
    expect(find.text('الأعمال والعبادات'), findsWidgets);
    await tester.drag(find.byKey(const Key('drawer-navigation-list')), const Offset(0, -900));
    await tester.pumpAndSettle();
    expect(find.text('الإعدادات'), findsWidgets);
  });

  testWidgets('prayer times and qibla open as separate sections', (tester) async {
    await tester.pumpWidget(const MithaqApp());

    await tester.tap(find.byTooltip('القائمة الجانبية'));
    await tester.pumpAndSettle();
    final prayerEntry = find.descendant(
      of: find.byKey(const Key('drawer-navigation-list')),
      matching: find.text('مواقيت الصلاة'),
    );
    await tester.ensureVisible(prayerEntry);
    await tester.tap(prayerEntry);
    await tester.pumpAndSettle();
    expect(find.text('مواقيت اليوم'), findsOneWidget);
    expect(find.text('اتجاه القبلة'), findsNothing);

    await tester.tap(find.byTooltip('القائمة الجانبية'));
    await tester.pumpAndSettle();
    final qiblaEntry = find.descendant(
      of: find.byKey(const Key('drawer-navigation-list')),
      matching: find.text('القبلة'),
    );
    await tester.ensureVisible(qiblaEntry);
    await tester.tap(qiblaEntry);
    await tester.pumpAndSettle();
    expect(find.text('اتجاه القبلة'), findsWidgets);
    expect(find.text('مواقيت اليوم'), findsNothing);
  });
}
