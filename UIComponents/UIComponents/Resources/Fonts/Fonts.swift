// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
public typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum FontFamily {
  public enum JosefinSans {
    public static let bold = FontConvertible(name: "JosefinSans-Bold", family: "Josefin Sans", path: "JosefinSans-Bold.ttf")
    public static let boldItalic = FontConvertible(name: "JosefinSans-BoldItalic", family: "Josefin Sans", path: "JosefinSans-BoldItalic.ttf")
    public static let extraLight = FontConvertible(name: "JosefinSans-ExtraLight", family: "Josefin Sans", path: "JosefinSans-ExtraLight.ttf")
    public static let extraLightItalic = FontConvertible(name: "JosefinSans-ExtraLightItalic", family: "Josefin Sans", path: "JosefinSans-ExtraLightItalic.ttf")
    public static let italic = FontConvertible(name: "JosefinSans-Italic", family: "Josefin Sans", path: "JosefinSans-Italic.ttf")
    public static let light = FontConvertible(name: "JosefinSans-Light", family: "Josefin Sans", path: "JosefinSans-Light.ttf")
    public static let lightItalic = FontConvertible(name: "JosefinSans-LightItalic", family: "Josefin Sans", path: "JosefinSans-LightItalic.ttf")
    public static let medium = FontConvertible(name: "JosefinSans-Medium", family: "Josefin Sans", path: "JosefinSans-Medium.ttf")
    public static let mediumItalic = FontConvertible(name: "JosefinSans-MediumItalic", family: "Josefin Sans", path: "JosefinSans-MediumItalic.ttf")
    public static let regular = FontConvertible(name: "JosefinSans-Regular", family: "Josefin Sans", path: "JosefinSans-Regular.ttf")
    public static let semiBold = FontConvertible(name: "JosefinSans-SemiBold", family: "Josefin Sans", path: "JosefinSans-SemiBold.ttf")
    public static let semiBoldItalic = FontConvertible(name: "JosefinSans-SemiBoldItalic", family: "Josefin Sans", path: "JosefinSans-SemiBoldItalic.ttf")
    public static let thin = FontConvertible(name: "JosefinSans-Thin", family: "Josefin Sans", path: "JosefinSans-Thin.ttf")
    public static let thinItalic = FontConvertible(name: "JosefinSans-ThinItalic", family: "Josefin Sans", path: "JosefinSans-ThinItalic.ttf")
    public static let all: [FontConvertible] = [bold, boldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, regular, semiBold, semiBoldItalic, thin, thinItalic]
  }
  public enum Nunito {
    public static let bold = FontConvertible(name: "Nunito-Bold", family: "Nunito", path: "Nunito-Bold.ttf")
    public static let extraBold = FontConvertible(name: "Nunito-ExtraBold", family: "Nunito", path: "Nunito-ExtraBold.ttf")
    public static let semiBold = FontConvertible(name: "Nunito-SemiBold", family: "Nunito", path: "Nunito-SemiBold.ttf")
    public static let all: [FontConvertible] = [bold, extraBold, semiBold]
  }
  public static let allCustomFonts: [FontConvertible] = [JosefinSans.all, Nunito.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct FontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(macOS)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

public extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(macOS)
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
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
