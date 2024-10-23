import 'package:clean_breaking_bad_app/app/app.dart';
import 'package:clean_breaking_bad_app/home/view/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(const HomePage() as Type), findsOneWidget);
    });
  });
}
