class WordSuggestion {
  final String heading;
  final String lingvoTranslations;

  WordSuggestion({this.heading, this.lingvoTranslations});

  factory WordSuggestion.fromJson(Map<String, dynamic> json) {
    return WordSuggestion(
      heading: json['heading'],
      lingvoTranslations: json['lingvoTranslations']
    );
  }
}