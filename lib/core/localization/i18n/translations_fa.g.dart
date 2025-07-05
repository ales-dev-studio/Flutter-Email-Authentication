///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsFa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFa _root = this; // ignore: unused_field

	@override 
	TranslationsFa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFa(meta: meta ?? this.$meta);

	// Translations
	@override String get language => 'زبان';
	@override String get farsi => 'فارسی';
	@override String get english => 'انگلیسی';
	@override String get theme => 'پوسته برنامه';
	@override String get systemDefault => 'پیش‌فرض سیستم';
	@override String get mDay => 'روز';
	@override String get mNight => 'شب';
	@override String get dayMode => 'حالت روز';
	@override String get nightMode => 'حالت شب';
	@override late final _TranslationsLoginFa login = _TranslationsLoginFa._(_root);
	@override String get throwException => 'خطا رخ داده است!';
	@override String get tryAgain => 'تلاش مجدد';
	@override String get noInternet => 'ارتباط با اینترنت برقرار نیست.';
	@override String get turnOfVpn => 'برای عملکر بهتر VPN خود را خاموش کنید';
	@override String get cancel => 'لغو';
	@override String textInputValidationErrorMessage({required Object field}) => 'اطلاعات فیلد ${field} معتبر نمی‌باشد.';
	@override String get notFound => 'صفحه مورد نظر یافت نشد.';
	@override String get continueWithEmail => 'ادامه با ایمیل';
	@override String get continueWithGoogle => 'ادامه با گوگل';
	@override String get continueWithApple => 'ادامه با اپل';
	@override String get acceptTC => 'با ثبت نام یا ورود به سیستم، شرایط و قوانین را می پذیرم';
	@override String get termsOfService => 'شرایط خدمات';
	@override String get privacyPolicy => 'سیاست حفظ حریم خصوصی';
	@override String get and => 'و';
	@override String get enterSelf => 'را وارد کنید!';
	@override String get please => 'لطفا';
	@override String get number => 'رقم';
	@override String get createAccount => 'اکانت خود را ایجاد کنید';
	@override String get email => 'ایمیل';
	@override String get pass => 'رمز عبور';
	@override String get signUp => 'ثبت نام';
	@override String get continueWith => 'یا ادامه با';
	@override String get alreadyHaveAcc => 'از قبل یک حساب دارید؟';
	@override String get signIn => 'ورود به سیستم';
	@override String get loginToAcc => 'ورود به حساب کاربری';
	@override String get forgotPass => 'گذرواژه را فراموش کرده اید؟';
	@override String get doNotHaveAcc => 'حساب کاربری ندارید؟';
	@override String get forgotPassDesc => 'اگر این ایمیل را در سرویس ما دارید، باید کد پین رمز عبور فراموش شده را دریافت کنید';
	@override String get forgotPassQ => 'رمز عبور را فراموش کرده ام';
	@override String get submit => 'ارسال';
	@override String get verifyOtp => 'تأیید رمز یکبار مصرف';
	@override String get verifyOtpDec => 'ما کد را به آدرس ایمیل شما ارسال خواهیم کرد';
	@override String get createPass => 'گذرواژه جدید خود را ایجاد کنید';
	@override String get ConfirmPassword => 'تأیید رمز عبور';
	@override String get home => 'خانه';
	@override String get explore => 'کاوش';
	@override String get favorite => 'علاقه‌مندی‌ها';
	@override String get tickets => 'بلیط‌ها';
	@override String get profile => 'پروفایل';
	@override String get letsGetStarted => 'بیایید شروع کنیم';
	@override String get authDesc => 'ثبت نام کنید یا وارد شوید تا ببینید \nدر نزدیکی شما چه اتفاقی می افتد';
	@override String get searchEvent => 'جستجوی رویداد';
	@override String get needApprove => 'نیاز به تایید';
	@override String get userName => 'نام کاربری';
	@override String get enterAValidEmail => 'لطفا یک ایمیل معتبر وارد کنید';
	@override String get passwordsDoNotMatch => 'گذرواژه ها مطابقت ندارند';
	@override String get passCharLimit => 'گذرواژه باید حداقل 8 کاراکتر باشد';
	@override String get passUppercaseLimit => 'رمز عبور باید حداقل یک حرف بزرگ داشته باشد';
	@override String get passLowercaseLimit => 'رمز عبور باید حداقل یک حرف کوچک داشته باشد';
	@override String get passNumberLimit => 'رمز عبور باید حداقل یک عدد داشته باشد';
	@override String get passSpecialCharLimit => 'رمز عبور باید حداقل یک کاراکتر خاص داشته باشد';
	@override String get enterPass => 'لطفا رمز عبور را وارد کنید';
	@override String get confirmPass => 'لطفا رمز عبور را تایید کنید';
	@override String get enterEmail => 'لطفا ایمیل را وارد کنید';
	@override String get pending => 'در انتظار';
	@override String get events => 'رویدادها';
	@override String get followers => 'دنبال کنندگان';
	@override String get following => 'دنبال شده‌ها';
	@override String get security => 'امنیت';
	@override String get ticketIssue => 'موضوع بلیط';
	@override String get logout => 'خروج از حساب کاربری';
	@override String get messLogout => 'آیا برای خروج از حساب کاربری اطمینان دارید؟';
	@override String get yes => 'بله';
	@override String get no => 'خیر';
	@override String get haveReserved => 'رزرو کرده اند';
	@override String get organizer => 'سازمان دهنده';
	@override String get follow => 'دنبال کردن';
	@override String get aboutEvent => 'درباره رویداد';
	@override String get challenge => 'چالش';
	@override String get location => 'موقعیت';
	@override String get bookEvent => 'شرکت در رویداد';
	@override String get showMore => 'مشاهده بیشتر';
	@override String get showLess => 'مشاهده کمتر';
	@override String get pendingTicketDesc => 'درخواست شما در انتظار تایید برگزار کننده است.';
	@override String get canceledTicketDesc => 'شما درخواست را لغو کرده اید.';
	@override String get rejectedTicketDesc => 'درخواست شما توسط برگزار کننده رد شد.';
	@override String get event => 'رویداد';
	@override String get dateAndHour => 'تاریخ و ساعت';
	@override String get eventOrganizer => 'برگزار کننده';
	@override String get fullName => 'نام کامل';
	@override String get dateOfBirth => 'تاریخ تولد';
	@override String get country => 'کشور';
	@override String get phone => 'تلفن';
	@override String get welcome => 'خوش آمدید';
	@override String get seeAll => 'دیدن همه';
	@override String get live => 'زنده';
	@override String get done => 'انجام شد';
	@override String get review => 'بررسی';
	@override String get featured => 'ویژه';
	@override String get popular => 'محبوب';
	@override String get name => 'نام';
	@override String get lastName => 'نام خانوادگی';
	@override String get gender => 'جنسیت';
	@override String get male => 'مرد';
	@override String get female => 'رن';
	@override String get enterAValidPhone => 'لطفا یک شماره تلفن معتبر وارد کنید';
	@override String get enterPhone => 'لطفا شماره تلفن را وارد کنید';
	@override String get chooseIMG => 'انتخاب عکس';
	@override String get chooseIMGFromGallery => 'انتخاب عکس از گالری';
	@override String get chooseIMGFromCam => 'باز کردن دوربین';
	@override String get photoUploaded => 'تصویر با موفقیت آپلود شد و پس از تایید نمایش داده خواهد شد.';
	@override String get waitForUploadImage => 'لطفا صبر کنید تا تصویر آپلود شود.';
	@override String get directions => 'مسیریابی';
	@override String get passChangeSuccessful => 'تغییر رمز عبور با موفقیت انجام شد.';
	@override String get OTPResendSuccessful => 'ارسال مجدد رمز یکبار مصرف با موفقیت انجام شد.';
	@override String get google => 'گوگل';
	@override String get apple => 'اپل';
	@override String get remainTimeOtp => 'تا امکان ارسال مجدد کد';
	@override String get resendOtpCode => 'ارسال مجدد کد';
}

