import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPreferences prefs;
  final BuildContext context;

  LocaleCubit(this.prefs, this.context)
      : super(_getInitialLocale(prefs, context));

  static Locale _getInitialLocale(
      SharedPreferences prefs, BuildContext context) {
    final savedLangCode = prefs.getString('language_code');
    if (savedLangCode != null) {
      return Locale(savedLangCode);
    }

    final platformLocale = View.of(context).platformDispatcher.locale;

    const supportedLocales = [
      Locale('en'),
      Locale('es')
    ]; // Add your supported locales
    if (supportedLocales
        .any((l) => l.languageCode == platformLocale.languageCode)) {
      return platformLocale;
    }

    return supportedLocales.first;
  }

  void changeLocale(Locale newLocale) async {
    await prefs.setString('language_code', newLocale.languageCode);
    emit(newLocale);
  }
}
