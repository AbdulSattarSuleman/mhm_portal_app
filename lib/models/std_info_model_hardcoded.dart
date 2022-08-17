class StudentInfo {
  int regId, age;
  String fName, lName, faName, stdImage;
  String stdCardfrontImage, stdCardBackImage;
  StudentInfo(
      {required this.regId,
      required this.age,
      required this.fName,
      required this.lName,
      required this.faName,
      required this.stdImage,
      required this.stdCardfrontImage,
      required this.stdCardBackImage});
}

List<StudentInfo> studentList = [
  StudentInfo(
      regId: 501,
      age: 23,
      fName: 'Abdul',
      lName: 'Sattar',
      faName: 'Muhammad Suleman',
      stdImage: 'stdImage',
      stdCardfrontImage: 'assets/images/std-cards/FrontSide.jpg',
      stdCardBackImage: 'assets/images/std-cards/BackSide.jpg'),
  StudentInfo(
      regId: 502,
      age: 23,
      fName: 'Muhammad',
      lName: 'Bilal',
      faName: 'Muhammad Iqbal',
      stdImage: 'stdImage',
      stdCardfrontImage: 'assets/images/std-cards/FrontSide.jpg',
      stdCardBackImage: 'assets/images/std-cards/BackSide.jpg'),
  StudentInfo(
      regId: 503,
      age: 23,
      fName: 'Faraz',
      lName: 'Ahmed',
      faName: 'Muhammad Iqbal',
      stdImage: 'stdImage',
      stdCardfrontImage: 'assets/images/std-cards/FrontSide.jpg',
      stdCardBackImage: 'assets/images/std-cards/BackSide.jpg'),
  StudentInfo(
      regId: 504,
      age: 23,
      fName: 'Muhammad',
      lName: 'Amir',
      faName: 'Muhammad Shoukat',
      stdImage: 'stdImage',
      stdCardfrontImage: 'assets/images/std-cards/FrontSide.jpg',
      stdCardBackImage: 'assets/images/std-cards/BackSide.jpg'),
  StudentInfo(
      regId: 505,
      age: 23,
      fName: 'Muhammad',
      lName: 'Umair',
      faName: 'Muhammad Ishaq',
      stdImage: 'stdImage',
      stdCardfrontImage: 'assets/images/std-cards/FrontSide.jpg',
      stdCardBackImage: 'assets/images/std-cards/BackSide.jpg'),
];
