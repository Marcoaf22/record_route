// List<Medicament> filterMedicaments(
//     List<Medicament> listMedicament, Duration init, Duration end) {
//   DateTime currentDate = DateTime.now();
//   List<Medicament> filterMedicament = listMedicament.where((e) {
//     final date = DateTime.fromMillisecondsSinceEpoch(e.date);

//     final after = date.add(end);
//     final before = date.subtract(init);

//     bool a = currentDate.compareTo(before) > 0;
//     bool b = currentDate.compareTo(after) < 0;
//     if (a && b) {
//       return true;
//     }
//     return false;
//   }).toList();
//   return filterMedicament;
// }

bool isLate(int date) {
  return DateTime.now()
          .difference(DateTime.fromMillisecondsSinceEpoch(date))
          .inSeconds >
      0;
}
