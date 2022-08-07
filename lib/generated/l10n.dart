// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Repository`
  String get bottomNavigationRepositoryTab {
    return Intl.message(
      'Repository',
      name: 'bottomNavigationRepositoryTab',
      desc: '',
      args: [],
    );
  }

  /// `Application`
  String get bottomNavigationApplicationTab {
    return Intl.message(
      'Application',
      name: 'bottomNavigationApplicationTab',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade`
  String get bottomNavigationUpgradeTab {
    return Intl.message(
      'Upgrade',
      name: 'bottomNavigationUpgradeTab',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get bottomNavigationSettingTab {
    return Intl.message(
      'Setting',
      name: 'bottomNavigationSettingTab',
      desc: '',
      args: [],
    );
  }

  /// `Common`
  String get settingsPageTitleCommon {
    return Intl.message(
      'Common',
      name: 'settingsPageTitleCommon',
      desc: '',
      args: [],
    );
  }

  /// `Sync`
  String get settingsPageTileSync {
    return Intl.message(
      'Sync',
      name: 'settingsPageTileSync',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsPageTileLanguage {
    return Intl.message(
      'Language',
      name: 'settingsPageTileLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get settingsPageTitleOthers {
    return Intl.message(
      'Others',
      name: 'settingsPageTitleOthers',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get settingsPageTileAuthor {
    return Intl.message(
      'Author',
      name: 'settingsPageTileAuthor',
      desc: '',
      args: [],
    );
  }

  /// `Source Code`
  String get settingsPageTileSourceCode {
    return Intl.message(
      'Source Code',
      name: 'settingsPageTileSourceCode',
      desc: '',
      args: [],
    );
  }

  /// `Bug Report`
  String get settingsPageTileBugReport {
    return Intl.message(
      'Bug Report',
      name: 'settingsPageTileBugReport',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get settingsPageTileAppVersion {
    return Intl.message(
      'App Version',
      name: 'settingsPageTileAppVersion',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get settingsPageTilePrivacy {
    return Intl.message(
      'Privacy',
      name: 'settingsPageTilePrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Please do not report problems unrelated to this application!`
  String get settingsPageTileBugReportDetail {
    return Intl.message(
      'Please do not report problems unrelated to this application!',
      name: 'settingsPageTileBugReportDetail',
      desc: '',
      args: [],
    );
  }

  /// `Credentials`
  String get settingsPageSyncCredentials {
    return Intl.message(
      'Credentials',
      name: 'settingsPageSyncCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Switch user`
  String get settingsPageSyncSwitch {
    return Intl.message(
      'Switch user',
      name: 'settingsPageSyncSwitch',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get settingsPageSyncButtonRegister {
    return Intl.message(
      'Register',
      name: 'settingsPageSyncButtonRegister',
      desc: '',
      args: [],
    );
  }

  /// `Switch`
  String get settingsPageSyncButtonSwitch {
    return Intl.message(
      'Switch',
      name: 'settingsPageSyncButtonSwitch',
      desc: '',
      args: [],
    );
  }

  /// `Sync`
  String get settingsPageSyncButtonSync {
    return Intl.message(
      'Sync',
      name: 'settingsPageSyncButtonSync',
      desc: '',
      args: [],
    );
  }

  /// `Readme`
  String get detailPageTabBarReadmeTab {
    return Intl.message(
      'Readme',
      name: 'detailPageTabBarReadmeTab',
      desc: '',
      args: [],
    );
  }

  /// `Releases`
  String get detailPageTabBarReleasesTab {
    return Intl.message(
      'Releases',
      name: 'detailPageTabBarReleasesTab',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get detailPageTabBarInformationTab {
    return Intl.message(
      'Information',
      name: 'detailPageTabBarInformationTab',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get detailPageReleaseAssets {
    return Intl.message(
      'Assets',
      name: 'detailPageReleaseAssets',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get toastCopiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'toastCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully`
  String get toastRegisterSuccess {
    return Intl.message(
      'Registered successfully',
      name: 'toastRegisterSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Switched successfully`
  String get toastSwitchSuccess {
    return Intl.message(
      'Switched successfully',
      name: 'toastSwitchSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Syncing...`
  String get toastSyncProcessing {
    return Intl.message(
      'Syncing...',
      name: 'toastSyncProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get floatButtonDialogTitle {
    return Intl.message(
      'Notice',
      name: 'floatButtonDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current user is empty`
  String get floatButtonDialogUserEmpty {
    return Intl.message(
      'Current user is empty',
      name: 'floatButtonDialogUserEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please go to the settings page to register or login`
  String get floatButtonDialogUserHint {
    return Intl.message(
      'Please go to the settings page to register or login',
      name: 'floatButtonDialogUserHint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
