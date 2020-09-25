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
    internal static let alertButtonHighlighted = ImageAsset(name: "alert-button-highlighted")
    internal static let alertButtonNormal = ImageAsset(name: "alert-button-normal")
    internal static let cancelButtonHighlighted = ImageAsset(name: "cancel-button-highlighted")
    internal static let checkboxCheckedNormal = ImageAsset(name: "checkbox-checked-normal")
    internal static let checkboxUncheckedNormal = ImageAsset(name: "checkbox-unchecked-normal")
    internal static let deleteButtonHighlighted = ImageAsset(name: "delete-button-highlighted")
    internal static let deleteButtonNormal = ImageAsset(name: "delete-button-normal")
    internal static let faceidButtonHighlighted = ImageAsset(name: "faceid-button-highlighted")
    internal static let faceidButtonNormal = ImageAsset(name: "faceid-button-normal")
    internal static let faceidErrorIcon = ImageAsset(name: "faceid-error-icon")
    internal static let faceidNormalIcon = ImageAsset(name: "faceid-normal-icon")
    internal static let hidePasswordButtonNormal = ImageAsset(name: "hide-password-button-normal")
    internal static let numberButtonHighlighted = ImageAsset(name: "number-button-highlighted")
    internal static let numberButtonNormal = ImageAsset(name: "number-button-normal")
    internal static let showPasswordButtonNormal = ImageAsset(name: "show-password-button-normal")
    internal static let touchidButtonHighlighted = ImageAsset(name: "touchid-button-highlighted")
    internal static let touchidButtonNormal = ImageAsset(name: "touchid-button-normal")
    internal enum BankCard {
      internal static let delete = ImageAsset(name: "BankCard/Delete")
      internal static let editIcon = ImageAsset(name: "BankCard/EditIcon")
      internal static let mastercard = ImageAsset(name: "BankCard/mastercard")
      internal static let mir = ImageAsset(name: "BankCard/mir")
      internal static let newCardBg = ImageAsset(name: "BankCard/new_card_bg")
      internal static let scan = ImageAsset(name: "BankCard/scan")
      internal static let topupFailed = ImageAsset(name: "BankCard/topup_failed")
      internal static let topupSuccess = ImageAsset(name: "BankCard/topup_success")
      internal static let visa = ImageAsset(name: "BankCard/visa")
    }
    internal static let avatar = ImageAsset(name: "avatar")
    internal static let chatPhotoButtonHighlighted = ImageAsset(name: "chat-photo-button-highlighted")
    internal static let chatPhotoButtonNormal = ImageAsset(name: "chat-photo-button-normal")
    internal static let chatSendButtonDisabled = ImageAsset(name: "chat-send-button-disabled")
    internal static let chatSendButtonHighlighted = ImageAsset(name: "chat-send-button-highlighted")
    internal static let chatSendButtonNormal = ImageAsset(name: "chat-send-button-normal")
    internal static let chatStarEmpty = ImageAsset(name: "chat-star-empty")
    internal static let chatStarSelected = ImageAsset(name: "chat-star-selected")
    internal static let backButtonHighlighted = ImageAsset(name: "back-button-highlighted")
    internal static let backButtonNormal = ImageAsset(name: "back-button-normal")
    internal static let blueButtonDisabled = ImageAsset(name: "blue-button-disabled")
    internal static let blueButtonHighlighted = ImageAsset(name: "blue-button-highlighted")
    internal static let blueButtonNormal = ImageAsset(name: "blue-button-normal")
    internal static let cianButtonNormal = ImageAsset(name: "cian-button-normal")
    internal static let grayButtonHighlighted = ImageAsset(name: "gray-button-highlighted")
    internal static let grayButtonNormal = ImageAsset(name: "gray-button-normal")
    internal static let warningIcon = ImageAsset(name: "warning-icon")
    internal static let launchLogoImage = ImageAsset(name: "launch-logo-image")
    internal static let addBlueButtonNormal = ImageAsset(name: "add-blue-button-normal")
    internal static let addWhiteButtonNormal = ImageAsset(name: "add-white-button-normal")
    internal static let arrowDownButtonNormal = ImageAsset(name: "arrow-down-button-normal")
    internal static let arrowRight = ImageAsset(name: "arrow-right")
    internal static let arrowUpButtonNormal = ImageAsset(name: "arrow-up-button-normal")
    internal static let downArrowBlue = ImageAsset(name: "down-arrow-blue")
    internal static let facebookButtonNormal = ImageAsset(name: "facebook-button-normal")
    internal static let instagramButtonNormal = ImageAsset(name: "instagram-button-normal")
    internal static let mainChatIcon = ImageAsset(name: "main-chat-icon")
    internal static let mainContactsIcon = ImageAsset(name: "main-contacts-icon")
    internal static let mainEditServicesIcon = ImageAsset(name: "main-edit-services-icon")
    internal static let mainFaqIcon = ImageAsset(name: "main-faq-icon")
    internal static let mainHistoryIcon = ImageAsset(name: "main-history-icon")
    internal static let mainMapIcon = ImageAsset(name: "main-map-icon")
    internal static let mainMultibonusBackground = ImageAsset(name: "main-multibonus-background")
    internal static let mainMultibonusIcon = ImageAsset(name: "main-multibonus-icon")
    internal static let mainMulticatdIcon = ImageAsset(name: "main-multicatd-icon")
    internal static let mainRoumingIcon = ImageAsset(name: "main-rouming-icon")
    internal static let mainSettingsIcon = ImageAsset(name: "main-settings-icon")
    internal static let payButtonNormal = ImageAsset(name: "pay-button-normal")
    internal static let progressAquamarine = ImageAsset(name: "progress-aquamarine")
    internal static let progressAzure = ImageAsset(name: "progress-azure")
    internal static let progressBarMask = ImageAsset(name: "progress-bar-mask")
    internal static let progressBlack = ImageAsset(name: "progress-black")
    internal static let progressEmpty = ImageAsset(name: "progress-empty")
    internal static let progressMalibu = ImageAsset(name: "progress-malibu")
    internal static let progressOutcome = ImageAsset(name: "progress-outcome")
    internal static let progressPlainAquamarine = ImageAsset(name: "progress-plain-aquamarine")
    internal static let progressPlainAzure = ImageAsset(name: "progress-plain-azure")
    internal static let progressPlainMalibu = ImageAsset(name: "progress-plain-malibu")
    internal static let sliderPoint = ImageAsset(name: "slider-point")
    internal static let smileHappy = ImageAsset(name: "smile-happy")
    internal static let smileNormal = ImageAsset(name: "smile-normal")
    internal static let smileSad = ImageAsset(name: "smile-sad")
    internal static let twitterButtonNormal = ImageAsset(name: "twitter-button-normal")
    internal static let vkButtonNormal = ImageAsset(name: "vk-button-normal")
    internal static let closeButtonHighlighted = ImageAsset(name: "close-button-highlighted")
    internal static let closeButtonNormal = ImageAsset(name: "close-button-normal")
    internal static let network2gButtonSelected = ImageAsset(name: "network-2g-button-selected")
    internal static let network3gButtonSelected = ImageAsset(name: "network-3g-button-selected")
    internal static let network4gButtonSelected = ImageAsset(name: "network-4g-button-selected")
    internal static let networkButtonHighlighted = ImageAsset(name: "network-button-highlighted")
    internal static let networkButtonNormal = ImageAsset(name: "network-button-normal")
    internal static let dotImageNormal = ImageAsset(name: "dot-image-normal")
    internal static let dotImageSelected = ImageAsset(name: "dot-image-selected")
    internal static let onboardingFinalImage = ImageAsset(name: "onboarding-final-image")
    internal static let onboardingFirstImage = ImageAsset(name: "onboarding-first-image")
    internal static let onboardingFourthImage = ImageAsset(name: "onboarding-fourth-image")
    internal static let onboardingOrderButton = ImageAsset(name: "onboarding-order-button")
    internal static let onboardingSecondImage = ImageAsset(name: "onboarding-second-image")
    internal static let onboardingThirdImage = ImageAsset(name: "onboarding-third-image")
    internal static let countriesGradient = ImageAsset(name: "countries-gradient")
    internal static let roamingPlus = ImageAsset(name: "roaming-plus")
    internal static let roamingTripBanner = ImageAsset(name: "roaming-trip-banner")
    internal static let deliveryOkIcon = ImageAsset(name: "delivery-ok-icon")
    internal static let sadFace = ImageAsset(name: "sad-face")
    internal static let vtbSimCard = ImageAsset(name: "vtb-sim-card")
    internal static let arrowDownWhite = ImageAsset(name: "arrow-down-white")
    internal static let bottomGradient = ImageAsset(name: "bottom-gradient")
    internal static let busIcon = ImageAsset(name: "bus-icon")
    internal static let fbIcon = ImageAsset(name: "fb-icon")
    internal static let infoButtonNormal = ImageAsset(name: "info-button-normal")
    internal static let infoQuestionButtonNormal = ImageAsset(name: "info-question-button-normal")
    internal static let instagramIcon = ImageAsset(name: "instagram-icon")
    internal static let mapsIcon = ImageAsset(name: "maps-icon")
    internal static let minusShapeButtonDisabled = ImageAsset(name: "minus-shape-button-disabled")
    internal static let minusShapeButtonHighlighted = ImageAsset(name: "minus-shape-button-highlighted")
    internal static let minusShapeButtonNormal = ImageAsset(name: "minus-shape-button-normal")
    internal static let musicIcon = ImageAsset(name: "music-icon")
    internal static let navigatorIcon = ImageAsset(name: "navigator-icon")
    internal static let okIcon = ImageAsset(name: "ok-icon")
    internal static let plusShapeButtonDisabled = ImageAsset(name: "plus-shape-button-disabled")
    internal static let plusShapeButtonHighlighted = ImageAsset(name: "plus-shape-button-highlighted")
    internal static let plusShapeButtonNormal = ImageAsset(name: "plus-shape-button-normal")
    internal static let progressEmptyButtonHighlighted = ImageAsset(name: "progress-empty-button-highlighted")
    internal static let progressEmptyButtonNormal = ImageAsset(name: "progress-empty-button-normal")
    internal static let searchButtonClearNormal = ImageAsset(name: "search-button-clear-normal")
    internal static let searchIcon = ImageAsset(name: "search-icon")
    internal static let twitchIcon = ImageAsset(name: "twitch-icon")
    internal static let viberIcon = ImageAsset(name: "viber-icon")
    internal static let vkIcon = ImageAsset(name: "vk-icon")
    internal static let wechatIcon = ImageAsset(name: "wechat-icon")
    internal static let whatsappIcon = ImageAsset(name: "whatsapp-icon")
    internal static let youtubeIcon = ImageAsset(name: "youtube-icon")
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
