// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum Storyboards {
  internal enum Auth: StoryboardType {
    internal static let storyboardName = "Auth"

    internal static let loginViewController = SceneType<Fitnecs.LoginViewController>(storyboard: Auth.self, identifier: "LoginViewController")
  }
  internal enum Common: StoryboardType {
    internal static let storyboardName = "Common"

    internal static let htmlArticleViewController = SceneType<Fitnecs.HtmlArticleViewController>(storyboard: Common.self, identifier: "HtmlArticleViewController")

    internal static let infoViewController = SceneType<Fitnecs.InfoViewController>(storyboard: Common.self, identifier: "InfoViewController")

    internal static let smallModalViewController = SceneType<Fitnecs.SmallModalViewController>(storyboard: Common.self, identifier: "SmallModalViewController")
  }
  internal enum Main: StoryboardType {
    internal static let storyboardName = "Main"

    internal static let mainViewController = SceneType<Fitnecs.MainViewController>(storyboard: Main.self, identifier: "MainViewController")
  }
  internal enum Root: StoryboardType {
    internal static let storyboardName = "Root"

    internal static let rootViewController = SceneType<Fitnecs.RootViewController>(storyboard: Root.self, identifier: "RootViewController")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
