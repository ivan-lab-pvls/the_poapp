import 'package:tradings/app/view/pages/simulator/data/models/course_model.dart';

class Courses {
  static List<CourseModel> listOfCourses = [
    CourseModel(
      title: 'EUR/CAD',
      image: 'assets/images/eurcad.png',
      min: 1.2,
      max: 1.3,
    ),
    CourseModel(
      title: 'USD/CHF',
      image: 'assets/images/usdchf.png',
      min: 0.7,
      max: 0.8,
    ),
    CourseModel(
      title: 'USD/JPN',
      image: 'assets/images/usdjapan.png',
      min: 140,
      max: 143,
    ),
    CourseModel(
      title: 'EUR/GBR',
      image: 'assets/images/eurgbr.png',
      min: 0.7,
      max: 0.8,
    ),
    CourseModel(
      title: 'CAD/JPN',
      image: 'assets/images/cadjpn.png',
      min: 95,
      max: 101,
    ),
    CourseModel(
      title: 'USD/GBR',
      image: 'assets/images/usdgbr.png',
      min: 0.6,
      max: 0.7,
    ),
    CourseModel(
      title: 'GBR/CAD',
      image: 'assets/images/gbrcad.png',
      min: 1.6,
      max: 1.68,
    ),
    CourseModel(
      title: 'GBR/JPN',
      image: 'assets/images/gbrjpn.png',
      min: 160,
      max: 172,
    ),
  ];
}
