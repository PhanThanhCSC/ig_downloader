enum ActionType {
  CREATE,
  EDIT,
}

enum BookingAction {
  CREATE,
  EDIT,
}

enum BookingType {
  HOME,
  HOSPITAL,
  PACKAGE, //Đặt gói khám
  VIDEO_CALL,
}

//895  - test PCR / 896 - test Nhanh
enum BookingCovidType {
  QUICK_TEST,
  PCR_SAR,
}

enum AppointmentType {
  SCHEDULE,
  PACKAGE, //Đặt gói khám
  COVID,
  VIDEO_CALL,
}
enum AppointmentMethodType {
  HOME,
  HOSPITAL,
}

enum RatingType {
  DOCTOR,
  HOSPITAL,
  PACKAGE, //Đặt gói khám
  VIDEO_CALL,
}

enum SearchWidgetType { NEWS, HOSPITAL, PACKAGE }

enum GenderType { MALE, FEMALE, BOTH, OTHER }

enum RelationType { CHILD, WIFE, HUSBAND, DAD, MOTHER, OTHER }

enum BannerType { BANNER_NEWS, BANNER_PACKAGE, BANNER_VC, BANNER_XNTN, BANNER_HOS, BANNER_LINK, BANNER_VIEW }

