/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 280 (140 per locale)
///
/// Built on 2023-07-11 at 08:44 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ro(languageCode: 'ro', build: _StringsRo.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsSingInScreenEn singInScreen = _StringsSingInScreenEn._(_root);
	late final _StringsCreateAccountEn createAccount = _StringsCreateAccountEn._(_root);
	late final _StringsForgotPasswordEn forgotPassword = _StringsForgotPasswordEn._(_root);
	late final _StringsEventsEn events = _StringsEventsEn._(_root);
	late final _StringsReportProblemEn reportProblem = _StringsReportProblemEn._(_root);
	late final _StringsLocalAdministrationEn localAdministration = _StringsLocalAdministrationEn._(_root);
	late final _StringsAirQualityEn airQuality = _StringsAirQualityEn._(_root);
	late final _StringsUsefullNumbersEn usefullNumbers = _StringsUsefullNumbersEn._(_root);
	late final _StringsTransportEn transport = _StringsTransportEn._(_root);
	late final _StringsVolunteeringEn volunteering = _StringsVolunteeringEn._(_root);
	late final _StringsAnnouncementsEn announcements = _StringsAnnouncementsEn._(_root);
	late final _StringsDrawerEn drawer = _StringsDrawerEn._(_root);
	late final _StringsButtonsEn buttons = _StringsButtonsEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsFormatsEn formats = _StringsFormatsEn._(_root);
	Map<String, String> get locales => {
		'en': 'English',
		'ro': 'Romanian',
	};
}

// Path: singInScreen
class _StringsSingInScreenEn {
	_StringsSingInScreenEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Log in';
	String get emailTextField => 'Email address';
	String get passwordTextField => 'Password';
	String get logInButton => 'Log in';
	String get welcome => 'Welcome!';
	String get wrongEmailPassword => 'The credentials are invalid!';
	String get serverError => 'Server error\nPlease try again later!';
	String get forgotPassword => 'I forgot the password';
	String get guest => 'Use the app now with Guest status';
	String get createAccount => 'Do you want to create an account? ';
	String get createAccountButton => 'Create a new account!';
}

// Path: createAccount
class _StringsCreateAccountEn {
	_StringsCreateAccountEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Create a new account!';
	String get emailTextField => 'Email address';
	String get usernameTextField => 'Name and surname';
	String get phoneNumberTextField => 'Phone number';
	String get passwordTextField => 'Password';
	String get confirmPassword => 'Confirm password';
	String get createAccountButton => 'Create account';
}

// Path: forgotPassword
class _StringsForgotPasswordEn {
	_StringsForgotPasswordEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Reset password';
	String get emailTextField => 'Email address';
	String get resetPasswordButton => 'Reset password';
}

// Path: events
class _StringsEventsEn {
	_StringsEventsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Events';
	String get seeDetails => 'See details';
	String get newEventsTabTitle => 'Soon';
	String get oldEventsTabTitle => 'Past events';
	String get favoritesEventsTabTitle => 'Your events';
	String get addToFavorites => 'Add to favorites';
	String get removeFromFavorites => 'Remove from favorites';
	String startDate({required Object date}) => 'Start date: ${date}';
	String endDate({required Object date}) => 'End date: ${date}';
	String get emptyFavorites => 'You don\'t have any events marked as favorite!';
	String get emptyEvents => 'We couldn\'t find any events. Please try again later!';
}

// Path: reportProblem
class _StringsReportProblemEn {
	_StringsReportProblemEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get radautiCityHall => 'Radauti city hall';
	String get comunalServices => 'Comunal services';
	String get acetRadauti => 'ACET Radauti';
	String get suceavaCountyCouncil => 'Suceava County Council';
	String get suceavaEnvironmentalGuard => 'Suceava Environmental Guard';
	String get suceavaForestGuard => 'Suceava Forest Guard';
	String get dspSuceava => 'DSP Suceava';
	String get ocolulSilvicMarginea => 'Ocolul Silvic Marginea';
	String get radautiulCivicAssociation => 'Radautiul Civic Association';
	String get institutionDropdown => 'Institution';
	String get usernameTextField => 'Name and surname';
	String get categoryDropdown => 'Category';
	String get emailTextField => 'Email address';
	String get subjectTextField => 'Subject';
	String get descriptionTextField => 'Description';
	String get locationSwitch => 'Add location';
	String get imagePicker => 'Take a photo or upload one';
	String get phoneNumberTextField => 'Phone number';
	String get infrastructure => 'Infrastructure';
	String get utilitiesProblem => 'Utilities problems';
	String get uncollectedGarbage => 'Uncollected garbage';
	String get infrastructureStreets => 'Infrastructure (streets)';
	String get illegalConstructions => 'Illegal constructions';
	String get airQualityPollution => 'Air quality and pollution';
	String get safety => 'Safety';
	String get other => 'Other';
	String get submitButton => 'Send';
	String get sentSuccessfully => 'The report was sent successfully!';
	String get sentFailure => 'Something went wrong. Please try again later!';
	late final _StringsReportProblemReportPageEn reportPage = _StringsReportProblemReportPageEn._(_root);
	String get formTab => 'Form';
	String get mapTab => 'Reports Map';
	String get myReportsTab => 'My reports';
	String get title => 'Report a problem';
	String get emptyMyReports => 'You didn\'t make any reports!';
	late final _StringsReportProblemPositionSwitchEn positionSwitch = _StringsReportProblemPositionSwitchEn._(_root);
}

