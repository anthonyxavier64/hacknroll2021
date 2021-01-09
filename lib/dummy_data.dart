class DummyData {
  final List<String> faculties = [
    'Arts & Social Sciences',
    'Business',
    'Computing',
    'Continuing and Lifelong Education',
    'Dentistry',
    'Design & Environment',
    'Duke-NUS',
    'Engineering',
    'Integrative Science & Engineering',
    'Law',
    'Medicine',
    'Music',
    'Public Health',
    'Public Policy',
    'Science',
    'Yale-NUS',
  ];

  final List<int> yearOfStudy = [1, 2, 3, 4, 5];

  List<int> getYearOfStudy() {
    return this.yearOfStudy;
  }

  List<String> getFaculties() {
    return this.faculties;
  }
}
