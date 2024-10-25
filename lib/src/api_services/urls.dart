import '../config/app_configs.dart';

// final String baseUrl = GlobalConfiguration().get('base_url');
// final String apiBaseUrl = GlobalConfiguration().get('api_base_url');
// final String mediaUrl = GlobalConfiguration().get('media_url');
final String baseUrl = AppConfigs.baseUrl;
final String apiBaseUrl = AppConfigs.apiBaseUrl;
final String mediaUrl = AppConfigs.mediaUrl;

///---fcm
const String fcmService = 'https://fcm.googleapis.com/fcm/send';

///---auth
// String signUpWithEmailURL = apiBaseUrl + 'signup-email';
String signUpWithEmailURL = '${apiBaseUrl}auth/register';
String signInWithEmailURL = '${apiBaseUrl}auth/login';
String socialLoginURL = '${apiBaseUrl}auth/social_login';
String loginWithOtpURL = '${apiBaseUrl}login-signup';
String signOutURL = '${apiBaseUrl}auth/logout';

///---logged-in-user
String getLoggedInUserUrl = '${apiBaseUrl}auth/user';

String contactUsUrl = '${apiBaseUrl}contact';

///---payment-method
String paymentMethodUrl = '${apiBaseUrl}execute-payment';
String jazzCashPaymentUrl = '${apiBaseUrl}makeJazzcashPayment';
// String getAppointmentPaymentStatusUrl = baseUrl + 'getAppointmentStatus';
String getPaymentMethodsUrl = '${apiBaseUrl}payment_methods';

//---edit-or-update-profile
String editUserProfileURL = '${apiBaseUrl}lawyers/update_general_info';
// String editUserProfileExperienceURL = apiBaseUrl + 'lawyers/lawyer_experiences';
String addEditUserProfileEducationURL =
    '${apiBaseUrl}lawyers/lawyer_educations';
String addEditUserProfileCertificateURL =
    '${apiBaseUrl}lawyers/lawyer_certifications';
String addEditUserProfileExperienceURL =
    '${apiBaseUrl}lawyers/lawyer_experiences';

//---get-profile-certificate
String getUserProfileCertificateURL =
    '${apiBaseUrl}lawyers/lawyer_certifications';
//---get-profile-experiences
String getUserProfileExperiencesURL = '${apiBaseUrl}lawyers/lawyer_experiences';
//---get-profile-Education
String getUserProfileEducationsURL = '${apiBaseUrl}lawyers/lawyer_educations';

///---consultant-profile-by-id
String getLawyerProfileUrl = '${apiBaseUrl}lawyers/';
String getMentorProfileForMenteeUrl = '${apiBaseUrl}get-mentor-details';

String mentorChangeAppointmentStatusUrl =
    '${apiBaseUrl}changeAppointmentStatus';

///---get-appointment-counts
String getAppointmentCountUrl = '${apiBaseUrl}mentorAppointmentCount';
String getAppointmentCountForMentorUrl = '${apiBaseUrl}appointment-count';

///---featured
String getFeaturedEvents = '${apiBaseUrl}featured_events';
String getFeaturedLawyers = '${apiBaseUrl}featured_lawyers';

///---all listings
String getAllLawyers = '${apiBaseUrl}filter_lawyers';
String getAllBlogsPosts = '${apiBaseUrl}filter_posts';
String getAllEvents = '${apiBaseUrl}filter_events';

///---categories
String getLawyerCategoriesURL = '${apiBaseUrl}lawyer_categories';

///---top-rated
String getTopRatedConsultantURL = '${apiBaseUrl}topRatedMentors';

///---categories-with-mentor
String getCategoriesWithMentorURL = '${apiBaseUrl}categories/with/mentors';

///---book-appointment
String getScheduleAvailableDaysURL =
    '${apiBaseUrl}get-scheduled-available-days';
String getScheduleSlotsForMenteeUrl = '${apiBaseUrl}get-date-schedule';
String bookAppointmentUrl = '${apiBaseUrl}bookAppointment';

///---appointment-log-user
String getUserAllAppointmentsURL = '${apiBaseUrl}all-status-menteeAppointments';
String getConsultantAllAppointmentsURL =
    '${apiBaseUrl}all-status-mentorAppointments';