// Path: localAdministration
class _StringsLocalAdministrationEn {
	_StringsLocalAdministrationEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Local Administration';
	String get newsTab => 'News';
	String get localCouncilTab => 'Local council';
	String get localCouncilTeam => 'Local Council Team';
	String get localCouncilLive => 'Local Council Meetings';
	String get localCouncilDecisions => 'Local Council Decisions';
	String get search => 'Search...';
	String get localCouncilLeaders => 'Leaders';
	String get emptyLocalDecisions => 'We couldn\'t find any decisions, please try again later!';
	String get seeMore => 'See more';
	String get wealth => 'Wealth declaration';
	String get interests => 'Declaration of interests';
}

// Path: airQuality
class _StringsAirQualityEn {
	_StringsAirQualityEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Air quality';
	String get airQualityTab => 'Air quality';
	String get chartsTab => 'Charts';
	String get mapTab => 'Map';
}

// Path: usefullNumbers
class _StringsUsefullNumbersEn {
	_StringsUsefullNumbersEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Phone numbers';
	String get publicTab => 'Local institutions';
	String get authoritiesTab => 'Local authorities';
	String get upsetsTab => 'Upsets';
	String get empty => 'We couldn\'t find any phone number.';
	String get hospital => 'Municipal hospital';
	String get townhall => 'Town hall';
	String get animals => 'Animal shelter';
	String get police => 'Local police';
	String get consumerProtection => 'Consumer protection';
	String get childProtection => 'Child protection';
	String get animalProtection => 'Animal protection';
	String get environmentProtection => 'Environment protection';
	String get suceavaEnvironmentalGuard => 'Suceava Environmental Guard';
	String get comunalServices => 'Comunal services';
	String get acet => 'ACET';
}

// Path: transport
class _StringsTransportEn {
	_StringsTransportEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Transport';
	String get taxiTab => 'Taxi';
	String get trainTab => 'Train';
	String get emptyTaxi => 'We couldn\'t find any taxi!';
	String get emptyTrain => 'We couldn\'t find any train!';
}

// Path: volunteering
class _StringsVolunteeringEn {
	_StringsVolunteeringEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Volunteering';
	String get webSite => 'Website';
}

// Path: announcements
class _StringsAnnouncementsEn {
	_StringsAnnouncementsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Announcements';
	String posted_at({required Object value}) => 'posted at: ${value}';
	String get tabLocal => 'Local';
	String get emptyAnnouncements => 'We couldn\'t find any announcement!';
	String get tabFurniture => 'Furniture';
	String get tabJobs => 'Jobs';
	String get seeDetails => 'See details ->';
}

// Path: drawer
class _StringsDrawerEn {
	_StringsDrawerEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get reportProblem => '${_root.reportProblem.title}';
	String get localAdministration => '${_root.localAdministration.title}';
	String get airQuality => '${_root.airQuality.title}';
	String get events => '${_root.events.title}';
	String get transport => '${_root.transport.title}';
	String get volunteering => '${_root.volunteering.title}';
	String get announcements => '${_root.announcements.title}';
	String get signOut => 'Sign out';
}

// Path: buttons
class _StringsButtonsEn {
	_StringsButtonsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get log_in => 'Log in';
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get newEvents => 'Upcoming events will appear here!';
}

// Path: formats
class _StringsFormatsEn {
	_StringsFormatsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get invalidEmail => 'Wrong email format! e.g aaa@bb.ccc!';
	String get onlyNumbersField => 'This field should contain only numbers!';
	String get invalidPhoneNumber => 'Wrong phone number format\nWe accept the following:\n+40213-564-864\n+40213.564.864\n+40213 564 864\n0213-564-864\n0712456789';
	String get minimum50 => 'This field should contain more than 50 characters!';
	String get strongerPassword => 'Please use a stronger password!';
	String get requiredField => 'This field is required. Please fill in the field!';
	String get confirmPassword => 'Password do no match!';
}

// Path: reportProblem.reportPage
class _StringsReportProblemReportPageEn {
	_StringsReportProblemReportPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String subject({required Object value}) => 'Subject: ${value}';
	String description({required Object value}) => 'Description: ${value}';
	String category({required Object value}) => 'Category: ${value}';
	String institution({required Object value}) => 'Institution: ${value}';
	String institutionEmail({required Object value}) => 'Email: ${value}';
	String sentBy({required Object value}) => 'Sent by ${value}';
}

// Path: reportProblem.positionSwitch
class _StringsReportProblemPositionSwitchEn {
	_StringsReportProblemPositionSwitchEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get denied => 'Requesting permissions...';
	String get deniedForever => 'Location permissions are permanently denied, we cannot request permissions.';
	String get disabled => 'Location services are disabled';
}

// Path: <root>
class _StringsRo implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRo.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ro,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ro>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRo _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsSingInScreenRo singInScreen = _StringsSingInScreenRo._(_root);
	@override late final _StringsCreateAccountRo createAccount = _StringsCreateAccountRo._(_root);
	@override late final _StringsForgotPasswordRo forgotPassword = _StringsForgotPasswordRo._(_root);
	@override late final _StringsEventsRo events = _StringsEventsRo._(_root);
	@override late final _StringsReportProblemRo reportProblem = _StringsReportProblemRo._(_root);
	@override late final _StringsLocalAdministrationRo localAdministration = _StringsLocalAdministrationRo._(_root);
	@override late final _StringsAirQualityRo airQuality = _StringsAirQualityRo._(_root);
	@override late final _StringsUsefullNumbersRo usefullNumbers = _StringsUsefullNumbersRo._(_root);
	@override late final _StringsTransportRo transport = _StringsTransportRo._(_root);
	@override late final _StringsVolunteeringRo volunteering = _StringsVolunteeringRo._(_root);
	@override late final _StringsAnnouncementsRo announcements = _StringsAnnouncementsRo._(_root);
	@override late final _StringsDrawerRo drawer = _StringsDrawerRo._(_root);
	@override late final _StringsButtonsRo buttons = _StringsButtonsRo._(_root);
	@override late final _StringsHomeRo home = _StringsHomeRo._(_root);
	@override late final _StringsFormatsRo formats = _StringsFormatsRo._(_root);
	@override Map<String, String> get locales => {
		'en': 'Engleză',
		'ro': 'Română',
	};
}

