import 'student.dart';

/// 成绩册：内部持有一组学生，构造时传入列表。
class GradeBook {
  final List<Student> _students;

  GradeBook(List<Student> students) : _students = List.of(students);

  List<Student> get students => List.unmodifiable(_students);
}
