import 'add_number_repo.dart';

class AddNumberRepoImpl with AddNumberRepo {
  int defaultUnit = 5;

  @override
  int addNumber(int value) {
    return value + defaultUnit;
  }
}
