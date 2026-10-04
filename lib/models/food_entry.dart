import 'package:flutter_test/flutter_test.dart';
import 'package:calorie_mate/main.dart';

void main() {
  testWidgets('app loads and shows home screen title', (tester) async {
    await tester.pumpWidget(const CalorieMateApp());

    expect(find.text('CalorieMate'), findsWidgets);
  });
}

