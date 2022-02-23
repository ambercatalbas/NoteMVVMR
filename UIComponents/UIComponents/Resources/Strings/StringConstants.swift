// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum ChangePasswordController {
    /// New Password
    public static let newPasswordPlaceholder = L10n.tr("Localizable", "ChangePasswordController.newPasswordPlaceholder")
    /// Password
    public static let passwordPlaceholder = L10n.tr("Localizable", "ChangePasswordController.passwordPlaceholder")
    /// Retype New Password
    public static let retypeNewPasswordPlaceholder = L10n.tr("Localizable", "ChangePasswordController.retypeNewPasswordPlaceholder")
    /// Sign Out
    public static let saveButtonTitle = L10n.tr("Localizable", "ChangePasswordController.saveButtonTitle")
    /// CHANGE PASSWORD
    public static let title = L10n.tr("Localizable", "ChangePasswordController.title")
  }

  public enum DetailViewController {
    /// Description...
    public static let descriptionTitlePlaceholder = L10n.tr("Localizable", "DetailViewController.descriptionTitlePlaceholder")
    /// DETAİLS
    public static let detailsTitle = L10n.tr("Localizable", "DetailViewController.detailsTitle")
    /// Note Title...
    public static let noteTitlePlaceholder = L10n.tr("Localizable", "DetailViewController.noteTitlePlaceholder")
    /// Save
    public static let saveButtonTitle = L10n.tr("Localizable", "DetailViewController.saveButtonTitle")
    /// EDİT NOTE
    public static let title = L10n.tr("Localizable", "DetailViewController.title")
  }

  public enum HomeViewController {
    /// + Add Note
    public static let addNoteButtonTitle = L10n.tr("Localizable", "HomeViewController.addNoteButtonTitle")
    /// Cancel
    public static let alertCancelButtonTitle = L10n.tr("Localizable", "HomeViewController.alertCancelButtonTitle")
    /// Delete
    public static let alertDeleteButtonTitle = L10n.tr("Localizable", "HomeViewController.alertDeleteButtonTitle")
    /// Are you sure you want to delete this note.
    public static let alertSubTitle = L10n.tr("Localizable", "HomeViewController.alertSubTitle")
    /// Delete Note
    public static let alertTitle = L10n.tr("Localizable", "HomeViewController.alertTitle")
    /// Cancel
    public static let cancelButtonTitle = L10n.tr("Localizable", "HomeViewController.cancelButtonTitle")
    /// Search...
    public static let searchPlaceholder = L10n.tr("Localizable", "HomeViewController.searchPlaceholder")
  }

  public enum LoginViewController {
    /// New user? Sign up now
    public static let bottomText = L10n.tr("Localizable", "LoginViewController.bottomText")
    /// Email Address
    public static let emailPlaceholder = L10n.tr("Localizable", "LoginViewController.emailPlaceholder")
    /// Forgot Password?
    public static let forgotPassword = L10n.tr("Localizable", "LoginViewController.forgotPassword")
    /// Login
    public static let loginButton = L10n.tr("Localizable", "LoginViewController.loginButton")
    /// Password
    public static let passwordPlaceholder = L10n.tr("Localizable", "LoginViewController.passwordPlaceholder")
    /// Login or sign up continue using our app.
    public static let subTitle = L10n.tr("Localizable", "LoginViewController.subTitle")
    /// Login
    public static let title = L10n.tr("Localizable", "LoginViewController.title")
  }

  public enum PasswordResetMessageViewController {
    /// An email has been sent to 
    public static let greenSubTitleAfter = L10n.tr("Localizable", "PasswordResetMessageViewController.greenSubTitleAfter")
    ///  with further instructions.
    public static let greenSubTitleLast = L10n.tr("Localizable", "PasswordResetMessageViewController.greenSubTitleLast")
    /// Login
    public static let loginButtonTitle = L10n.tr("Localizable", "PasswordResetMessageViewController.loginButtonTitle")
    /// Password Reset Confirmation
    public static let title = L10n.tr("Localizable", "PasswordResetMessageViewController.title")
  }

  public enum PasswordResetViewController {
    /// An email has been sent to 
    public static let greenSubTitleAfter = L10n.tr("Localizable", "PasswordResetViewController.greenSubTitleAfter")
    ///  with further instructions.
    public static let greenSubTitleLast = L10n.tr("Localizable", "PasswordResetViewController.greenSubTitleLast")
    /// Your email address incorrect!
    public static let incorrectEmailMessage = L10n.tr("Localizable", "PasswordResetViewController.incorrectEmailMessage")
    /// Reset Password
    public static let resetPasswordButtonTitle = L10n.tr("Localizable", "PasswordResetViewController.resetPasswordButtonTitle")
    /// Confirm your email and we'll send the instructions.
    public static let subTitle = L10n.tr("Localizable", "PasswordResetViewController.subTitle")
    /// Forgot Password?
    public static let title = L10n.tr("Localizable", "PasswordResetViewController.title")
  }

  public enum ProfileViewController {
    /// Change Password
    public static let changePasswordButtonTitle = L10n.tr("Localizable", "ProfileViewController.changePasswordButtonTitle")
    /// Save
    public static let saveButtonTitle = L10n.tr("Localizable", "ProfileViewController.saveButtonTitle")
    /// Sign Out
    public static let signOutButtonTitle = L10n.tr("Localizable", "ProfileViewController.signOutButtonTitle")
    /// PROFİLE
    public static let title = L10n.tr("Localizable", "ProfileViewController.title")
  }

  public enum RegisterViewController {
    /// Already have an account? Sign in now
    public static let bottomText = L10n.tr("Localizable", "RegisterViewController.bottomText")
    /// Email Address
    public static let emailPlaceholder = L10n.tr("Localizable", "RegisterViewController.emailPlaceholder")
    /// Forgot Password?
    public static let forgotPassword = L10n.tr("Localizable", "RegisterViewController.forgotPassword")
    /// Password
    public static let passwordPlaceholder = L10n.tr("Localizable", "RegisterViewController.passwordPlaceholder")
    /// Sign Up
    public static let signUpButtonTitle = L10n.tr("Localizable", "RegisterViewController.signUpButtonTitle")
    /// Login or sign up continue using our app.
    public static let subTitle = L10n.tr("Localizable", "RegisterViewController.subTitle")
    /// Sign Up
    public static let title = L10n.tr("Localizable", "RegisterViewController.title")
    /// Full Name
    public static let usernamePlaceholder = L10n.tr("Localizable", "RegisterViewController.usernamePlaceholder")
  }
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
