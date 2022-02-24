// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {

  public enum ChangePasswordController {
    /// New Password
    public static let newPasswordPlaceholder = Strings.tr("Localizable", "ChangePasswordController.newPasswordPlaceholder")
    /// Password
    public static let passwordPlaceholder = Strings.tr("Localizable", "ChangePasswordController.passwordPlaceholder")
    /// Retype New Password
    public static let retypeNewPasswordPlaceholder = Strings.tr("Localizable", "ChangePasswordController.retypeNewPasswordPlaceholder")
    /// Save
    public static let saveButtonTitle = Strings.tr("Localizable", "ChangePasswordController.saveButtonTitle")
    /// CHANGE PASSWORD
    public static let title = Strings.tr("Localizable", "ChangePasswordController.title")
  }

  public enum DetailViewController {
    /// ADD NOTE
    public static let addTitle = Strings.tr("Localizable", "DetailViewController.addTitle")
    /// Description...
    public static let descriptionTitlePlaceholder = Strings.tr("Localizable", "DetailViewController.descriptionTitlePlaceholder")
    /// DETAILS
    public static let detailsTitle = Strings.tr("Localizable", "DetailViewController.detailsTitle")
    /// EDIT NOTE
    public static let editTitle = Strings.tr("Localizable", "DetailViewController.editTitle")
    /// Note Title...
    public static let noteTitlePlaceholder = Strings.tr("Localizable", "DetailViewController.noteTitlePlaceholder")
    /// Save
    public static let saveButtonTitle = Strings.tr("Localizable", "DetailViewController.saveButtonTitle")
  }

  public enum Error {
    /// Please check your information.
    public static let checkInformations = Strings.tr("Localizable", "Error.checkInformations")
    /// Please fill in the blanks.
    public static let emptyFields = Strings.tr("Localizable", "Error.emptyFields")
    /// Your email address not in mail format 
    public static let incorrectEmailFormat = Strings.tr("Localizable", "Error.incorrectEmailFormat")
    /// Your email address should contain @.
    public static let incorrectEmailFormata = Strings.tr("Localizable", "Error.incorrectEmailFormata")
    /// The email and password you entered did not match our records. Please try again.
    public static let invalidMatch = Strings.tr("Localizable", "Error.invalidMatch")
    /// Your password must consist of at least 6 characters.
    public static let passwordCharacter = Strings.tr("Localizable", "Error.passwordCharacter")
  }

  public enum General {
    ///   Add Note
    public static let addNote = Strings.tr("Localizable", "General.addNote")
    /// Cancel
    public static let cancel = Strings.tr("Localizable", "General.cancel")
    /// Delete
    public static let delete = Strings.tr("Localizable", "General.delete")
    /// Login
    public static let login = Strings.tr("Localizable", "General.login")
    /// Reset Password
    public static let resetPassword = Strings.tr("Localizable", "General.resetPassword")
    /// Save
    public static let save = Strings.tr("Localizable", "General.save")
    /// Sign Up
    public static let signUp = Strings.tr("Localizable", "General.signUp")
  }

  public enum HomeViewController {
    ///  Add Note
    public static let addNoteButtonTitle = Strings.tr("Localizable", "HomeViewController.addNoteButtonTitle")
    /// Cancel
    public static let alertCancelButtonTitle = Strings.tr("Localizable", "HomeViewController.alertCancelButtonTitle")
    /// Delete
    public static let alertDeleteButtonTitle = Strings.tr("Localizable", "HomeViewController.alertDeleteButtonTitle")
    /// Are you sure you want to delete this note.
    public static let alertSubTitle = Strings.tr("Localizable", "HomeViewController.alertSubTitle")
    /// Delete Note
    public static let alertTitle = Strings.tr("Localizable", "HomeViewController.alertTitle")
    /// Cancel
    public static let cancelButtonTitle = Strings.tr("Localizable", "HomeViewController.cancelButtonTitle")
    /// Search...
    public static let searchPlaceholder = Strings.tr("Localizable", "HomeViewController.searchPlaceholder")
  }

  public enum LoginViewController {
    /// New user? 
    public static let bottomBlackText = Strings.tr("Localizable", "LoginViewController.bottomBlackText")
    /// Sign up now
    public static let bottomBluberryText = Strings.tr("Localizable", "LoginViewController.bottomBluberryText")
    /// Email Address
    public static let emailPlaceholder = Strings.tr("Localizable", "LoginViewController.emailPlaceholder")
    /// Forgot Password?
    public static let forgotPassword = Strings.tr("Localizable", "LoginViewController.forgotPassword")
    /// Login
    public static let loginButton = Strings.tr("Localizable", "LoginViewController.loginButton")
    /// Password
    public static let passwordPlaceholder = Strings.tr("Localizable", "LoginViewController.passwordPlaceholder")
    /// Login or sign up continue using our app.
    public static let subTitle = Strings.tr("Localizable", "LoginViewController.subTitle")
    /// Login
    public static let title = Strings.tr("Localizable", "LoginViewController.title")
  }

  public enum PasswordResetMessageViewController {
    /// An email has been sent to 
    public static let greenSubTitleAfter = Strings.tr("Localizable", "PasswordResetMessageViewController.greenSubTitleAfter")
    ///  with further instructions.
    public static let greenSubTitleLast = Strings.tr("Localizable", "PasswordResetMessageViewController.greenSubTitleLast")
    /// Login
    public static let loginButtonTitle = Strings.tr("Localizable", "PasswordResetMessageViewController.loginButtonTitle")
    /// Password Reset Confirmation
    public static let title = Strings.tr("Localizable", "PasswordResetMessageViewController.title")
  }

  public enum PasswordResetViewController {
    /// An email has been sent to 
    public static let greenSubTitleAfter = Strings.tr("Localizable", "PasswordResetViewController.greenSubTitleAfter")
    ///  with further instructions.
    public static let greenSubTitleLast = Strings.tr("Localizable", "PasswordResetViewController.greenSubTitleLast")
    /// Your email address incorrect!
    public static let incorrectEmailMessage = Strings.tr("Localizable", "PasswordResetViewController.incorrectEmailMessage")
    /// Reset Password
    public static let resetPasswordButtonTitle = Strings.tr("Localizable", "PasswordResetViewController.resetPasswordButtonTitle")
    /// Confirm your email and we'll send the instructions.
    public static let subTitle = Strings.tr("Localizable", "PasswordResetViewController.subTitle")
    /// Forgot Password?
    public static let title = Strings.tr("Localizable", "PasswordResetViewController.title")
  }

  public enum Placeholder {
    /// Description...
    public static let descriptionTitle = Strings.tr("Localizable", "Placeholder.descriptionTitle")
    /// Email Address
    public static let email = Strings.tr("Localizable", "Placeholder.email")
    /// New Password
    public static let newPassword = Strings.tr("Localizable", "Placeholder.newPassword")
    /// Note Title...
    public static let noteTitle = Strings.tr("Localizable", "Placeholder.noteTitle")
    /// Password
    public static let password = Strings.tr("Localizable", "Placeholder.password")
    /// Retype New Password
    public static let retypeNewPassword = Strings.tr("Localizable", "Placeholder.retypeNewPassword")
    /// Search...
    public static let search = Strings.tr("Localizable", "Placeholder.search")
    /// Full Name
    public static let username = Strings.tr("Localizable", "Placeholder.username")
  }

  public enum ProfileViewController {
    /// Change Password
    public static let changePasswordButtonTitle = Strings.tr("Localizable", "ProfileViewController.changePasswordButtonTitle")
    /// Save
    public static let saveButtonTitle = Strings.tr("Localizable", "ProfileViewController.saveButtonTitle")
    /// Sign Out
    public static let signOutButtonTitle = Strings.tr("Localizable", "ProfileViewController.signOutButtonTitle")
    /// PROFILE
    public static let title = Strings.tr("Localizable", "ProfileViewController.title")
  }

  public enum RegisterViewController {
    /// Already have an account? 
    public static let bottomBlackText = Strings.tr("Localizable", "RegisterViewController.bottomBlackText")
    /// Sign in now
    public static let bottomBluberryText = Strings.tr("Localizable", "RegisterViewController.bottomBluberryText")
    /// Email Address
    public static let emailPlaceholder = Strings.tr("Localizable", "RegisterViewController.emailPlaceholder")
    /// Forgot Password?
    public static let forgotPassword = Strings.tr("Localizable", "RegisterViewController.forgotPassword")
    /// Password
    public static let passwordPlaceholder = Strings.tr("Localizable", "RegisterViewController.passwordPlaceholder")
    /// Sign Up
    public static let signUpButtonTitle = Strings.tr("Localizable", "RegisterViewController.signUpButtonTitle")
    /// Login or sign up continue using our app.
    public static let subTitle = Strings.tr("Localizable", "RegisterViewController.subTitle")
    /// Sign Up
    public static let title = Strings.tr("Localizable", "RegisterViewController.title")
    /// Full Name
    public static let usernamePlaceholder = Strings.tr("Localizable", "RegisterViewController.usernamePlaceholder")
  }

  public enum Success {
    /// Your password has been updated
    public static let succesChangePassword = Strings.tr("Localizable", "Success.succesChangePassword")
    /// Success Sign Up.
    public static let succesSignUp = Strings.tr("Localizable", "Success.succesSignUp")
    /// Your profile has been updated
    public static let succesUpdeteProfile = Strings.tr("Localizable", "Success.succesUpdeteProfile")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
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
