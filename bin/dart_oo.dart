import 'package:dart_oo/gradebook.dart';
import 'package:dart_oo/student.dart';

void main() {
  final book = GradeBook([
    Student.fromJson({'id': 'S01', 'name': '张三', 'score': 92}),
    Student.fromJson({'id': 'S02', 'name': '李四', 'score': 85}),
    Student.fromJson({'id': 'S03', 'name': '王五', 'score': 74}),
    Student.fromJson({'id': 'S04', 'name': '赵六', 'score': 58}),
    Student.fromJson({'id': 'S05', 'name': '钱七', 'score': 66}),
  ]);

  print('平均分: ${book.average}');
  print('最高分: ${book.maxBy.name} (${book.maxBy.score})');
  print('及格人数: ${book.countPassed}');
  book.groupByGrade().forEach((grade, list) {
    print('$grade: ${list.map((s) => s.name).join('、')}');
  });
}
