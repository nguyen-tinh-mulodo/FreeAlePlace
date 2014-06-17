//
//  FMConstants.h
//  FreeMarket
//
//  Created by Nguyen Huu Tinh on 8/29/13.
//  Copyright (c) 2013 Nguyen Huu Tinh. All rights reserved.
//

#ifndef FreeMarket_FMConstants_h
#define FreeMarket_FMConstants_h

//Change server type ( 1:Production; 2:Server test; )
#define _URL_DEBUG 2

#if _URL_DEBUG == 1
/**
 *  Release
 */
#define URL_Image_Avatar @"http://res.cholon.mulodo.com.vn/avatar/"
#define URL_Image @"http://res.cholon.mulodo.com.vn/image/"
#define URL_Thumb @"http://res.cholon.mulodo.com.vn/thumb/"
#define URL_DetailThumb @"http://res.cholon.mulodo.com.vn/detailthumb/"
#define URL  @"https://api.cholon.mulodo.com.vn/index.php/"
#define HOST @"www.­amazonaws.­com"
#define ID_FanPage_Facebook @"234651500071022"
/**
 *  Email support cholon++
 *
 */
#define EMAIL_SUPPORT @"cholon-vn@mulodo.com"

#elif _URL_DEBUG == 2

/**
 *  dev
 */
#define URL_Image_Avatar @"http://dev-res.cholon.mulodo.com.vn/avatar/"
#define URL_Image @"http://dev-res.cholon.mulodo.com.vn/image/"
#define URL_Thumb @"http://dev-res.cholon.mulodo.com.vn/thumb/"
#define URL_DetailThumb @"http://dev-res.cholon.mulodo.com.vn/detailthumb/"
#define URL  @"http://dev-api.cholon.mulodo.com.vn/index.php/"
#define HOST @"www.­amazonaws.­com"
#define ID_FanPage_Facebook @"682583778466644"
/**
 *  Email support cholon++
 *
 */
#define EMAIL_SUPPORT @"cholon.mulodovn@gmail.com"

#endif


/**
 *  API Key for Application
 *
 */
#define API_KEY @"HOTSDBJ29MHIU0SGO8NWO52I26YAW5D3RXUJQBE7UQGO2V5UT0GJJYZCMAP6C8638DQX59PDTG1YOEF713HWPTJTYIWFL7UMKDFP"


/**
 * ID AppleStore
 */
#define BundleID @"AVsoft.AV-Wallpapers-Free";
#define AppleStoreID 590219159;

/**
 * Limit GetProduct
 */
#define LIMIT_GETITEM 15

#define IS_IPAD    (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
#define WIDTH_VIEWPRODUCT_TOP (IS_IPAD ? [[UIScreen mainScreen] applicationFrame].size.width / 3 - 20 : [[UIScreen mainScreen] applicationFrame].size.width / 2 - 15)

/**
 *  Check
 *
 
 */
#define kUserProfileImageDidLoadNotification = @"com.alamofire.user.profile-image.loaded"

/**
 *  Facebook Access Token
 *
 */
#define URL_Facebook @"https://graph.facebook.com/"
static NSString * const kKey_FBAccessToken = @"FacebookAcccessToken";

/**
 *  Amobi ID
 a15243b96c51d0b
 a152d788e290186
 *
 */
#define ADMOBS_ID @"ca-app-pub-3696262859053526/4178980490";//@"a152d7831f94acd";
// amobi 57bd50ced8d4393b58d034ab2996f09a
/**
 *  Admob SETUP
 *
 */
#define kHeightWhenAdmod (IS_IPAD ? 90 : 50)
#define kHeightMenu (40)

/**
 *  Frame Notification Ipad
 *
 */
#define kHeightNotification 600
#define kWidthNotification 400
#define kHeightCreateTopic 600
#define kWidthCreateTopic 320


/**
 *  Avatar default and placehold image before complete loading image.
 *
 */
#define kAvatarUserDefault @"default_avatar.png"
#define kLoadImageDefault @"load_image.png"
#define kUploadLoadImageDefault @"icon_upload_img.png"
#define kPostButtonImage @"post_button.png"

/**
 *  Text field Tag
 *
 */
#define kPhoneTag 1
#define kEmailTag 2

/**
 *  User Default define
 *
 */
#define kUserDefaultUserId @"userId"
#define kUserDefaultTokenKey @"tokenKey"
#define kUserDefaultIsLogin @"isLogin"
#define kUserDefaultUserPhone @"phone"
#define kUserDefaultUserAddress @"address"
#define kUserDefaultUserUsername @"username"
#define kUserDefaultUserContactEmail @"contactEmail"
#define kUserDefaultUserEmail @"email"
#define kMessageNoLogin @"You are no login!";
#define kTitleLogout @"Do you want to logout?"
#define kTitlePushNotification @"Push Notifications?"
#define kTitleSave @"Do you want to save this?"
#define kHiddenLogin @"kHiddenLogin"
#define kTitleApp @"FreeMarket"
#define kTitleLogin @"Login"
#define kUserDefaultGoogle @"googleAuth"
#define kNotiopenBrowserToLogin @"openBrowserToLogin"
#define kUserDefaultLang @"userLanguage"

/**
 use amobi
 YES -> use admod
 NO -> not used admod
 */
#define kUseAdmod @"YES"

