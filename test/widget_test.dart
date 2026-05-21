import 'package:flutter_test/flutter_test.dart';
import 'package:web_portfolio/app.dart';

void main() {
  testWidgets('App renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    // Verify the app renders the hero title
    expect(find.text('HANIF\nUDDIN'), findsOneWidget);
  });
}
