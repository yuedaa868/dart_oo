import 'logger.dart';
import 'student.dart';

/// 成绩册：内部持有一组学生，构造时传入列表。
class GradeBook with Logger {
  final List<Student> _students;

  GradeBook(List<Student> students) : _students = List.of(students) {
    log('GradeBook 载入 ${_students.length} 名学生');
  }

  List<Student> get students => List.unmodifiable(_students);

  /// 平均分
  double get average =>
      _students.map((s) => s.score).reduce((a, b) => a + b) /
      _students.length;

  /// 最高分学生
  Student get maxBy =>
      _students.reduce((a, b) => a.score >= b.score ? a : b);

  /// 及格人数（>= 60）
  int get countPassed => _students.where((s) => s.score >= 60).length;

  /// 按 优(>=90)/良(80~89)/中(60~79)/差(<60) 分档
  Map<String, List<Student>> groupByGrade() => _students.fold(
        <String, List<Student>>{'优': [], '良': [], '中': [], '差': []},
        (map, s) => map..[_gradeOf(s)]!.add(s),
      );

  String _gradeOf(Student s) => s.score >= 90
      ? '优'
      : s.score >= 80
          ? '良'
          : s.score >= 60
              ? '中'
              : '差';
}
