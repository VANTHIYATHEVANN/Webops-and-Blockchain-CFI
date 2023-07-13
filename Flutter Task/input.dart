import 'dart:io';

void main() {
  List<String> names = [];
  List<int> rollNos = [];

  // Get names from the user
  for (int i = 0; i < 5; i++) {
    print("Enter name ${i + 1}:");
    String name = stdin.readLineSync()!;
    names.add(name);
  }

  // Get roll numbers from the user
  for (int i = 0; i < 5; i++) {
    print("Enter roll number ${i + 1}:");
    int rollNo = int.parse(stdin.readLineSync()!);
    rollNos.add(rollNo);
  }

  List<dynamic> combinedList = [];

  // Combine the lists
  for (int i = 0; i < 5; i++) {
    combinedList.add(names[i]);
    combinedList.add(rollNos[i]);
  }

  List<dynamic> filteredList = [];

  // Remove elements at odd indexes
  for (int i = 0; i < combinedList.length; i++) {
    if (i % 2 == 0) {
      filteredList.add(combinedList[i]);
    }
  }

  print("Filtered List: $filteredList");
}
