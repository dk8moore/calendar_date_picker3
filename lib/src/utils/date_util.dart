int getMonthFirstDayOffset(int year, int month, int firstDayOfWeekIndex) {
  // 0-based day of week for the month and year, with 0 representing Monday.
  final int weekdayFromMonday = DateTime(year, month).weekday - 1;

  // firstDayOfWeekIndex recomputed to be Monday-based, in order to compare with
  // weekdayFromMonday.
  firstDayOfWeekIndex = (firstDayOfWeekIndex - 1) % 7;

  // Number of days between the first day of week appearing on the calendar,
  // and the day corresponding to the first of the month.
  return (weekdayFromMonday - firstDayOfWeekIndex) % 7;
}

int calculateNumRows(int year, int month, int firstDayOfWeek) {
  int daysInMonth = DateTime(year, month + 1, 0).day;
  int firstDayOfMonth = DateTime(year, month, 1).weekday;

  int firstRowDays = (firstDayOfMonth - firstDayOfWeek < 0)
      ? firstDayOfWeek - firstDayOfMonth
      : 7 - firstDayOfMonth + firstDayOfWeek;
  int numRows = 1 + ((daysInMonth - firstRowDays) / 7).ceil();
  return numRows;
}
