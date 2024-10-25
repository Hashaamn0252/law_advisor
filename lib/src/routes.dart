import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant_for_lawyers/src/screens/forgot_password_screen.dart';
import 'package:lawyer_consultant_for_lawyers/src/screens/payment_detail_screen.dart';
import 'package:lawyer_consultant_for_lawyers/src/screens/subscription_pricing_plan_screen.dart';

import 'screens/about_us_screen.dart';
import 'screens/agora_call/join_channel_audio.dart';
import 'screens/agora_call/join_channel_video.dart';
import 'screens/appointment_detail_screen.dart';
import 'screens/appointment_history_screen.dart';
import 'screens/blog_detail_screen.dart';
import 'screens/blogs_screen.dart';
import 'screens/contact_us_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/invitations_screen.dart';
import 'screens/lawyer_profile_setup_screen.dart';
import 'screens/live_chat_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/schedule_app_slots_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/lawyer_profile_screen.dart';
import 'screens/wallet_screen.dart';
import 'widgets/bottom_navigation_widget.dart';

appRoutes() => [
      GetPage(name: '/splashscreen', page: () => const SplashScreen()),
      GetPage(name: '/introscreen', page: () => const IntroScreen()),
      GetPage(name: '/homescreen', page: () => const BottomNavigationWidget()),
      GetPage(
          name: '/lawyerprofilescreen',
          page: () => const LawyerProfileScreen()),
      GetPage(
          name: '/lawyerprofilesetupscreen',
          page: () => const LawyerProfileSetupScreen()),
      // GetPage(
      //     name: '/notificationsscreen',
      //     page: () => const NotificationsScreen()),
      GetPage(
          name: '/invitationsscreen', page: () => const InvitationsScreen()),
      GetPage(
          name: '/userprofilescreen', page: () => const LawyerProfileScreen()),
      GetPage(name: '/contactusscreen', page: () => const ContactUsScreen()),
      GetPage(name: '/aboutusscreen', page: () => const AboutUsScreen()),
      GetPage(
          name: '/appointmenthistoryscreen',
          page: () => const AppointmentHistoryScreen()),
      GetPage(
          name: '/appointmenthistorydetailscreen',
          page: () => const AppointmentDetailScreen()),
      GetPage(name: '/walletscreen', page: () => const WalletScreen()),
      GetPage(
          name: '/pricingplanscreen',
          page: () => const SubscriptionPricingPlanScreen()),
      GetPage(
          name: '/paymentdetailscreen',
          page: () => const PaymentDetailScreen()),
      GetPage(name: '/blogsscreen', page: () => const BlogsScreen()),
      GetPage(name: '/blogdetailscreen', page: () => BlogDetailScreen()),

      // GetPage(name: '/eventsscreen', page: () => const EventsScreen()),
      // GetPage(name: '/eventdetailscreen', page: () => EventDetailScreen()),
      GetPage(name: '/signinscreen', page: () => SigninScreen()),
      GetPage(name: '/signupscreen', page: () => SignupScreen()),
      GetPage(
          name: '/scheduleappslots',
          page: () => const ScheduleAppSlotsScreen()),
      GetPage(name: '/videocallscreen', page: () => const JoinChannelVideo()),
      GetPage(name: '/audiocallscreen', page: () => const JoinChannelAudio()),
      GetPage(name: '/livechatscreen', page: () => const LiveChatScreen()),
      GetPage(
          name: '/forgotpasswordscreen', page: () => ForgotPasswordScreen()),
      GetPage(
          name: '/privacypolicyscreen',
          page: () => const PrivacyPolicyScreen()),
    ];

class PageRoutes {
  static const String splashScreen = '/splashscreen';
  static const String introScreen = '/introscreen';
  static const String homeScreen = '/homescreen';
  static const String lawyerProfileScreen = '/lawyerprofilescreen';
  static const String lawyerProfileSetupScreen = '/lawyerprofilesetupscreen';
  static const String notificationsScreen = '/notificationsscreen';
  static const String invitationsScreen = '/invitationsscreen';
  static const String userProfileScreen = '/userprofilescreen';
  static const String contactusScreen = '/contactusscreen';
  static const String aboutusScreen = '/aboutusscreen';
  static const String appointmentHistoryScreen = '/appointmenthistoryscreen';
  static const String appointmentHistoryDetailScreen =
      '/appointmenthistorydetailscreen';
  static const String walletScreen = '/walletscreen';
  static const String pricingPlanScreen = '/pricingplanscreen';
  static const String paymentDetailScreen = '/paymentdetailscreen';
  static const String blogsScreen = '/blogsscreen';
  static const String blogDetailScreen = '/blogdetailscreen';
  static const String eventsScreen = '/eventsscreen';
  static const String eventDetailScreen = '/eventdetailscreen';
  static const String signinScreen = '/signinscreen';
  static const String signupScreen = '/signupscreen';
  static const String videoCallScreen = '/videocallscreen';
  static const String audioCallScreen = '/audiocallscreen';
  static const String scheduleAppSlots = '/scheduleappslots';
  static const String liveChatScreen = '/livechatscreen';
  static const String forgotPasswordScreen = '/forgotpasswordscreen';
  static const String privacyPolicyScreen = '/privacypolicyscreen';

  Map<String, WidgetBuilder> appRoutes() {
    return {
      splashScreen: (context) => const SplashScreen(),
      introScreen: (context) => const IntroScreen(),
      homeScreen: (context) => const BottomNavigationWidget(),
      lawyerProfileScreen: (context) => const LawyerProfileScreen(),
      lawyerProfileSetupScreen: (context) => const LawyerProfileSetupScreen(),
      // notificationsScreen: (context) => const NotificationsScreen(),
      invitationsScreen: (context) => const InvitationsScreen(),
      userProfileScreen: (context) => const LawyerProfileScreen(),
      contactusScreen: (context) => const ContactUsScreen(),
      aboutusScreen: (context) => const AboutUsScreen(),
      appointmentHistoryScreen: (context) => const AppointmentHistoryScreen(),
      appointmentHistoryDetailScreen: (context) =>
          const AppointmentDetailScreen(),
      walletScreen: (context) => const WalletScreen(),
      pricingPlanScreen: (context) => const SubscriptionPricingPlanScreen(),
      paymentDetailScreen: (context) => const PaymentDetailScreen(),
      blogsScreen: (context) => const BlogsScreen(),
      blogDetailScreen: (context) => BlogDetailScreen(),
      // eventsScreen: (context) => const EventsScreen(),
      // eventDetailScreen: (context) => EventDetailScreen(),
      signinScreen: (context) => SigninScreen(),
      signupScreen: (context) => SignupScreen(),
      scheduleAppSlots: (context) => const ScheduleAppSlotsScreen(),
      videoCallScreen: (context) => const JoinChannelVideo(),
      audioCallScreen: (context) => const JoinChannelAudio(),
      liveChatScreen: (context) => const LiveChatScreen(),
      forgotPasswordScreen: (context) => ForgotPasswordScreen(),
      privacyPolicyScreen: (context) => const PrivacyPolicyScreen(),
    };
  }
}