String fileAttachmentUrl = '${apiBaseUrl}appointment-attachments';
String mentorArchivedAppointmentUrl =
    '${apiBaseUrl}mentor/archieved-appointment';
String mentorUnArchivedAppointmentUrl =
    '${apiBaseUrl}mentor/unarchieved-appointment';

///---appointment-log-user
String getAppointmentsDetailURL = '${apiBaseUrl}appointmentDetails';

/// Blogs
String categoriesBlogUrl = '${apiBaseUrl}categoriesBlogs';
String blogCategoriesUrl = '${apiBaseUrl}blogCategories';
String createConsultantBlogUrl = '${apiBaseUrl}create_consultant_blog';
String consultantBlogUrl = '${apiBaseUrl}consultant_blogs';
String blogDetailUrl = '${apiBaseUrl}blogDetail';
String updateConsultantBlogUrl = '${apiBaseUrl}update_consultant_blog';
String deleteConsultantBlogUrl = '${apiBaseUrl}delete_consultant_blog';

///---lawyer-reviews
String getLawyerReviews = '${apiBaseUrl}filter_lawyer_reviews';

/// wallet
String getWalletBalanceURL = '${apiBaseUrl}get_current_balance';
String getWalletTransactionURL = '${apiBaseUrl}get_wallet_transactions';
String getWalletWithdrawalURL = '${apiBaseUrl}get_wallet_withdrawls';
String withdrawAmountURL = '${apiBaseUrl}withdraw_amount';

/// rating
String createRatingUrl = '${apiBaseUrl}create-rating';
String getExistRatingUrl = '${apiBaseUrl}rating-exist-appointment';

///---agora
String getAgoraTokenUrl = '${apiBaseUrl}lawyers/api_generate_agora_token';

///---Make Agora Call
String makeAgoraCall = '${apiBaseUrl}lawyers/api_make_agora_call';

///--- Send Call Notification
String sendCallNotification = '${apiBaseUrl}lawyers/api_send_notification';

///---send-message
String sendSMSUrl = '${apiBaseUrl}send-sms';

///---get-device-id
String fcmUpdateUrl = '${apiBaseUrl}fcm-store-token';
String fcmGetUrl = '${apiBaseUrl}fcm-get-tokens';

///---chat services
String getMessagesUrl = '${apiBaseUrl}lawyers/api_get_chat_messages/';
String sendMessageUrl = '${apiBaseUrl}lawyers/api_send_chat_message';

///---reset-password
String forgotPasswordUrl = '${apiBaseUrl}auth/forgot_password';
String newPasswordUrl = '${apiBaseUrl}reset-password';

/// All Settings
String getAllSettingUrl = '${apiBaseUrl}settings';

/// Get Terms and Conditions
String getTermsConditionsUrl = '${apiBaseUrl}terms_conditions';

// Generate Appointment Schedule Slots Lawyer
String generateAppointmentScheduleSlotsUrl =
    '${apiBaseUrl}lawyers/save_appointment_schedules';

// Generate Appointment Schedule Slots for Single Day Lawyer
String generateAppointmentScheduleSlotsForSingleDayUrl =
    '${apiBaseUrl}lawyers/add_new_appointment_schedules';

// Get Appointment Commission
String getAppointmentScheduleCommissionUrl =
    '${apiBaseUrl}lawyers/get_appointment_commission';

String deleteAppointmentScheduleSlotsUrl =
    '${apiBaseUrl}lawyers/delete_appointment_slots';

// Get Appointment Schedule Slots Lawyer
String getAppointmentScheduleSlotsUrl =
    '${apiBaseUrl}lawyers/api_appointment_schedules';

// Get Lawyer Appointment History
String getLawyerAppointmentHistory =
    "${apiBaseUrl}lawyers/get_filter_appointment_logs";

// Update Appointment Status Code
String updateAppointmentStatusCodeURL =
    "${apiBaseUrl}lawyers/update_appointment_status/";

// Content Pages URls
String contentPagesURL = "${apiBaseUrl}company_page";

// Open Web View For Pricing Plan
String webViewForPricingPlanURL = "${baseUrl}pricing/lawyer";
