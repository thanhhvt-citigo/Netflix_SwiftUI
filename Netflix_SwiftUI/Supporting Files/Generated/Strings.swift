// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Always have something to watch offline
  internal static let onboardingDownloadMessage = L10n.tr("Localizable", "onboarding_download_message")
  /// 3,2,1...Download!
  internal static let onboardingDownloadTitle = L10n.tr("Localizable", "onboarding_download_title")
  /// Help
  internal static let onboardingNavigationHelp = L10n.tr("Localizable", "onboarding_navigation_help")
  /// Privacy
  internal static let onboardingNavigationPrivacy = L10n.tr("Localizable", "onboarding_navigation_privacy")
  /// Cancel any time
  internal static let onboardingNoPeskyContractsMessage = L10n.tr("Localizable", "onboarding_no_pesky_contracts_message")
  /// No pesky contracts
  internal static let onboardingNoPeskyContractsTitle = L10n.tr("Localizable", "onboarding_no_pesky_contracts_title")
  /// Stream on your phone, table, laptop, and TV without paying more.
  internal static let onboardingWatchOnAnyDeviceMessage = L10n.tr("Localizable", "onboarding_watch_on_any_device_message")
  /// Watch on any device
  internal static let onboardingWatchOnAnyDeviceTitle = L10n.tr("Localizable", "onboarding_watch_on_any_device_title")
  /// Sign in
  internal static let signInButton = L10n.tr("Localizable", "sign_in_button")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
