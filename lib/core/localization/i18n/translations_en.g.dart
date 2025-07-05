///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get language => 'language';
	String get farsi => 'Farsi';
	String get english => 'English';
	String get theme => 'Theme mode';
	String get systemDefault => 'System default';
	String get mDay => 'Day';
	String get mNight => 'Night';
	String get dayMode => 'Day mode';
	String get nightMode => 'Night mode';
	late final TranslationsLoginEn login = TranslationsLoginEn._(_root);
	String get throwException => 'An error has occurred!';
	String get tryAgain => 'Try again';
	String get noInternet => 'No internet connection.';
	String get turnOfVpn => 'Turn of vpn';
	String get cancel => 'Cancel';
	String textInputValidationErrorMessage({required Object field}) => 'The ${field} field information is not valid.';
	String get notFound => 'Page Not Found';
	String get continueWithEmail => 'Continue with email';
	String get continueWithGoogle => 'Continue with Google';
	String get continueWithApple => 'Continue with Apple';
	String get acceptTC => 'By signing up or logging in, I accept the';
	String get termsOfService => 'Terms of Service';
	String get privacyPolicy => 'Privacy Policy';
	String get and => 'and';
	String get enterSelf => 'enter';
	String get please => 'Please';
	String get number => 'Number';
	String get createAccount => 'Create your account';
	String get email => 'Email';
	String get pass => 'Password';
	String get signUp => 'Sign up';
	String get continueWith => 'or continue with';
	String get alreadyHaveAcc => 'Already have an account?';
	String get signIn => 'Sign in';
	String get loginToAcc => 'Login to your account';
	String get forgotPass => 'Forgot the password?';
	String get doNotHaveAcc => 'Don’t have an account?';
	String get forgotPassDesc => 'If you have this email in our service, you should receive a forgotten password PIN code';
	String get forgotPassQ => 'Forgot password';
	String get submit => 'Submit';
	String get verifyOtp => 'Verify OTP';
	String get verifyOtpDec => 'We will send the code to your email address';
	String get createPass => 'Create your new password';
	String get ConfirmPassword => 'Confirm password';
	String get home => 'Home';
	String get explore => 'Explore';
	String get favorite => 'Favorites';
	String get tickets => 'Tickets';
	String get profile => 'Profile';
	String get letsGetStarted => 'Let\'s get started';
	String get authDesc => 'signup or login in to see what’s happening\nnear you';
	String get searchEvent => 'Search events ... ';
	String get needApprove => 'Need approve';
	String get userName => 'User name';
	String get enterAValidEmail => 'Please enter a valid email';
	String get passwordsDoNotMatch => 'Passwords do not match';
	String get passCharLimit => 'Password must be at least 8 characters long';
	String get passUppercaseLimit => 'Password must contain at least one uppercase letter';
	String get passLowercaseLimit => 'Password must contain at least one lowercase letter';
	String get passNumberLimit => 'Password must contain at least one number';
	String get passSpecialCharLimit => 'Password must contain at least one special character';
	String get enterPass => 'Please enter password';
	String get confirmPass => 'Please confirm password';
	String get enterEmail => 'Please enter email';
	String get pending => 'pending';
	String get events => 'Events';
	String get followers => 'Followers';
	String get following => 'Following';
	String get security => 'Security';
	String get ticketIssue => 'Ticket Issue';
	String get logout => 'Logout';
	String get messLogout => 'Are you sure you want to logout?';
	String get yes => 'Yes';
	String get no => 'no';
	String get haveReserved => 'have reserved';
	String get organizer => 'organizer';
	String get follow => 'Follow';
	String get aboutEvent => 'About Event';
	String get challenge => 'Challenge';
	String get location => 'Location';
	String get bookEvent => 'Book event';
	String get showMore => 'Show more';
	String get showLess => 'Show less';
	String get pendingTicketDesc => 'Your request is pending\norganizer approval.';
	String get canceledTicketDesc => 'You canceled\nthe request';
	String get rejectedTicketDesc => 'Your request was rejected\nby the organizer.';
	String get event => 'Event';
	String get dateAndHour => 'Date and Hour';
	String get eventOrganizer => 'Event Organizer';
	String get fullName => 'Full name';
	String get dateOfBirth => 'Date of Birth';
	String get country => 'Country';
	String get phone => 'Phone';
	String get welcome => 'Welcome';
	String get seeAll => 'see all';
	String get live => 'live';
	String get done => 'Done';
	String get review => 'Review';
	String get featured => 'Featured';
	String get popular => 'Popular';
	String get name => 'Name';
	String get lastName => 'Last name';
	String get gender => 'Gender';
	String get male => 'Male';
	String get female => 'Female';
	String get enterAValidPhone => 'Please enter a valid phone number';
	String get enterPhone => 'Please enter phone number';
	String get chooseIMG => 'Choose Image';
	String get chooseIMGFromGallery => 'Select photo from gallery';
	String get chooseIMGFromCam => 'Take a photo with camera';
	String get photoUploaded => 'The image was successfully uploaded and will be displayed after approval.';
	String get waitForUploadImage => 'Please wait for the image to upload.';
	String get directions => 'Directions';
	String get passChangeSuccessful => 'Password change successful.';
	String get OTPResendSuccessful => 'OTP resend successful.';
	String get google => 'Google';
	String get apple => 'Apple';
	String get remainTimeOtp => 'until code resend';
	String get resendOtpCode => 'Resend OTP code';
}

