// country_state.dart

class SignupStates {
  final List<String> countries;
  final String? selectedCountry;

  SignupStates({required this.countries, this.selectedCountry});

  SignupStates copyWith({
    List<String>? countries,
    String? selectedCountry,
  }) {
    return SignupStates(
      countries: countries ?? this.countries,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}