/**
 *  Change the HEX code to UIColor of Apple
 *
 *  @param rgbValue HEX code of Color
 *
 *  @return UIColor (id)
 */
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kMetroColorTurquoise    0x1abc9c
#define kMetroColorEmerald      0x2ecc71
#define kMetroColorPeterRiver   0x3498db
#define kMetroColorAmethyst     0x9b59b6
#define kMetroColorWetAsphalt   0x34495e
#define kMetroColorGreenSea     0x16a085
#define kMetroColorNephritis    0x27ae60
#define kMetroColorBelizeHole   0x2980b9
#define kMetroColorWisteria     0x8e44ad
#define kMetroColorMidnightBlue 0x2c3e50
#define kMetroColorSunFlower    0xf1c40f
#define kMetroColorCarrot       0xe67e22
#define kMetroColorAlizarin     0xe74c3c
#define kMetroColorClouds       0xecf0f1
#define kMetroColorConcrete     0x95a5a6
#define kMetroColorOrange       0xf39c12
#define kMetroColorPumpkin      0xd35400
#define kMetroColorPomegranate  0xc0392b
#define kMetroColorSilver       0xbdc3c7
#define kMetroColorAsbestos     0x7f8c8d
#define kMetroColorBlue         0x1a8796
#define kMetroColorGreen        0x4bc1d2
#define kMetroColorAplace        0x6eb636



/**
 *  Previse the layout for competitle with iOS 7
 */

#ifdef __IPHONE_7_0
#define kEdgeForExtendedLayout self.edgesForExtendedLayout = UIRectEdgeNone
#define kExtendedLayoutIncludesOpaqueBars self.extendedLayoutIncludesOpaqueBars = YES
#define kExtendedLayoutIncludesbarTintColor _navigation.navigationBar.barTintColor
#define UIDevicecurrentDevice [[[UIDevice currentDevice] systemVersion] floatValue] >= 7
#else
#define kEdgeForExtendedLayout NSLog(@"XCode4")
#define kExtendedLayoutIncludesOpaqueBars NSLog(@"XCode4")
#define kExtendedLayoutIncludesbarTintColor _navigation.navigationBar.tintColor
#define UIDevicecurrentDevice [[[UIDevice currentDevice] systemVersion] floatValue] < 7
#endif

#ifdef __IPHONE_6_0
# define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
#else
# define LINE_BREAK_WORD_WRAP UILineBreakModeWordWrap
#endif

/**
 *  Check again
 */
typedef enum {
    tagImage1 = 1,
    tagImage2 = 2,
    tagImage3 = 3,
    tagImage4 = 4,
    tagImage5 = 5,
    tagDefault = 0
} TagImage;

typedef enum {
    loadAll,
    loadForLoadMore,
    loadForSearch,
    loadDataDefault,
    loadRefresh
    
} LoadDataEnum;


/**
 *  Ratio to compress Image, need move
 */
#define kZipRatioOfImage 0.3

//Dicrection
#define kAvatarDirection [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"avatar/"]

/**
 *  Align
 */
#define kpaddingLeft (IS_IPAD ? 20 : 10)
#define kpaddingTop (IS_IPAD ? 20 : 10)
#define kpaddingLeftList (IS_IPAD ? 10 : 10)

/**
 *  Font size
 */
#define kFontSize10 (IS_IPAD ? 12 : 10)
#define kFontSize11 (IS_IPAD ? 13 : 11)
#define kFontSize12 (IS_IPAD ? 14 : 12)
#define kFontSize13 (IS_IPAD ? 15 : 13)
#define kFontSize14 (IS_IPAD ? 16 : 14)
#define kFontSize15 (IS_IPAD ? 17 : 15)
#define kFontSize16 (IS_IPAD ? 18 : 16)
#define kFontSize17 (IS_IPAD ? 19 : 17)
#define kFontSize18 (IS_IPAD ? 20 : 18)
#define kFontSize20 (IS_IPAD ? 22 : 20)

/**
 *  Font size
 */
#define kheigthAvatar (IS_IPAD ? 90 : 70)
#define kheigthAvatarSmall (IS_IPAD ? 70 : 53)



#endif
#define kAPDetailStadiumViewController @"APDetailStadiumViewController"
#define ktest @"test"
#define kRevovemore @"kRevovemore"

#define kAleViewController @"AleViewController"
#define kRemoveAPTeamViewController @"kRemoveAPTeamViewController"
#define kRemoveAPEcheduleViewController @"kRemoveAPEcheduleViewController"
#define kRemoveAPResultViewController @"kRemoveAPResultViewController"
#define kRemoveStadiumViewController @"kRemoveStadiumViewController"
#define kRemoveDataListViewController @"kRemoveDataListViewController"
#define kRemoveDetailPlaceViewController @"kRemoveDetailPlaceViewController"
#define kRemoveMapViewController @"kRemoveMapViewController"
#define kRemoveStadiumDetailViewController @"kRemoveStadiumDetailViewController"
#define kRemovePlaceDetailViewController @"kRemovePlaceDetailViewController"

#define kRemoveAPShowFullMapViewController @"kRemoveAPShowFullMapViewController"
#define editTitle @"editTitle"
#define kIdCity  @"kIdCity";
#define kNameView @"nameView"

#define titleHome  @"ALEPLACE";
#define titleDetailEvent  @"SPORT EVENT";
#define titleStadium  @"STADIUM";