// Path: singInScreen
class _StringsSingInScreenRo implements _StringsSingInScreenEn {
	_StringsSingInScreenRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Log in';
	@override String get emailTextField => 'Adresă de email';
	@override String get passwordTextField => 'Parolă';
	@override String get logInButton => 'Log in';
	@override String get welcome => 'Bine ai venit!';
	@override String get wrongEmailPassword => 'Datele sunt invalide!';
	@override String get serverError => 'Eroare de server\nIncercati din nou mai tarziu!';
	@override String get forgotPassword => 'Ai uitat parola?';
	@override String get guest => 'Continuă ca vizitator';
	@override String get createAccount => 'Vrei să te înregistrezi în aplicație? ';
	@override String get createAccountButton => 'Creează-ți cont!';
}

// Path: createAccount
class _StringsCreateAccountRo implements _StringsCreateAccountEn {
	_StringsCreateAccountRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Creează-ți cont!';
	@override String get emailTextField => 'Adresă de email';
	@override String get usernameTextField => 'Numele și prenumele';
	@override String get phoneNumberTextField => 'Număr de telefon';
	@override String get passwordTextField => 'Parolă';
	@override String get confirmPassword => 'Confirmă parola';
	@override String get createAccountButton => 'Creează-ți cont';
}

// Path: forgotPassword
class _StringsForgotPasswordRo implements _StringsForgotPasswordEn {
	_StringsForgotPasswordRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Resetează parola';
	@override String get emailTextField => 'Adresă de email';
	@override String get resetPasswordButton => 'Resetează parola';
}

// Path: events
class _StringsEventsRo implements _StringsEventsEn {
	_StringsEventsRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Evenimente';
	@override String get seeDetails => 'Vezi detalii';
	@override String get newEventsTabTitle => 'Viitoare';
	@override String get oldEventsTabTitle => 'Evenimente trecute';
	@override String get favoritesEventsTabTitle => 'Evenimentele tale';
	@override String get addToFavorites => 'Adaugă la favorite';
	@override String get removeFromFavorites => 'Șterge de la favorite';
	@override String startDate({required Object date}) => 'Data de început: ${date}';
	@override String endDate({required Object date}) => 'Data de încheiere: ${date}';
	@override String get emptyFavorites => 'Nu aveți niciun eveniment marcat ca favorit!';
	@override String get emptyEvents => 'Nu am putut găsi niciun eveniment. Vă rugăm să încercați din nou mai târziu!';
}

// Path: reportProblem
class _StringsReportProblemRo implements _StringsReportProblemEn {
	_StringsReportProblemRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get radautiCityHall => 'Primăria Radauti';
	@override String get comunalServices => 'Servicii Comunale';
	@override String get acetRadauti => 'ACET Rădăuți';
	@override String get suceavaCountyCouncil => 'Consiliul Județean Suceava';
	@override String get suceavaEnvironmentalGuard => 'Garda de Mediu Suceava';
	@override String get suceavaForestGuard => 'Garda Forestieră Suceava';
	@override String get dspSuceava => 'DSP Suceava';
	@override String get ocolulSilvicMarginea => 'Ocolul Silvic Marginea';
	@override String get radautiulCivicAssociation => 'Asociația Rădăuțiul Civic';
	@override String get institutionDropdown => 'Instituţie';
	@override String get usernameTextField => 'Numele și prenumele';
	@override String get categoryDropdown => 'Categorie';
	@override String get emailTextField => 'Adresă de email';
	@override String get subjectTextField => 'Subiect';
	@override String get descriptionTextField => 'Descriere';
	@override String get locationSwitch => 'Adaugă locația';
	@override String get imagePicker => 'Fă o fotografie sau încarcă una';
	@override String get phoneNumberTextField => 'Număr de telefon';
	@override String get infrastructure => 'Infrastructură';
	@override String get utilitiesProblem => 'Probleme cu utilitățile';
	@override String get uncollectedGarbage => 'Gunoi neridicat';
	@override String get infrastructureStreets => 'Infrastructură (străzi, trotuare)';
	@override String get illegalConstructions => 'Construcții ilegale';
	@override String get airQualityPollution => 'Calitatea aerului și poluarea';
	@override String get safety => 'Siguranță';
	@override String get other => 'Other';
	@override String get submitButton => 'Trimite';
	@override String get sentFailure => 'Ceva n-a mers bine. Vă rugăm să încercați din nou mai târziu!';
	@override String get sentSuccessfully => 'Raportul a fost trimis cu succes!';
	@override late final _StringsReportProblemReportPageRo reportPage = _StringsReportProblemReportPageRo._(_root);
	@override String get formTab => 'Formular';
	@override String get mapTab => 'Harta sesizărilor';
	@override String get myReportsTab => 'Rapoartele mele';
	@override String get title => 'Report a problem';
	@override String get emptyMyReports => 'Nu ati facut nici o sesizare!';
	@override late final _StringsReportProblemPositionSwitchRo positionSwitch = _StringsReportProblemPositionSwitchRo._(_root);
}

