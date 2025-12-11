import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'CONTENTS'**
  String get helloWorld;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @goals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get goals;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get tips;

  /// No description provided for @did.
  ///
  /// In en, this message translates to:
  /// **'Did you know that...'**
  String get did;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'INFORMATION'**
  String get info;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get time;

  /// No description provided for @bibliografia.
  ///
  /// In en, this message translates to:
  /// **'Bibliography'**
  String get bibliografia;

  /// No description provided for @contato.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contato;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'BovCria provides support for the evaluation of results from cow-calf systems\nNow available for Android! Download from: https://play.google.com/store/apps/details?id=bovcria.ddpaseapi.rs.gov.br.bovcria'**
  String get share;

  /// No description provided for @share2.
  ///
  /// In en, this message translates to:
  /// **'Share APP'**
  String get share2;

  /// No description provided for @metas.
  ///
  /// In en, this message translates to:
  /// **'GOALS FOR HERD'**
  String get metas;

  /// No description provided for @metasgerais.
  ///
  /// In en, this message translates to:
  /// **'General Goals\n'**
  String get metasgerais;

  /// No description provided for @interpartos.
  ///
  /// In en, this message translates to:
  /// **'• Births interval of 365 days;\n• Slaughter of 5% of no pregnant cows at the end of the breeding season;\n• Heifers calving at 24 months of age;\n• Compact breeding season with 80% of calving occurring within 42 days;\n•  Proximity of the calving season with the availability of pastures;\n• Replacement rate from 16 to 18%;\n• Females staybility.'**
  String get interpartos;

  /// No description provided for @teste.
  ///
  /// In en, this message translates to:
  /// **'Teste'**
  String get teste;

  /// No description provided for @bemvindo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to BovCria!\n'**
  String get bemvindo;

  /// No description provided for @objetivo.
  ///
  /// In en, this message translates to:
  /// **'The purpose of BOVCRIA is to provide tools for farmers, professionals and students of agricultural sciences to quickly assess the results of cow-calf systems.\n'**
  String get objetivo;

  /// No description provided for @calculo.
  ///
  /// In en, this message translates to:
  /// **'In the app it is possible to calculate conception rate, calving rate, weaning rate of females, among others.\n\n'**
  String get calculo;

  /// No description provided for @auxilio.
  ///
  /// In en, this message translates to:
  /// **'It helps in the adoption of good management practices to achieve better reproductive rates for cow-calf systems.\n'**
  String get auxilio;

  /// No description provided for @utilize.
  ///
  /// In en, this message translates to:
  /// **'Use the menu below to navigate the app!'**
  String get utilize;

  /// No description provided for @taxas.
  ///
  /// In en, this message translates to:
  /// **'\nRATE\n'**
  String get taxas;

  /// No description provided for @idade.
  ///
  /// In en, this message translates to:
  /// **'Age of first calving'**
  String get idade;

  /// No description provided for @motalidade.
  ///
  /// In en, this message translates to:
  /// **'Mortality rates'**
  String get motalidade;

  /// No description provided for @intervalo.
  ///
  /// In en, this message translates to:
  /// **'Calving interval'**
  String get intervalo;

  /// No description provided for @concepcao.
  ///
  /// In en, this message translates to:
  /// **'Conception rate'**
  String get concepcao;

  /// No description provided for @paricao.
  ///
  /// In en, this message translates to:
  /// **'Calving rate'**
  String get paricao;

  /// No description provided for @desmame.
  ///
  /// In en, this message translates to:
  /// **'Weaning rates'**
  String get desmame;

  /// No description provided for @producao.
  ///
  /// In en, this message translates to:
  /// **'Production rates'**
  String get producao;

  /// No description provided for @voltar.
  ///
  /// In en, this message translates to:
  /// **'Come back'**
  String get voltar;

  /// No description provided for @manejo.
  ///
  /// In en, this message translates to:
  /// **'\nMANAGEMENT TIPS\n'**
  String get manejo;

  /// No description provided for @femea.
  ///
  /// In en, this message translates to:
  /// **'Females in general'**
  String get femea;

  /// No description provided for @novilha.
  ///
  /// In en, this message translates to:
  /// **'Heifers'**
  String get novilha;

  /// No description provided for @acasalamento.
  ///
  /// In en, this message translates to:
  /// **'Breeding season'**
  String get acasalamento;

  /// No description provided for @reprodutores.
  ///
  /// In en, this message translates to:
  /// **'BULLS  Management'**
  String get reprodutores;

  /// No description provided for @estacao.
  ///
  /// In en, this message translates to:
  /// **'Calving Season'**
  String get estacao;

  /// No description provided for @metasespecificas.
  ///
  /// In en, this message translates to:
  /// **'Specific Goals\n'**
  String get metasespecificas;

  /// No description provided for @metasIndicesRepro.
  ///
  /// In en, this message translates to:
  /// **'Targets for reproductive indices according to animal category'**
  String get metasIndicesRepro;

  /// No description provided for @indicesGeraisRebCria.
  ///
  /// In en, this message translates to:
  /// **'General Breeding Herd Indices'**
  String get indicesGeraisRebCria;

  /// No description provided for @especifProdBovCorte.
  ///
  /// In en, this message translates to:
  /// **'Production and market specifications for beef cattle'**
  String get especifProdBovCorte;

  /// No description provided for @vocesabia.
  ///
  /// In en, this message translates to:
  /// **'\nDid you know that...\n'**
  String get vocesabia;

  /// No description provided for @fontesVocesabia.
  ///
  /// In en, this message translates to:
  /// **'Source: Greenwood, Clayton, and Bell. doi:10.2527/af.2017-0127'**
  String get fontesVocesabia;

  /// No description provided for @fatores.
  ///
  /// In en, this message translates to:
  /// **'• Among the factors that explain the variation in the mother\'s weight at birth, the main ones are nutrition during the gestational period (50%) and the mother\'s age (17%);\n • The main factors that influence variations in birth weight of calves are: mother\'s birth weight (26%), father\'s race (11%), calf\'s sex (5%); and, not considering the mother\'s weight at birth, 20% refers to maternal nutrition during pregnancy, 8% to the father\'s race, 6% to the mother\'s age and 4% to the calf\'s sex;\n • The main factors influencing changes in the baby\'s weaning weight are: mother\'s nutrition during lactation (41%), mother\'s weight at birth (14%), baby\'s age at weaning (6%), sex (5%) and birth weight (3%);\n • Among the factors influencing weight of the yearling animals, the following stand out: weaning weight (48%), birth weight (13%), sex (9%) and mother\'s age (2%).\n'**
  String get fatores;

  /// No description provided for @inicio.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get inicio;

  /// No description provided for @desenvolvimento.
  ///
  /// In en, this message translates to:
  /// **'Development'**
  String get desenvolvimento;

  /// No description provided for @coordenacao.
  ///
  /// In en, this message translates to:
  /// **'Coordinators'**
  String get coordenacao;

  /// No description provided for @tabelasmetas1.
  ///
  /// In en, this message translates to:
  /// **'Table 1- Targets for reproductive indices according to animal category.'**
  String get tabelasmetas1;

  /// No description provided for @categoriataxas.
  ///
  /// In en, this message translates to:
  /// **'Category/Rate'**
  String get categoriataxas;

  /// No description provided for @novilhameses.
  ///
  /// In en, this message translates to:
  /// **'Heifer 13-24 months'**
  String get novilhameses;

  /// No description provided for @novilhameses1.
  ///
  /// In en, this message translates to:
  /// **'Heifer 25-36 months'**
  String get novilhameses1;

  /// No description provided for @vacamaior.
  ///
  /// In en, this message translates to:
  /// **'Cow > 36 months'**
  String get vacamaior;

  /// No description provided for @taxaconcept.
  ///
  /// In en, this message translates to:
  /// **'Conception Rate'**
  String get taxaconcept;

  /// No description provided for @taxaParto.
  ///
  /// In en, this message translates to:
  /// **'Calving  Rate'**
  String get taxaParto;

  /// No description provided for @taxaDesmame.
  ///
  /// In en, this message translates to:
  /// **'Weaning Rate'**
  String get taxaDesmame;

  /// No description provided for @relacaoVacaBezerro.
  ///
  /// In en, this message translates to:
  /// **'Relationship Cow/Calf'**
  String get relacaoVacaBezerro;

  /// No description provided for @metasRebanho.
  ///
  /// In en, this message translates to:
  /// **'GOALS FOR HERD'**
  String get metasRebanho;

  /// No description provided for @indicesGeraisRebanho.
  ///
  /// In en, this message translates to:
  /// **'Table 2 - General cow-calf Systems Indices'**
  String get indicesGeraisRebanho;

  /// No description provided for @caractTaxas.
  ///
  /// In en, this message translates to:
  /// **'Features/Rates'**
  String get caractTaxas;

  /// No description provided for @satisfatorio.
  ///
  /// In en, this message translates to:
  /// **'Satisfactory'**
  String get satisfatorio;

  /// No description provided for @alerta.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get alerta;

  /// No description provided for @idadePrimeiroParto.
  ///
  /// In en, this message translates to:
  /// **'Age at first calving'**
  String get idadePrimeiroParto;

  /// No description provided for @vinteQuatroMeses.
  ///
  /// In en, this message translates to:
  /// **'24 months'**
  String get vinteQuatroMeses;

  /// No description provided for @vinteCincoTrintaSeis.
  ///
  /// In en, this message translates to:
  /// **'25-36 months'**
  String get vinteCincoTrintaSeis;

  /// No description provided for @acimaDeTrintaSeis.
  ///
  /// In en, this message translates to:
  /// **'over 36 months'**
  String get acimaDeTrintaSeis;

  /// No description provided for @trezentosSessentaCincoDias.
  ///
  /// In en, this message translates to:
  /// **'365 days'**
  String get trezentosSessentaCincoDias;

  /// No description provided for @trezentosSessCincoTrezNovCinco.
  ///
  /// In en, this message translates to:
  /// **'365 a 395 days'**
  String get trezentosSessCincoTrezNovCinco;

  /// No description provided for @acimaTrezSessCinco.
  ///
  /// In en, this message translates to:
  /// **'Over de 395 days'**
  String get acimaTrezSessCinco;

  /// No description provided for @taxaAnualMortGeral.
  ///
  /// In en, this message translates to:
  /// **'Annual General Mortality Rate'**
  String get taxaAnualMortGeral;

  /// No description provided for @ateOito.
  ///
  /// In en, this message translates to:
  /// **'Up to 8%'**
  String get ateOito;

  /// No description provided for @acimaOito.
  ///
  /// In en, this message translates to:
  /// **'Above 8%'**
  String get acimaOito;

  /// No description provided for @taxaAnualMorteBezerros.
  ///
  /// In en, this message translates to:
  /// **'Annual mortality rate of calves until weaning'**
  String get taxaAnualMorteBezerros;

  /// No description provided for @acimaDois.
  ///
  /// In en, this message translates to:
  /// **'Above 2%'**
  String get acimaDois;

  /// No description provided for @acimaCinco.
  ///
  /// In en, this message translates to:
  /// **'Above 5%'**
  String get acimaCinco;

  /// No description provided for @distocias.
  ///
  /// In en, this message translates to:
  /// **'Annual dystocia rate'**
  String get distocias;

  /// No description provided for @tabela3.
  ///
  /// In en, this message translates to:
  /// **'\nTable 3. Production and market specifications for beef cattle.'**
  String get tabela3;

  /// No description provided for @caractReprod.
  ///
  /// In en, this message translates to:
  /// **'Reproductive Characteristics'**
  String get caractReprod;

  /// No description provided for @alvoIndustrial.
  ///
  /// In en, this message translates to:
  /// **'Industrial Target'**
  String get alvoIndustrial;

  /// No description provided for @br.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get br;

  /// No description provided for @novilhasIdade.
  ///
  /// In en, this message translates to:
  /// **'Heifers\n Age'**
  String get novilhasIdade;

  /// No description provided for @mediaQuatorze.
  ///
  /// In en, this message translates to:
  /// **'Average: 14 months'**
  String get mediaQuatorze;

  /// No description provided for @mediaDezoito.
  ///
  /// In en, this message translates to:
  /// **'Average: 18 months'**
  String get mediaDezoito;

  /// No description provided for @idadePub.
  ///
  /// In en, this message translates to:
  /// **'Age at puberty (months)'**
  String get idadePub;

  /// No description provided for @pesoPub.
  ///
  /// In en, this message translates to:
  /// **'Weight at puberty (kg)'**
  String get pesoPub;

  /// No description provided for @escoreTratoRepro.
  ///
  /// In en, this message translates to:
  /// **'Reproductive tract score (1-5) early mating season'**
  String get escoreTratoRepro;

  /// No description provided for @machosPeriodoEsc.
  ///
  /// In en, this message translates to:
  /// **'Males \nScrotal perimeter (cm)'**
  String get machosPeriodoEsc;

  /// No description provided for @pesoNascBezerro.
  ///
  /// In en, this message translates to:
  /// **'Calf birth weight (kg)'**
  String get pesoNascBezerro;

  /// No description provided for @filhosVacas.
  ///
  /// In en, this message translates to:
  /// **'Calf of cows'**
  String get filhosVacas;

  /// No description provided for @bezerroNovilhas.
  ///
  /// In en, this message translates to:
  /// **'Calf of heifers'**
  String get bezerroNovilhas;

  /// No description provided for @condCorpParto.
  ///
  /// In en, this message translates to:
  /// **'Body condition (1-9) at calving'**
  String get condCorpParto;

  /// No description provided for @intPosParto.
  ///
  /// In en, this message translates to:
  /// **'Postpartum interval (days)'**
  String get intPosParto;

  /// No description provided for @duracaoEstacao.
  ///
  /// In en, this message translates to:
  /// **'Length of breeding season'**
  String get duracaoEstacao;

  /// No description provided for @longVaca.
  ///
  /// In en, this message translates to:
  /// **'Cow staybility(years)'**
  String get longVaca;

  /// No description provided for @dicasManejo.
  ///
  /// In en, this message translates to:
  /// **'Management tips'**
  String get dicasManejo;

  /// No description provided for @femeasGeral.
  ///
  /// In en, this message translates to:
  /// **' Females in general'**
  String get femeasGeral;

  /// No description provided for @manejoReprod.
  ///
  /// In en, this message translates to:
  /// **'Breeder Management'**
  String get manejoReprod;

  /// No description provided for @facaPressao.
  ///
  /// In en, this message translates to:
  /// **'• Apply selection pressure for fertility by discarding heifers and cows that do not conceive or calve at the end of the calving season;\n\n• Apply reproductive and ecto and endo parasitic vaccines before the mating season; avoid managing them as much as possible for up to one month after conception to reduce pregnancy losses;\n\n• Provide quality mineral salt throughout the year for the entire herd;\n\n• For cows with calf at the foot to have greater chances of repeat calving, they must calve with a body condition above 3 (1-5).\n'**
  String get facaPressao;

  /// No description provided for @obterFemeasPrec.
  ///
  /// In en, this message translates to:
  /// **'\n• To obtain precocious females, start using breeders and sires genetically evaluated for precocity, pay attention to the birth weight of the sires;\n\n• Plan the feeding of the mother, a good protein and energy nutrition in the middle third of pregnancy will reflect on the reproductive performance of her progeny;\n\n• Higher weights at weaning of the heifers, values ​​above 170Kg, will imply the need for smaller weight gains after weaning until mating;\n\n• The heifer must reach at least 55% of the adult weight of the cows in the herd to start mating;\n\n• Females, with a reproductive tract score above four (4) and body condition above three, are more likely to conceive in their first mating season;\n\n• Start mating heifers at least a month before the other categories, females giving birth early are more likely to repeat offspring.\n'**
  String get obterFemeasPrec;

  /// No description provided for @estacaoAcasalamento.
  ///
  /// In en, this message translates to:
  /// **'\nBREEDING SEASON\n'**
  String get estacaoAcasalamento;

  /// No description provided for @estabelecaEstacao.
  ///
  /// In en, this message translates to:
  /// **'\n• Establish the mating season and, consequently, calving according to the availability of food and the welfare of the animals;\n\n• Start the mating season when 4% of females show signs of heat per day;\n\n• In a 90-day mating season, in the first month, 60% of singles come into heat, 30% of heifers and cows with calf, less than 10%. These tend to concentrate their heat at the end of the season. This information is important for distributing the breeders throughout the season.\n'**
  String get estabelecaEstacao;

  /// No description provided for @utilizeRepMerito.
  ///
  /// In en, this message translates to:
  /// **'\n• Use sires with genetic merit, either by artificial insemination or for transfer, in the latter case, they must pass the andrological exam and the libido test ;\n\n• Use sires of the same age and, preferably, the same management group in a ratio of 1:25, in the first 45 days of the mating season, this ratio may increase to 1:50 by the end; If the paddocks are of large size, use 6% of breeders;\n\n• Review the performance of breeders in the field: juveniles, daily, adults, two to three times a week; You can also identify the dominant individuals in the herd; \n\n• Assess body condition, especially young and old bull.\n\n• Always keep a reserve of 10 to 15% of suitable bulls on the farm, with a view to possible replacements;\n\n• Bulls from other farms need an adaptation period of at least 45 days.\n'**
  String get utilizeRepMerito;

  /// No description provided for @reservePotreiroMaternidade.
  ///
  /// In en, this message translates to:
  /// **'\n• Reserve a maternity paddock that allows greater control of the animals, with a good supply of forage, water and shade;\n\n• Try to concentrate calving on the first 42 days of the season;\n\n• Check if the dam was interested and caring for the newborn calf mainly among first-calf heifers;\n\n• Make sure the calf has suckled colostrum;\n\n• Dip the calf\'s navel with antiseptic solutions;\n\n• Record all occurrences related to calving such as: type of calving (normal or assisted), occurrence of  retained placenta, stillbirths, deformities, among others) and, if possible, weigh the calf and its dam within 24 hours of birth;\n\n• Start dosing with endoparasitic from 3 months of age and repeat every 2 months, remember that these animals need strategic deverminations up to 2 years of age at least.\n'**
  String get reservePotreiroMaternidade;

  /// No description provided for @erroInformeValor.
  ///
  /// In en, this message translates to:
  /// **'ERROR!!Enter a value greater than zero (0) and/or use a period(.) instead of a comma(,).'**
  String get erroInformeValor;

  /// No description provided for @taxaGeralMortAnualRabanho.
  ///
  /// In en, this message translates to:
  /// **'General annual herd mortality rate'**
  String get taxaGeralMortAnualRabanho;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'ERROR!:'**
  String get error;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
