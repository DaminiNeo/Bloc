import 'package:demo_bloc/screens/counter.dart';
import 'package:test/test.dart';

void main() {
  group('test for increment, decrement', () {
    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });
    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
