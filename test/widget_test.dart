import 'package:eventflow/app/event_flow_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EventFlow opens the discovery page', (tester) async {
    await tester.pumpWidget(const EventFlowApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Discover'), findsOneWidget);
    expect(find.text('Amazing events'), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);
  });
}
