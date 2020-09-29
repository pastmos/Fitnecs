// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Assets {
  internal enum Colors {
    internal static let alertBackground = ColorAsset(name: "alert-background")
    internal static let alertFormBackground = ColorAsset(name: "alert-form-background")
    internal static let alertSeparator = ColorAsset(name: "alert-separator")
    internal static let noInternetBackground = ColorAsset(name: "no-internet-background")
    internal static let buttonRetryDisabledColor = ColorAsset(name: "button-retry-disabled-color")
    internal static let codeAcceptedColor = ColorAsset(name: "code-accepted-color")
    internal static let codeErrorColor = ColorAsset(name: "code-error-color")
    internal static let codeUnselectedColor = ColorAsset(name: "code-unselected-color")
    internal static let textfieldBlueBorderColor = ColorAsset(name: "textfield-blue-border-color")
    internal static let textfieldGrayBackgroundColor = ColorAsset(name: "textfield-gray-background-color")
    internal static let textfieldGrayBorderNormalColor = ColorAsset(name: "textfield-gray-border-normal-color")
    internal static let textfieldRedBorderErrorColor = ColorAsset(name: "textfield-red-border-error-color")
    internal static let buttonTitleBlueColor = ColorAsset(name: "button-title-blue-color")
    internal static let buttonTitleLightblueColor = ColorAsset(name: "button-title-lightblue-color")
    internal static let buttonTitleMagenta = ColorAsset(name: "button-title-magenta")
    internal static let graySeparatorColor = ColorAsset(name: "gray-separator-color")
    internal static let mainBackgroundColor = ColorAsset(name: "main-background-color")
    internal static let mainBlueColor = ColorAsset(name: "main-blue-color")
    internal static let mainErrorColor = ColorAsset(name: "main-error-color")
    internal static let mainGrayColor = ColorAsset(name: "main-gray-color")
    internal static let mainRootBackground = ColorAsset(name: "main-root-background")
    internal static let mainTextColor = ColorAsset(name: "main-text-color")
    internal static let searchBackground = ColorAsset(name: "search-background")
    internal static let backgroundBlueColor = ColorAsset(name: "background-blue-color")
    internal static let cardShadowColor = ColorAsset(name: "card-shadow-color")
    internal static let alertTextColor = ColorAsset(name: "alert-text-color")
    internal static let colorProgressTitleColor = ColorAsset(name: "color-progress-title-color")
    internal static let inkBlue = ColorAsset(name: "ink-blue")
    internal static let rateSliderColor = ColorAsset(name: "rate-slider-color")
    internal static let switchControlTitle = ColorAsset(name: "switch-control-title")
    internal enum News {
      internal static let cardShadowColor = ColorAsset(name: "News/card-shadow-color")
    }
    internal enum Style {
      internal static let background1 = ColorAsset(name: "Style/Background 1")
      internal static let background = ColorAsset(name: "Style/Background")
      internal static let black = ColorAsset(name: "Style/Black")
      internal static let blue = ColorAsset(name: "Style/Blue")
      internal static let cianLight = ColorAsset(name: "Style/Cian Light")
      internal static let cian = ColorAsset(name: "Style/Cian")
      internal static let darkGray = ColorAsset(name: "Style/Dark Gray")
      internal static let dark = ColorAsset(name: "Style/Dark")
      internal static let gray3 = ColorAsset(name: "Style/Gray 3")
      internal static let lightGray = ColorAsset(name: "Style/Light Gray")
      internal static let light = ColorAsset(name: "Style/Light")
      internal static let magenta = ColorAsset(name: "Style/Magenta")
      internal static let red = ColorAsset(name: "Style/Red")
    }
    internal static let moneySwitchInactive = ColorAsset(name: "money-switch-inactive")
    internal static let multibonusBaseColor = ColorAsset(name: "multibonus-base-color")
    internal static let textBlackColor = ColorAsset(name: "text-black-color")
    internal static let textWhiteColor = ColorAsset(name: "text-white-color")
    internal static let topupPaymentSwitcherInactive = ColorAsset(name: "topup-payment-switcher-inactive")
  }
  internal enum Images {
    internal static let activityTab = ImageAsset(name: "activity-tab")
    internal static let footSteps = ImageAsset(name: "foot-steps")
    internal static let heightIcon = ImageAsset(name: "height-icon")
    internal static let weightIcon = ImageAsset(name: "weight-icon")
    internal static let geoTab = ImageAsset(name: "geo-tab")
    internal static let logo = ImageAsset(name: "logo")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
