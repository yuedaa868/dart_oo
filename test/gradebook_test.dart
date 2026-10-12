import 'package:dart_oo/gradebook.dart';
import 'package:dart_oo/student.dart';
import 'package:test/test.dart';

void main() {
  group('GradeBook stats', () {
    late GradeBook book;

    setUp(() {
      book = GradeBook([
        Student.fromJson({'id': 'S01', 'name': '张三', 'score': 92}),
        Student.fromJson({'id': 'S02', 'name': '李四', 'score': 85}),
        Student.fromJson({'id': 'S03', 'name': '王五', 'score': 74}),
        Student.fromJson({'id': 'S04', 'name': '赵六', 'score': 58}),
        Student.fromJson({'id': 'S05', 'name': '钱七', 'score': 66}),
      ]);
    });

    test('正常数据统计正确', () {
      expect(book.average, 75.0);
      expect(book.maxBy.name, '张三');
      expect(book.maxBy.score, 92);
      expect(book.countPassed, 4);
      expect(book.groupByGrade()['优']?.length, 1);
      expect(book.groupByGrade()['良']?.length, 1);
      expect(book.groupByGrade()['中']?.length, 2);
      expect(book.groupByGrade()['差']?.length, 1);
    });

    test('越界分数抛异常', () {
      expect(
        () => Student(id: 'X', name: 'X', score: -1),
        throwsArgumentError,
      );
      expect(
        () => Student(id: 'X', name: 'X', score: 101),
        throwsArgumentError,
      );
      final s = Student(id: 'X', name: 'X', score: 50);
      expect(() => s.score = 150, throwsArgumentError);
    });
  });
}
