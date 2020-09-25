// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum Roboto {
    internal static let bold = FontConvertible(name: "Roboto-Bold", family: "Roboto", path: "Roboto-Bold.ttf")
    internal static let medium = FontConvertible(name: "Roboto-Medium", family: "Roboto", path: "Roboto-Medium.ttf")
    internal static let regular = FontConvertible(name: "Roboto-Regular", family: "Roboto", path: "Roboto-Regular.ttf")
    internal static let all: [FontConvertible] = [bold, medium, regular]
  }
  internal enum SFProDisplay {
    internal static let black = FontConvertible(name: "SFProDisplay-Black", family: "SF Pro Display", path: "SF-Pro-Display-Black.otf")
    internal static let bold = FontConvertible(name: "SFProDisplay-Bold", family: "SF Pro Display", path: "SF-Pro-Display-Bold.otf")
    internal static let heavy = FontConvertible(name: "SFProDisplay-Heavy", family: "SF Pro Display", path: "SF-Pro-Display-Heavy.otf")
    internal static let light = FontConvertible(name: "SFProDisplay-Light", family: "SF Pro Display", path: "SF-Pro-Display-Light.otf")
    internal static let regular = FontConvertible(name: "SFProDisplay-Regular", family: "SF Pro Display", path: "SF-Pro-Display-Regular.otf")
    internal static let semibold = FontConvertible(name: "SFProDisplay-Semibold", family: "SF Pro Display", path: "SF-Pro-Display-Semibold.otf")
    internal static let thin = FontConvertible(name: "SFProDisplay-Thin", family: "SF Pro Display", path: "SF-Pro-Display-Thin.otf")
    internal static let ultralight = FontConvertible(name: "SFProDisplay-Ultralight", family: "SF Pro Display", path: "SF-Pro-Display-Ultralight.otf")
    internal static let all: [FontConvertible] = [black, bold, heavy, light, regular, semibold, thin, ultralight]
  }
  internal enum SFProText {
    internal static let bold = FontConvertible(name: "SFProText-Bold", family: "SF Pro Text", path: "SF-Pro-Text-Bold.otf")
    internal static let heavy = FontConvertible(name: "SFProText-Heavy", family: "SF Pro Text", path: "SF-Pro-Text-Heavy.otf")
    internal static let regular = FontConvertible(name: "SFProText-Regular", family: "SF Pro Text", path: "SF-Pro-Text-Regular.otf")
    internal static let semibold = FontConvertible(name: "SFProText-Semibold", family: "SF Pro Text", path: "SF-Pro-Text-Semibold.otf")
    internal static let all: [FontConvertible] = [bold, heavy, regular, semibold]
  }
  internal enum VTBGroup {
    internal static let bold = FontConvertible(name: "VTBGroup-Bold", family: "VTB Group", path: "VTBBold.otf")
    internal static let book = FontConvertible(name: "VTBGroup-Book", family: "VTB Group", path: "VTBBook.ttf")
    internal static let demiBold = FontConvertible(name: "VTBGroup-DemiBold", family: "VTB Group", path: "VTBDemiBold.ttf")
    internal static let all: [FontConvertible] = [bold, book, demiBold]
  }
  internal enum VTBGroupCond {
    internal static let bold = FontConvertible(name: "VTBGroupCond-Bold", family: "VTB Group Cond", path: "VTBCondBold.ttf")
    internal static let demiBold = FontConvertible(name: "VTBGroupCond-DemiBold", family: "VTB Group Cond", path: "VTBCondDemiBold.ttf")
    internal static let all: [FontConvertible] = [bold, demiBold]
  }
  internal static let allCustomFonts: [FontConvertible] = [Roboto.all, SFProDisplay.all, SFProText.all, VTBGroup.all, VTBGroupCond.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(OSX)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
