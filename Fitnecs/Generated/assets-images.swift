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
    internal static let backgroundProgress = ColorAsset(name: "background-progress")
    internal static let blueProgress = ColorAsset(name: "blue-progress")
    internal static let darkBlue = ColorAsset(name: "dark-blue")
    internal static let lightblueProgress = ColorAsset(name: "lightblue-progress")
    internal static let purpleProgress = ColorAsset(name: "purple-progress")
    internal static let redProgress = ColorAsset(name: "red-progress")
    internal static let textGray = ColorAsset(name: "text-gray")
    internal static let alertBackground = ColorAsset(name: "alert-background")
    internal static let alertFormBackground = ColorAsset(name: "alert-form-background")
    internal static let alertSeparator = ColorAsset(name: "alert-separator")
    internal static let noInternetBackground = ColorAsset(name: "no-internet-background")
    internal static let textfieldBlueBorderColor = ColorAsset(name: "textfield-blue-border-color")
    internal static let textfieldGrayBackgroundColor = ColorAsset(name: "textfield-gray-background-color")
    internal static let textfieldGrayBorderNormalColor = ColorAsset(name: "textfield-gray-border-normal-color")
    internal static let textfieldRedBorderErrorColor = ColorAsset(name: "textfield-red-border-error-color")
    internal static let buttonTitleBlueColor = ColorAsset(name: "button-title-blue-color")
    internal static let buttonTitleLightblueColor = ColorAsset(name: "button-title-lightblue-color")
    internal static let buttonTitleMagenta = ColorAsset(name: "button-title-magenta")
    internal static let fitnecsBaseColor = ColorAsset(name: "fitnecs-base-color")
    internal static let graySeparatorColor = ColorAsset(name: "gray-separator-color")
    internal static let mainBackgroundColor = ColorAsset(name: "main-background-color")
    internal static let mainBlueColor = ColorAsset(name: "main-blue-color")
    internal static let mainErrorColor = ColorAsset(name: "main-error-color")
    internal static let mainGrayColor = ColorAsset(name: "main-gray-color")
    internal static let mainRootBackground = ColorAsset(name: "main-root-background")
    internal static let mainTextColor = ColorAsset(name: "main-text-color")
    internal static let searchBackground = ColorAsset(name: "search-background")
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
  }
  internal enum Images {
    internal static let achievementTab = ImageAsset(name: "achievement-tab")
    internal static let awardActive = ImageAsset(name: "award-active")
    internal static let awardInactive = ImageAsset(name: "award-inactive")
    internal static let activityTab = ImageAsset(name: "activity-tab")
    internal static let footSteps = ImageAsset(name: "foot-steps")
    internal static let heightIcon = ImageAsset(name: "height-icon")
    internal static let weightIcon = ImageAsset(name: "weight-icon")
    internal static let authBackground = ImageAsset(name: "auth-background")
    internal static let backArrow = ImageAsset(name: "back-arrow")
    internal static let blueButton = ImageAsset(name: "blue-button")
    internal static let cianButton = ImageAsset(name: "cian-button")
    internal static let underConstruction = ImageAsset(name: "under-construction")
    internal static let geoTab = ImageAsset(name: "geo-tab")
    internal static let logo = ImageAsset(name: "logo")
    internal static let aboutMenuItem = ImageAsset(name: "about-menu-item")
    internal static let logoutMenuItem = ImageAsset(name: "logout-menu-item")
    internal static let newsMenuItem = ImageAsset(name: "news-menu-item")
    internal static let physicalMenuItem = ImageAsset(name: "physical-menu-item")
    internal static let profileTab = ImageAsset(name: "profile-tab")
    internal static let settingsMenuItem = ImageAsset(name: "settings-menu-item")
    internal static let supportMenuItem = ImageAsset(name: "support-menu-item")
    internal static let userAvatarTest = ImageAsset(name: "user-avatar-test")
    internal static let statisticsTab = ImageAsset(name: "statistics-tab")
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