// Path: localAdministration
class _StringsLocalAdministrationRo implements _StringsLocalAdministrationEn {
	_StringsLocalAdministrationRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Administrație Locală';
	@override String get newsTab => 'Noutăți';
	@override String get localCouncilTab => 'Consiliul local';
	@override String get localCouncilTeam => 'Echipă Consiliu Local';
	@override String get localCouncilLive => 'Ședințe de Consiliu Local';
	@override String get search => 'Search...';
	@override String get localCouncilDecisions => 'Hotărârile Consiliului Local';
	@override String get localCouncilLeaders => 'Leaders';
	@override String get emptyLocalDecisions => 'Nu am putut găsi nicio hotărâre, vă rugăm să încercați din nou mai târziu!';
	@override String get seeMore => 'Vezi mai mult';
	@override String get wealth => 'Declarația de avere';
	@override String get interests => 'Declarație de interese';
}

// Path: airQuality
class _StringsAirQualityRo implements _StringsAirQualityEn {
	_StringsAirQualityRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Calitatea aerului';
	@override String get airQualityTab => 'Calitatea aerului';
	@override String get chartsTab => 'Grafice';
	@override String get mapTab => 'Hartă';
}

// Path: usefullNumbers
class _StringsUsefullNumbersRo implements _StringsUsefullNumbersEn {
	_StringsUsefullNumbersRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Numere de telefon';
	@override String get publicTab => 'Instituții locale';
	@override String get authoritiesTab => 'Autorități locale';
	@override String get upsetsTab => 'Deranjamente';
	@override String get empty => 'Nu am putut găsi nici un număr de telefon.';
	@override String get hospital => 'Spitalul Municipal';
	@override String get townhall => 'Primărie';
	@override String get animals => 'Adăpostul de animale';
	@override String get police => 'Poliția Locală';
	@override String get consumerProtection => 'Protecția consumatorului';
	@override String get childProtection => 'Protecția copilului';
	@override String get animalProtection => 'Protecția animalelor';
	@override String get environmentProtection => 'Protecția mediului';
	@override String get suceavaEnvironmentalGuard => 'Garda de Mediu Suceava';
	@override String get comunalServices => 'Servicii Comunale';
	@override String get acet => 'ACET';
}

// Path: transport
class _StringsTransportRo implements _StringsTransportEn {
	_StringsTransportRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Transport';
	@override String get taxiTab => 'Taxi';
	@override String get trainTab => 'Trenuri';
	@override String get emptyTaxi => 'Nu am putut găsi nici un taxiu!';
	@override String get emptyTrain => 'Nu am putut găsi nici un tren!';
}

// Path: volunteering
class _StringsVolunteeringRo implements _StringsVolunteeringEn {
	_StringsVolunteeringRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Voluntariat';
	@override String get webSite => 'Pagină web';
}

// Path: announcements
class _StringsAnnouncementsRo implements _StringsAnnouncementsEn {
	_StringsAnnouncementsRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Anunțuri';
	@override String posted_at({required Object value}) => 'postat în: ${value}';
	@override String get tabLocal => 'Locale';
	@override String get emptyAnnouncements => 'Nu am găsit nici un anunț!';
	@override String get tabFurniture => 'Imobiliare';
	@override String get tabJobs => 'Locuri de muncă';
	@override String get seeDetails => 'Vezi detalii ->';
}

// Path: drawer
class _StringsDrawerRo implements _StringsDrawerEn {
	_StringsDrawerRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get reportProblem => '${_root.reportProblem.title}';
	@override String get localAdministration => '${_root.localAdministration.title}';
	@override String get airQuality => '${_root.airQuality.title}';
	@override String get events => '${_root.events.title}';
	@override String get transport => '${_root.transport.title}';
	@override String get volunteering => '${_root.volunteering.title}';
	@override String get announcements => '${_root.announcements.title}';
	@override String get signOut => 'Delogare';
}

// Path: buttons
class _StringsButtonsRo implements _StringsButtonsEn {
	_StringsButtonsRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get log_in => 'Log in';
}

// Path: home
class _StringsHomeRo implements _StringsHomeEn {
	_StringsHomeRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get newEvents => 'Evenimentele următoare vor apărea aici!';
}

// Path: formats
class _StringsFormatsRo implements _StringsFormatsEn {
	_StringsFormatsRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get onlyNumbersField => 'Acest câmp trebuie să conțină numai numere';
	@override String get invalidPhoneNumber => 'Format greșit al numărului de telefon\n   \nAcceptăm următoarele:\n   \n+40213-564-864\n   \n+40213.564.864\n   \n+40213 564 864\n   \n0213-564-864\n   \n0712456789';
	@override String get minimum50 => 'Această căsuță trebuie să conțină mai mult de 50 de caractere!';
	@override String get invalidEmail => 'Format de e-mail greșit! de ex. aaa@bb.ccc!';
	@override String get strongerPassword => 'Parola este slabă. Vă rugăm să furnizați o parolă mai bună!';
	@override String get requiredField => 'Acestă căsuță este obligatorie. Vă rugăm să o completați!';
	@override String get confirmPassword => 'Parolele nu se potrivesc!';
}

