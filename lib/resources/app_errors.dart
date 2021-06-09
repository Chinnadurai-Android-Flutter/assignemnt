class AppErrors {
  static String fieldRequired({String fieldName}) {
    return "${fieldName ?? "This"} field is required";
  }

  static String connectionError = "No Internet connection";
  static String communicationError =
      "Error occured while Communication with Server with StatusCode";
  static String responseMismatchError = "responseMismatchError : ";
  static String noDataError = "No data found";
  static String fetchError = "Failed to fetch data";
  static String tryAgainError = "Something went wrong. Please try again later.";
  static String underConstructionError = "Under Construction";
}
