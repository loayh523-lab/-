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
    await tester.drag(find.byKey(const Key('drawer-navigation-list')), const Offset(0, -600));
    await tester.pumpAndSettle();
    expect(find.text('الإعدادات'), findsWidgets);
  });
}