// Path: reportProblem.reportPage
class _StringsReportProblemReportPageRo implements _StringsReportProblemReportPageEn {
	_StringsReportProblemReportPageRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String subject({required Object value}) => 'Subiect: ${value}';
	@override String description({required Object value}) => 'Descriere: ${value}';
	@override String category({required Object value}) => 'Categoria: ${value}';
	@override String institution({required Object value}) => 'Institutia: ${value}';
	@override String institutionEmail({required Object value}) => 'Email: ${value}';
	@override String sentBy({required Object value}) => 'Trimis de ${value}';
}

// Path: reportProblem.positionSwitch
class _StringsReportProblemPositionSwitchRo implements _StringsReportProblemPositionSwitchEn {
	_StringsReportProblemPositionSwitchRo._(this._root);

	@override final _StringsRo _root; // ignore: unused_field

	// Translations
	@override String get denied => 'Se solicită permisiuni...';
	@override String get deniedForever => 'Permisiunile pentru locație sunt refuzate definitiv, nu putem solicita permisiuni.';
	@override String get disabled => 'Serviciile de localizare sunt dezactivate';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'singInScreen.title': return 'Log in';
			case 'singInScreen.emailTextField': return 'Email address';
			case 'singInScreen.passwordTextField': return 'Password';
			case 'singInScreen.logInButton': return 'Log in';
			case 'singInScreen.welcome': return 'Welcome!';
			case 'singInScreen.wrongEmailPassword': return 'The credentials are invalid!';
			case 'singInScreen.serverError': return 'Server error\nPlease try again later!';
			case 'singInScreen.forgotPassword': return 'I forgot the password';
			case 'singInScreen.guest': return 'Use the app now with Guest status';
			case 'singInScreen.createAccount': return 'Do you want to create an account? ';
			case 'singInScreen.createAccountButton': return 'Create a new account!';
			case 'createAccount.title': return 'Create a new account!';
			case 'createAccount.emailTextField': return 'Email address';
			case 'createAccount.usernameTextField': return 'Name and surname';
			case 'createAccount.phoneNumberTextField': return 'Phone number';
			case 'createAccount.passwordTextField': return 'Password';
			case 'createAccount.confirmPassword': return 'Confirm password';
			case 'createAccount.createAccountButton': return 'Create account';
			case 'forgotPassword.title': return 'Reset password';
			case 'forgotPassword.emailTextField': return 'Email address';
			case 'forgotPassword.resetPasswordButton': return 'Reset password';
			case 'events.title': return 'Events';
			case 'events.seeDetails': return 'See details';
			case 'events.newEventsTabTitle': return 'Soon';
			case 'events.oldEventsTabTitle': return 'Past events';
			case 'events.favoritesEventsTabTitle': return 'Your events';
			case 'events.addToFavorites': return 'Add to favorites';
			case 'events.removeFromFavorites': return 'Remove from favorites';
			case 'events.startDate': return ({required Object date}) => 'Start date: ${date}';
			case 'events.endDate': return ({required Object date}) => 'End date: ${date}';
			case 'events.emptyFavorites': return 'You don\'t have any events marked as favorite!';
			case 'events.emptyEvents': return 'We couldn\'t find any events. Please try again later!';
			case 'reportProblem.radautiCityHall': return 'Radauti city hall';
			case 'reportProblem.comunalServices': return 'Comunal services';
			case 'reportProblem.acetRadauti': return 'ACET Radauti';
			case 'reportProblem.suceavaCountyCouncil': return 'Suceava County Council';
			case 'reportProblem.suceavaEnvironmentalGuard': return 'Suceava Environmental Guard';
			case 'reportProblem.suceavaForestGuard': return 'Suceava Forest Guard';
			case 'reportProblem.dspSuceava': return 'DSP Suceava';
			case 'reportProblem.ocolulSilvicMarginea': return 'Ocolul Silvic Marginea';
			case 'reportProblem.radautiulCivicAssociation': return 'Radautiul Civic Association';
			case 'reportProblem.institutionDropdown': return 'Institution';
			case 'reportProblem.usernameTextField': return 'Name and surname';
			case 'reportProblem.categoryDropdown': return 'Category';
			case 'reportProblem.emailTextField': return 'Email address';
			case 'reportProblem.subjectTextField': return 'Subject';
			case 'reportProblem.descriptionTextField': return 'Description';
			case 'reportProblem.locationSwitch': return 'Add location';
			case 'reportProblem.imagePicker': return 'Take a photo or upload one';
			case 'reportProblem.phoneNumberTextField': return 'Phone number';
			case 'reportProblem.infrastructure': return 'Infrastructure';
			case 'reportProblem.utilitiesProblem': return 'Utilities problems';
			case 'reportProblem.uncollectedGarbage': return 'Uncollected garbage';
			case 'reportProblem.infrastructureStreets': return 'Infrastructure (streets)';
			case 'reportProblem.illegalConstructions': return 'Illegal constructions';
			case 'reportProblem.airQualityPollution': return 'Air quality and pollution';
			case 'reportProblem.safety': return 'Safety';
			case 'reportProblem.other': return 'Other';
			case 'reportProblem.submitButton': return 'Send';
			case 'reportProblem.sentSuccessfully': return 'The report was sent successfully!';
			case 'reportProblem.sentFailure': return 'Something went wrong. Please try again later!';
			case 'reportProblem.reportPage.subject': return ({required Object value}) => 'Subject: ${value}';
			case 'reportProblem.reportPage.description': return ({required Object value}) => 'Description: ${value}';
			case 'reportProblem.reportPage.category': return ({required Object value}) => 'Category: ${value}';
			case 'reportProblem.reportPage.institution': return ({required Object value}) => 'Institution: ${value}';
			case 'reportProblem.reportPage.institutionEmail': return ({required Object value}) => 'Email: ${value}';
			case 'reportProblem.reportPage.sentBy': return ({required Object value}) => 'Sent by ${value}';
			case 'reportProblem.formTab': return 'Form';
			case 'reportProblem.mapTab': return 'Reports Map';
			case 'reportProblem.myReportsTab': return 'My reports';
			case 'reportProblem.title': return 'Report a problem';
			case 'reportProblem.emptyMyReports': return 'You didn\'t make any reports!';
			case 'reportProblem.positionSwitch.denied': return 'Requesting permissions...';
			case 'reportProblem.positionSwitch.deniedForever': return 'Location permissions are permanently denied, we cannot request permissions.';
			case 'reportProblem.positionSwitch.disabled': return 'Location services are disabled';
			case 'localAdministration.title': return 'Local Administration';
			case 'localAdministration.newsTab': return 'News';
			case 'localAdministration.localCouncilTab': return 'Local council';
			case 'localAdministration.localCouncilTeam': return 'Local Council Team';
			case 'localAdministration.localCouncilLive': return 'Local Council Meetings';
			case 'localAdministration.localCouncilDecisions': return 'Local Council Decisions';
			case 'localAdministration.search': return 'Search...';
			case 'localAdministration.localCouncilLeaders': return 'Leaders';
			case 'localAdministration.emptyLocalDecisions': return 'We couldn\'t find any decisions, please try again later!';
			case 'localAdministration.seeMore': return 'See more';
			case 'localAdministration.wealth': return 'Wealth declaration';
			case 'localAdministration.interests': return 'Declaration of interests';
			case 'airQuality.title': return 'Air quality';
			case 'airQuality.airQualityTab': return 'Air quality';
			case 'airQuality.chartsTab': return 'Charts';
			case 'airQuality.mapTab': return 'Map';
			case 'usefullNumbers.title': return 'Phone numbers';
			case 'usefullNumbers.publicTab': return 'Local institutions';
			case 'usefullNumbers.authoritiesTab': return 'Local authorities';
			case 'usefullNumbers.upsetsTab': return 'Upsets';
			case 'usefullNumbers.empty': return 'We couldn\'t find any phone number.';
			case 'usefullNumbers.hospital': return 'Municipal hospital';
			case 'usefullNumbers.townhall': return 'Town hall';
			case 'usefullNumbers.animals': return 'Animal shelter';
			case 'usefullNumbers.police': return 'Local police';
			case 'usefullNumbers.consumerProtection': return 'Consumer protection';
			case 'usefullNumbers.childProtection': return 'Child protection';
			case 'usefullNumbers.animalProtection': return 'Animal protection';
			case 'usefullNumbers.environmentProtection': return 'Environment protection';
			case 'usefullNumbers.suceavaEnvironmentalGuard': return 'Suceava Environmental Guard';
			case 'usefullNumbers.comunalServices': return 'Comunal services';
			case 'usefullNumbers.acet': return 'ACET';
			case 'transport.title': return 'Transport';
			case 'transport.taxiTab': return 'Taxi';
			case 'transport.trainTab': return 'Train';
			case 'transport.emptyTaxi': return 'We couldn\'t find any taxi!';
			case 'transport.emptyTrain': return 'We couldn\'t find any train!';
			case 'volunteering.title': return 'Volunteering';
			case 'volunteering.webSite': return 'Website';
			case 'announcements.title': return 'Announcements';
			case 'announcements.posted_at': return ({required Object value}) => 'posted at: ${value}';
			case 'announcements.tabLocal': return 'Local';
			case 'announcements.emptyAnnouncements': return 'We couldn\'t find any announcement!';
			case 'announcements.tabFurniture': return 'Furniture';
			case 'announcements.tabJobs': return 'Jobs';
			case 'announcements.seeDetails': return 'See details ->';
			case 'drawer.reportProblem': return '${_root.reportProblem.title}';
			case 'drawer.localAdministration': return '${_root.localAdministration.title}';
			case 'drawer.airQuality': return '${_root.airQuality.title}';
			case 'drawer.events': return '${_root.events.title}';
			case 'drawer.transport': return '${_root.transport.title}';
			case 'drawer.volunteering': return '${_root.volunteering.title}';
			case 'drawer.announcements': return '${_root.announcements.title}';
			case 'drawer.signOut': return 'Sign out';
			case 'buttons.log_in': return 'Log in';
			case 'home.newEvents': return 'Upcoming events will appear here!';
			case 'formats.invalidEmail': return 'Wrong email format! e.g aaa@bb.ccc!';
			case 'formats.onlyNumbersField': return 'This field should contain only numbers!';
			case 'formats.invalidPhoneNumber': return 'Wrong phone number format\nWe accept the following:\n+40213-564-864\n+40213.564.864\n+40213 564 864\n0213-564-864\n0712456789';
			case 'formats.minimum50': return 'This field should contain more than 50 characters!';
			case 'formats.strongerPassword': return 'Please use a stronger password!';
			case 'formats.requiredField': return 'This field is required. Please fill in the field!';
			case 'formats.confirmPassword': return 'Password do no match!';
			case 'locales.en': return 'English';
			case 'locales.ro': return 'Romanian';
			default: return null;
		}
	}
}

