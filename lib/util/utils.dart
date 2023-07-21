
String removeMillisecondsFromDateTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDateTime = dateTime.toLocal().toString().split(".")[0];
  return formattedDateTime;
}