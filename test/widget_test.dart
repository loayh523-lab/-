import 'package:flutter_test/flutter_test.dart';
import 'package:mithaq_al_mumin/main.dart';

void main() {
  testWidgets('home has the agreed sections', (tester) async {
    await tester.pumpWidget(const MithaqApp());
    expect(find.text('مِيثَاقُ المُؤْمِنِ'), findsWidgets);
    expect(find.text('الصلاة القادمة'), findsOneWidget);
    expect(find.text('أوقات الصلاة'), findsOneWidget);
    expect(find.text('القرآن الكريم'), findsWidgets);
    expect(find.text('أعمال اليوم المصادف'), findsOneWidget);
  });
}