extension on _StringsRo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'singInScreen.title': return 'Log in';
			case 'singInScreen.emailTextField': return 'Adresă de email';
			case 'singInScreen.passwordTextField': return 'Parolă';
			case 'singInScreen.logInButton': return 'Log in';
			case 'singInScreen.welcome': return 'Bine ai venit!';
			case 'singInScreen.wrongEmailPassword': return 'Datele sunt invalide!';
			case 'singInScreen.serverError': return 'Eroare de server\nIncercati din nou mai tarziu!';
			case 'singInScreen.forgotPassword': return 'Ai uitat parola?';
			case 'singInScreen.guest': return 'Continuă ca vizitator';
			case 'singInScreen.createAccount': return 'Vrei să te înregistrezi în aplicație? ';
			case 'singInScreen.createAccountButton': return 'Creează-ți cont!';
			case 'createAccount.title': return 'Creează-ți cont!';
			case 'createAccount.emailTextField': return 'Adresă de email';
			case 'createAccount.usernameTextField': return 'Numele și prenumele';
			case 'createAccount.phoneNumberTextField': return 'Număr de telefon';
			case 'createAccount.passwordTextField': return 'Parolă';
			case 'createAccount.confirmPassword': return 'Confirmă parola';
			case 'createAccount.createAccountButton': return 'Creează-ți cont';
			case 'forgotPassword.title': return 'Resetează parola';
			case 'forgotPassword.emailTextField': return 'Adresă de email';
			case 'forgotPassword.resetPasswordButton': return 'Resetează parola';
			case 'events.title': return 'Evenimente';
			case 'events.seeDetails': return 'Vezi detalii';
			case 'events.newEventsTabTitle': return 'Viitoare';
			case 'events.oldEventsTabTitle': return 'Evenimente trecute';
			case 'events.favoritesEventsTabTitle': return 'Evenimentele tale';
			case 'events.addToFavorites': return 'Adaugă la favorite';
			case 'events.removeFromFavorites': return 'Șterge de la favorite';
			case 'events.startDate': return ({required Object date}) => 'Data de început: ${date}';
			case 'events.endDate': return ({required Object date}) => 'Data de încheiere: ${date}';
			case 'events.emptyFavorites': return 'Nu aveți niciun eveniment marcat ca favorit!';
			case 'events.emptyEvents': return 'Nu am putut găsi niciun eveniment. Vă rugăm să încercați din nou mai târziu!';
			case 'reportProblem.radautiCityHall': return 'Primăria Radauti';
			case 'reportProblem.comunalServices': return 'Servicii Comunale';
			case 'reportProblem.acetRadauti': return 'ACET Rădăuți';
			case 'reportProblem.suceavaCountyCouncil': return 'Consiliul Județean Suceava';
			case 'reportProblem.suceavaEnvironmentalGuard': return 'Garda de Mediu Suceava';
			case 'reportProblem.suceavaForestGuard': return 'Garda Forestieră Suceava';
			case 'reportProblem.dspSuceava': return 'DSP Suceava';
			case 'reportProblem.ocolulSilvicMarginea': return 'Ocolul Silvic Marginea';
			case 'reportProblem.radautiulCivicAssociation': return 'Asociația Rădăuțiul Civic';
			case 'reportProblem.institutionDropdown': return 'Instituţie';
			case 'reportProblem.usernameTextField': return 'Numele și prenumele';
			case 'reportProblem.categoryDropdown': return 'Categorie';
			case 'reportProblem.emailTextField': return 'Adresă de email';
			case 'reportProblem.subjectTextField': return 'Subiect';
			case 'reportProblem.descriptionTextField': return 'Descriere';
			case 'reportProblem.locationSwitch': return 'Adaugă locația';
			case 'reportProblem.imagePicker': return 'Fă o fotografie sau încarcă una';
			case 'reportProblem.phoneNumberTextField': return 'Număr de telefon';
			case 'reportProblem.infrastructure': return 'Infrastructură';
			case 'reportProblem.utilitiesProblem': return 'Probleme cu utilitățile';
			case 'reportProblem.uncollectedGarbage': return 'Gunoi neridicat';
			case 'reportProblem.infrastructureStreets': return 'Infrastructură (străzi, trotuare)';
			case 'reportProblem.illegalConstructions': return 'Construcții ilegale';
			case 'reportProblem.airQualityPollution': return 'Calitatea aerului și poluarea';
			case 'reportProblem.safety': return 'Siguranță';
			case 'reportProblem.other': return 'Other';
			case 'reportProblem.submitButton': return 'Trimite';
			case 'reportProblem.sentFailure': return 'Ceva n-a mers bine. Vă rugăm să încercați din nou mai târziu!';
			case 'reportProblem.sentSuccessfully': return 'Raportul a fost trimis cu succes!';
			case 'reportProblem.reportPage.subject': return ({required Object value}) => 'Subiect: ${value}';
			case 'reportProblem.reportPage.description': return ({required Object value}) => 'Descriere: ${value}';
			case 'reportProblem.reportPage.category': return ({required Object value}) => 'Categoria: ${value}';
			case 'reportProblem.reportPage.institution': return ({required Object value}) => 'Institutia: ${value}';
			case 'reportProblem.reportPage.institutionEmail': return ({required Object value}) => 'Email: ${value}';
			case 'reportProblem.reportPage.sentBy': return ({required Object value}) => 'Trimis de ${value}';
			case 'reportProblem.formTab': return 'Formular';
			case 'reportProblem.mapTab': return 'Harta sesizărilor';
			case 'reportProblem.myReportsTab': return 'Rapoartele mele';
			case 'reportProblem.title': return 'Report a problem';
			case 'reportProblem.emptyMyReports': return 'Nu ati facut nici o sesizare!';
			case 'reportProblem.positionSwitch.denied': return 'Se solicită permisiuni...';
			case 'reportProblem.positionSwitch.deniedForever': return 'Permisiunile pentru locație sunt refuzate definitiv, nu putem solicita permisiuni.';
			case 'reportProblem.positionSwitch.disabled': return 'Serviciile de localizare sunt dezactivate';
			case 'localAdministration.title': return 'Administrație Locală';
			case 'localAdministration.newsTab': return 'Noutăți';
			case 'localAdministration.localCouncilTab': return 'Consiliul local';
			case 'localAdministration.localCouncilTeam': return 'Echipă Consiliu Local';
			case 'localAdministration.localCouncilLive': return 'Ședințe de Consiliu Local';
			case 'localAdministration.search': return 'Search...';
			case 'localAdministration.localCouncilDecisions': return 'Hotărârile Consiliului Local';
			case 'localAdministration.localCouncilLeaders': return 'Leaders';
			case 'localAdministration.emptyLocalDecisions': return 'Nu am putut găsi nicio hotărâre, vă rugăm să încercați din nou mai târziu!';
			case 'localAdministration.seeMore': return 'Vezi mai mult';
			case 'localAdministration.wealth': return 'Declarația de avere';
			case 'localAdministration.interests': return 'Declarație de interese';
			case 'airQuality.title': return 'Calitatea aerului';
			case 'airQuality.airQualityTab': return 'Calitatea aerului';
			case 'airQuality.chartsTab': return 'Grafice';
			case 'airQuality.mapTab': return 'Hartă';
			case 'usefullNumbers.title': return 'Numere de telefon';
			case 'usefullNumbers.publicTab': return 'Instituții locale';
			case 'usefullNumbers.authoritiesTab': return 'Autorități locale';
			case 'usefullNumbers.upsetsTab': return 'Deranjamente';
			case 'usefullNumbers.empty': return 'Nu am putut găsi nici un număr de telefon.';
			case 'usefullNumbers.hospital': return 'Spitalul Municipal';
			case 'usefullNumbers.townhall': return 'Primărie';
			case 'usefullNumbers.animals': return 'Adăpostul de animale';
			case 'usefullNumbers.police': return 'Poliția Locală';
			case 'usefullNumbers.consumerProtection': return 'Protecția consumatorului';
			case 'usefullNumbers.childProtection': return 'Protecția copilului';
			case 'usefullNumbers.animalProtection': return 'Protecția animalelor';
			case 'usefullNumbers.environmentProtection': return 'Protecția mediului';
			case 'usefullNumbers.suceavaEnvironmentalGuard': return 'Garda de Mediu Suceava';
			case 'usefullNumbers.comunalServices': return 'Servicii Comunale';
			case 'usefullNumbers.acet': return 'ACET';
			case 'transport.title': return 'Transport';
			case 'transport.taxiTab': return 'Taxi';
			case 'transport.trainTab': return 'Trenuri';
			case 'transport.emptyTaxi': return 'Nu am putut găsi nici un taxiu!';
			case 'transport.emptyTrain': return 'Nu am putut găsi nici un tren!';
			case 'volunteering.title': return 'Voluntariat';
			case 'volunteering.webSite': return 'Pagină web';
			case 'announcements.title': return 'Anunțuri';
			case 'announcements.posted_at': return ({required Object value}) => 'postat în: ${value}';
			case 'announcements.tabLocal': return 'Locale';
			case 'announcements.emptyAnnouncements': return 'Nu am găsit nici un anunț!';
			case 'announcements.tabFurniture': return 'Imobiliare';
			case 'announcements.tabJobs': return 'Locuri de muncă';
			case 'announcements.seeDetails': return 'Vezi detalii ->';
			case 'drawer.reportProblem': return '${_root.reportProblem.title}';
			case 'drawer.localAdministration': return '${_root.localAdministration.title}';
			case 'drawer.airQuality': return '${_root.airQuality.title}';
			case 'drawer.events': return '${_root.events.title}';
			case 'drawer.transport': return '${_root.transport.title}';
			case 'drawer.volunteering': return '${_root.volunteering.title}';
			case 'drawer.announcements': return '${_root.announcements.title}';
			case 'drawer.signOut': return 'Delogare';
			case 'buttons.log_in': return 'Log in';
			case 'home.newEvents': return 'Evenimentele următoare vor apărea aici!';
			case 'formats.onlyNumbersField': return 'Acest câmp trebuie să conțină numai numere';
			case 'formats.invalidPhoneNumber': return 'Format greșit al numărului de telefon\n   \nAcceptăm următoarele:\n   \n+40213-564-864\n   \n+40213.564.864\n   \n+40213 564 864\n   \n0213-564-864\n   \n0712456789';
			case 'formats.minimum50': return 'Această căsuță trebuie să conțină mai mult de 50 de caractere!';
			case 'formats.invalidEmail': return 'Format de e-mail greșit! de ex. aaa@bb.ccc!';
			case 'formats.strongerPassword': return 'Parola este slabă. Vă rugăm să furnizați o parolă mai bună!';
			case 'formats.requiredField': return 'Acestă căsuță este obligatorie. Vă rugăm să o completați!';
			case 'formats.confirmPassword': return 'Parolele nu se potrivesc!';
			case 'locales.en': return 'Engleză';
			case 'locales.ro': return 'Română';
			default: return null;
		}
	}
}