// Path: login
class _TranslationsLoginFa implements TranslationsLoginEn {
	_TranslationsLoginFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get success => 'لاگین موفق';
	@override String get fail => 'لاگین ناموفق';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'زبان';
			case 'farsi': return 'فارسی';
			case 'english': return 'انگلیسی';
			case 'theme': return 'پوسته برنامه';
			case 'systemDefault': return 'پیش‌فرض سیستم';
			case 'mDay': return 'روز';
			case 'mNight': return 'شب';
			case 'dayMode': return 'حالت روز';
			case 'nightMode': return 'حالت شب';
			case 'login.success': return 'لاگین موفق';
			case 'login.fail': return 'لاگین ناموفق';
			case 'throwException': return 'خطا رخ داده است!';
			case 'tryAgain': return 'تلاش مجدد';
			case 'noInternet': return 'ارتباط با اینترنت برقرار نیست.';
			case 'turnOfVpn': return 'برای عملکر بهتر VPN خود را خاموش کنید';
			case 'cancel': return 'لغو';
			case 'textInputValidationErrorMessage': return ({required Object field}) => 'اطلاعات فیلد ${field} معتبر نمی‌باشد.';
			case 'notFound': return 'صفحه مورد نظر یافت نشد.';
			case 'continueWithEmail': return 'ادامه با ایمیل';
			case 'continueWithGoogle': return 'ادامه با گوگل';
			case 'continueWithApple': return 'ادامه با اپل';
			case 'acceptTC': return 'با ثبت نام یا ورود به سیستم، شرایط و قوانین را می پذیرم';
			case 'termsOfService': return 'شرایط خدمات';
			case 'privacyPolicy': return 'سیاست حفظ حریم خصوصی';
			case 'and': return 'و';
			case 'enterSelf': return 'را وارد کنید!';
			case 'please': return 'لطفا';
			case 'number': return 'رقم';
			case 'createAccount': return 'اکانت خود را ایجاد کنید';
			case 'email': return 'ایمیل';
			case 'pass': return 'رمز عبور';
			case 'signUp': return 'ثبت نام';
			case 'continueWith': return 'یا ادامه با';
			case 'alreadyHaveAcc': return 'از قبل یک حساب دارید؟';
			case 'signIn': return 'ورود به سیستم';
			case 'loginToAcc': return 'ورود به حساب کاربری';
			case 'forgotPass': return 'گذرواژه را فراموش کرده اید؟';
			case 'doNotHaveAcc': return 'حساب کاربری ندارید؟';
			case 'forgotPassDesc': return 'اگر این ایمیل را در سرویس ما دارید، باید کد پین رمز عبور فراموش شده را دریافت کنید';
			case 'forgotPassQ': return 'رمز عبور را فراموش کرده ام';
			case 'submit': return 'ارسال';
			case 'verifyOtp': return 'تأیید رمز یکبار مصرف';
			case 'verifyOtpDec': return 'ما کد را به آدرس ایمیل شما ارسال خواهیم کرد';
			case 'createPass': return 'گذرواژه جدید خود را ایجاد کنید';
			case 'ConfirmPassword': return 'تأیید رمز عبور';
			case 'home': return 'خانه';
			case 'explore': return 'کاوش';
			case 'favorite': return 'علاقه‌مندی‌ها';
			case 'tickets': return 'بلیط‌ها';
			case 'profile': return 'پروفایل';
			case 'letsGetStarted': return 'بیایید شروع کنیم';
			case 'authDesc': return 'ثبت نام کنید یا وارد شوید تا ببینید \nدر نزدیکی شما چه اتفاقی می افتد';
			case 'searchEvent': return 'جستجوی رویداد';
			case 'needApprove': return 'نیاز به تایید';
			case 'userName': return 'نام کاربری';
			case 'enterAValidEmail': return 'لطفا یک ایمیل معتبر وارد کنید';
			case 'passwordsDoNotMatch': return 'گذرواژه ها مطابقت ندارند';
			case 'passCharLimit': return 'گذرواژه باید حداقل 8 کاراکتر باشد';
			case 'passUppercaseLimit': return 'رمز عبور باید حداقل یک حرف بزرگ داشته باشد';
			case 'passLowercaseLimit': return 'رمز عبور باید حداقل یک حرف کوچک داشته باشد';
			case 'passNumberLimit': return 'رمز عبور باید حداقل یک عدد داشته باشد';
			case 'passSpecialCharLimit': return 'رمز عبور باید حداقل یک کاراکتر خاص داشته باشد';
			case 'enterPass': return 'لطفا رمز عبور را وارد کنید';
			case 'confirmPass': return 'لطفا رمز عبور را تایید کنید';
			case 'enterEmail': return 'لطفا ایمیل را وارد کنید';
			case 'pending': return 'در انتظار';
			case 'events': return 'رویدادها';
			case 'followers': return 'دنبال کنندگان';
			case 'following': return 'دنبال شده‌ها';
			case 'security': return 'امنیت';
			case 'ticketIssue': return 'موضوع بلیط';
			case 'logout': return 'خروج از حساب کاربری';
			case 'messLogout': return 'آیا برای خروج از حساب کاربری اطمینان دارید؟';
			case 'yes': return 'بله';
			case 'no': return 'خیر';
			case 'haveReserved': return 'رزرو کرده اند';
			case 'organizer': return 'سازمان دهنده';
			case 'follow': return 'دنبال کردن';
			case 'aboutEvent': return 'درباره رویداد';
			case 'challenge': return 'چالش';
			case 'location': return 'موقعیت';
			case 'bookEvent': return 'شرکت در رویداد';
			case 'showMore': return 'مشاهده بیشتر';
			case 'showLess': return 'مشاهده کمتر';
			case 'pendingTicketDesc': return 'درخواست شما در انتظار تایید برگزار کننده است.';
			case 'canceledTicketDesc': return 'شما درخواست را لغو کرده اید.';
			case 'rejectedTicketDesc': return 'درخواست شما توسط برگزار کننده رد شد.';
			case 'event': return 'رویداد';
			case 'dateAndHour': return 'تاریخ و ساعت';
			case 'eventOrganizer': return 'برگزار کننده';
			case 'fullName': return 'نام کامل';
			case 'dateOfBirth': return 'تاریخ تولد';
			case 'country': return 'کشور';
			case 'phone': return 'تلفن';
			case 'welcome': return 'خوش آمدید';
			case 'seeAll': return 'دیدن همه';
			case 'live': return 'زنده';
			case 'done': return 'انجام شد';
			case 'review': return 'بررسی';
			case 'featured': return 'ویژه';
			case 'popular': return 'محبوب';
			case 'name': return 'نام';
			case 'lastName': return 'نام خانوادگی';
			case 'gender': return 'جنسیت';
			case 'male': return 'مرد';
			case 'female': return 'رن';
			case 'enterAValidPhone': return 'لطفا یک شماره تلفن معتبر وارد کنید';
			case 'enterPhone': return 'لطفا شماره تلفن را وارد کنید';
			case 'chooseIMG': return 'انتخاب عکس';
			case 'chooseIMGFromGallery': return 'انتخاب عکس از گالری';
			case 'chooseIMGFromCam': return 'باز کردن دوربین';
			case 'photoUploaded': return 'تصویر با موفقیت آپلود شد و پس از تایید نمایش داده خواهد شد.';
			case 'waitForUploadImage': return 'لطفا صبر کنید تا تصویر آپلود شود.';
			case 'directions': return 'مسیریابی';
			case 'passChangeSuccessful': return 'تغییر رمز عبور با موفقیت انجام شد.';
			case 'OTPResendSuccessful': return 'ارسال مجدد رمز یکبار مصرف با موفقیت انجام شد.';
			case 'google': return 'گوگل';
			case 'apple': return 'اپل';
			case 'remainTimeOtp': return 'تا امکان ارسال مجدد کد';
			case 'resendOtpCode': return 'ارسال مجدد کد';
			default: return null;
		}
	}
}