// Path: login
class TranslationsLoginEn {
	TranslationsLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get success => 'Logged in successfully';
	String get fail => 'Logged in failed';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'language';
			case 'farsi': return 'Farsi';
			case 'english': return 'English';
			case 'theme': return 'Theme mode';
			case 'systemDefault': return 'System default';
			case 'mDay': return 'Day';
			case 'mNight': return 'Night';
			case 'dayMode': return 'Day mode';
			case 'nightMode': return 'Night mode';
			case 'login.success': return 'Logged in successfully';
			case 'login.fail': return 'Logged in failed';
			case 'throwException': return 'An error has occurred!';
			case 'tryAgain': return 'Try again';
			case 'noInternet': return 'No internet connection.';
			case 'turnOfVpn': return 'Turn of vpn';
			case 'cancel': return 'Cancel';
			case 'textInputValidationErrorMessage': return ({required Object field}) => 'The ${field} field information is not valid.';
			case 'notFound': return 'Page Not Found';
			case 'continueWithEmail': return 'Continue with email';
			case 'continueWithGoogle': return 'Continue with Google';
			case 'continueWithApple': return 'Continue with Apple';
			case 'acceptTC': return 'By signing up or logging in, I accept the';
			case 'termsOfService': return 'Terms of Service';
			case 'privacyPolicy': return 'Privacy Policy';
			case 'and': return 'and';
			case 'enterSelf': return 'enter';
			case 'please': return 'Please';
			case 'number': return 'Number';
			case 'createAccount': return 'Create your account';
			case 'email': return 'Email';
			case 'pass': return 'Password';
			case 'signUp': return 'Sign up';
			case 'continueWith': return 'or continue with';
			case 'alreadyHaveAcc': return 'Already have an account?';
			case 'signIn': return 'Sign in';
			case 'loginToAcc': return 'Login to your account';
			case 'forgotPass': return 'Forgot the password?';
			case 'doNotHaveAcc': return 'Don’t have an account?';
			case 'forgotPassDesc': return 'If you have this email in our service, you should receive a forgotten password PIN code';
			case 'forgotPassQ': return 'Forgot password';
			case 'submit': return 'Submit';
			case 'verifyOtp': return 'Verify OTP';
			case 'verifyOtpDec': return 'We will send the code to your email address';
			case 'createPass': return 'Create your new password';
			case 'ConfirmPassword': return 'Confirm password';
			case 'home': return 'Home';
			case 'explore': return 'Explore';
			case 'favorite': return 'Favorites';
			case 'tickets': return 'Tickets';
			case 'profile': return 'Profile';
			case 'letsGetStarted': return 'Let\'s get started';
			case 'authDesc': return 'signup or login in to see what’s happening\nnear you';
			case 'searchEvent': return 'Search events ... ';
			case 'needApprove': return 'Need approve';
			case 'userName': return 'User name';
			case 'enterAValidEmail': return 'Please enter a valid email';
			case 'passwordsDoNotMatch': return 'Passwords do not match';
			case 'passCharLimit': return 'Password must be at least 8 characters long';
			case 'passUppercaseLimit': return 'Password must contain at least one uppercase letter';
			case 'passLowercaseLimit': return 'Password must contain at least one lowercase letter';
			case 'passNumberLimit': return 'Password must contain at least one number';
			case 'passSpecialCharLimit': return 'Password must contain at least one special character';
			case 'enterPass': return 'Please enter password';
			case 'confirmPass': return 'Please confirm password';
			case 'enterEmail': return 'Please enter email';
			case 'pending': return 'pending';
			case 'events': return 'Events';
			case 'followers': return 'Followers';
			case 'following': return 'Following';
			case 'security': return 'Security';
			case 'ticketIssue': return 'Ticket Issue';
			case 'logout': return 'Logout';
			case 'messLogout': return 'Are you sure you want to logout?';
			case 'yes': return 'Yes';
			case 'no': return 'no';
			case 'haveReserved': return 'have reserved';
			case 'organizer': return 'organizer';
			case 'follow': return 'Follow';
			case 'aboutEvent': return 'About Event';
			case 'challenge': return 'Challenge';
			case 'location': return 'Location';
			case 'bookEvent': return 'Book event';
			case 'showMore': return 'Show more';
			case 'showLess': return 'Show less';
			case 'pendingTicketDesc': return 'Your request is pending\norganizer approval.';
			case 'canceledTicketDesc': return 'You canceled\nthe request';
			case 'rejectedTicketDesc': return 'Your request was rejected\nby the organizer.';
			case 'event': return 'Event';
			case 'dateAndHour': return 'Date and Hour';
			case 'eventOrganizer': return 'Event Organizer';
			case 'fullName': return 'Full name';
			case 'dateOfBirth': return 'Date of Birth';
			case 'country': return 'Country';
			case 'phone': return 'Phone';
			case 'welcome': return 'Welcome';
			case 'seeAll': return 'see all';
			case 'live': return 'live';
			case 'done': return 'Done';
			case 'review': return 'Review';
			case 'featured': return 'Featured';
			case 'popular': return 'Popular';
			case 'name': return 'Name';
			case 'lastName': return 'Last name';
			case 'gender': return 'Gender';
			case 'male': return 'Male';
			case 'female': return 'Female';
			case 'enterAValidPhone': return 'Please enter a valid phone number';
			case 'enterPhone': return 'Please enter phone number';
			case 'chooseIMG': return 'Choose Image';
			case 'chooseIMGFromGallery': return 'Select photo from gallery';
			case 'chooseIMGFromCam': return 'Take a photo with camera';
			case 'photoUploaded': return 'The image was successfully uploaded and will be displayed after approval.';
			case 'waitForUploadImage': return 'Please wait for the image to upload.';
			case 'directions': return 'Directions';
			case 'passChangeSuccessful': return 'Password change successful.';
			case 'OTPResendSuccessful': return 'OTP resend successful.';
			case 'google': return 'Google';
			case 'apple': return 'Apple';
			case 'remainTimeOtp': return 'until code resend';
			case 'resendOtpCode': return 'Resend OTP code';
			default: return null;
		}
	}
}

