import 'package:flutter_test/flutter_test.dart';
import 'package:mithaq_al_mumin/main.dart';

void main() {
  testWidgets('home screen shows the title and quick access', (WidgetTester tester) async {
    await tester.pumpWidget(const MithaqApp());

    expect(find.text('مِيثَاقُ المُؤْمِنِ'), findsOneWidget);
    expect(find.text('الوصول السريع'), findsOneWidget);
    expect(find.text('السلام على قلبك'), findsOneWidget);
  });

  testWidgets('tasbeeh counter increments and resets', (WidgetTester tester) async {
    await tester.pumpWidget(const MithaqApp());

    await tester.tap(find.text('التسبيح').last);
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.text('تسبيحة جديدة'));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('تصفير العداد'));
    await tester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
  });
}
