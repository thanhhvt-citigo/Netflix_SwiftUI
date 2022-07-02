// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Plist Files

// swiftlint:disable identifier_name line_length type_body_length
internal enum Router {
  private static let _document = PlistDocument(path: "Router.plist")

  internal static let baseURL: String = _document["BaseURL"]
  internal static let imageBaseURL: String = _document["ImageBaseURL"]
  internal static let youtubeImageURLFormat: String = _document["YoutubeImageURLFormat"]
  internal static let account: String = _document["account"]
  internal static let airingToday: String = _document["airingToday"]
  internal static let authentication: String = _document["authentication"]
  internal static let credits: String = _document["credits"]
  internal static let discover: String = _document["discover"]
  internal static let favorite: String = _document["favorite"]
  internal static let genre: String = _document["genre"]
  internal static let helpURL: String = _document["helpURL"]
  internal static let latest: String = _document["latest"]
  internal static let list: String = _document["list"]
  internal static let movie: String = _document["movie"]
  internal static let movies: String = _document["movies"]
  internal static let new: String = _document["new"]
  internal static let nowPlaying: String = _document["nowPlaying"]
  internal static let onTheAir: String = _document["onTheAir"]
  internal static let popular: String = _document["popular"]
  internal static let privacyURL: String = _document["privacyURL"]
  internal static let recommendations: String = _document["recommendations"]
  internal static let session: String = _document["session"]
  internal static let similar: String = _document["similar"]
  internal static let token: String = _document["token"]
  internal static let topRated: String = _document["top_rated"]
  internal static let trending: String = _document["trending"]
  internal static let tv: String = _document["tv"]
  internal static let validateWithLogin: String = _document["validateWithLogin"]
  internal static let version3: String = _document["version3"]
  internal static let version4: String = _document["version4"]
  internal static let videos: String = _document["videos"]
  internal static let watchList: String = _document["watchList"]
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

private func arrayFromPlist<T>(at path: String) -> [T] {
  guard let url = BundleToken.bundle.url(forResource: path, withExtension: nil),
    let data = NSArray(contentsOf: url) as? [T] else {
    fatalError("Unable to load PLIST at path: \(path)")
  }
  return data
}

private struct PlistDocument {
  let data: [String: Any]

  init(path: String) {
    guard let url = BundleToken.bundle.url(forResource: path, withExtension: nil),
      let data = NSDictionary(contentsOf: url) as? [String: Any] else {
        fatalError("Unable to load PLIST at path: \(path)")
    }
    self.data = data
  }

  subscript<T>(key: String) -> T {
    guard let result = data[key] as? T else {
      fatalError("Property '\(key)' is not of type \(T.self)")
    }
    return result
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
