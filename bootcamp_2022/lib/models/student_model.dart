import 'dart:math';

class StudentModel {
  final int id;
  final String image;
  final String name;
  final String course;
  final bool isWinner;

  const StudentModel({
    required this.id,
    required this.image,
    required this.name,
    required this.course,
    required this.isWinner,
  });

  factory StudentModel.create({required String name, required String course}) {
    return StudentModel(
      id: Random().nextInt(100000),
      image: 'https://robohash.org/${Random().nextInt(10)}.png',
      name: name,
      course: course,
      isWinner: false,
    );
  }

  factory StudentModel.updateAsWinner(StudentModel value) {
    return StudentModel(
      id: value.id,
      image: value.image,
      name: value.name,
      course: value.course,
      isWinner: true,
    );
  }
}
