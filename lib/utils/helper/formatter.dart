class DateFormatter {
  // Formatter for year and month in word format (e.g., 2024 October)
  String formatYearMonth(DateTime date) {
    final year = date.year;
    final month = _getMonthName(date.month);
    return '$year $month';
  }

  // Formatter for full date in day, month, year format (e.g., 10th October 2024)
  String formatFullDate(DateTime date) {
    final day = date.day;
    final month = _getMonthName(date.month);
    final year = date.year;

    // Adding the suffix (st, nd, rd, th) to the day
    String suffix = 'th';
    if (day % 10 == 1 && day != 11) suffix = 'st';
    if (day % 10 == 2 && day != 12) suffix = 'nd';
    if (day % 10 == 3 && day != 13) suffix = 'rd';

    return '$day$suffix $month $year';
  }

  // Helper function to get the month's name
  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }
}
