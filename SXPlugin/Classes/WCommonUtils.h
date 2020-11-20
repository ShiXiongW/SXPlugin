//
//  WCommonUtils.h
//  TopiOSBaseLib
//
//  Created by wangshixiong on 2020/6/24.
//  Copyright © 2020 WSX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//APP信息
extern NSString *AppBudleName(void);
extern NSString *APPBundleId(void);
extern NSString *APPBundleVersion(void);
extern NSString *APPBundleBuild(void);

//获取手机设备信息
extern NSString *PhoneName(void);
extern NSString *PhoneModel(void);
extern NSString *PhoneSystemName(void);
extern NSString *PhoneSystemVersion(void);
extern NSString *PhoneDetailModel(void);

//页面布局尺寸
extern CGFloat MainScreenWidth(void);
extern CGFloat MainScreenHeight(void);
extern CGFloat SizePercentWidth(CGFloat w);
extern CGFloat SizePercentHeight(CGFloat h);

extern CGFloat KStatusBarHeight(void);
extern CGFloat KNavHeight(void);
extern CGFloat KTabbarHeight(void);

//颜色
extern UIColor *ClearColor(void);
extern UIColor *WhiteColor(void);
extern UIColor *BlackColor(void);
extern UIColor *RGBColor(CGFloat r, CGFloat g, CGFloat b);
extern UIColor *RGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a);
extern UIColor *HexColor(NSString *hexStr);

//字体
extern UIFont *FontSystem(CGFloat size);
extern UIFont *FontBoldSystem(CGFloat size);
extern UIFont *FontCustom(NSString *fontName, CGFloat size);

//沙盒路径
extern NSString *DocumentPath(void);
extern NSString *LibraryPath(void);
extern NSString *TempPath(void);

//常用工具代码
extern NSData *StringToData(NSString *str);
extern NSString *DataToString(NSData *data);
extern NSString *JsonToString(id json);
extern id StringToJson(NSString *str);
extern UIImage *UIImageNamed(NSString *s);

extern BOOL ValidString(NSString *str);
extern NSString *SafeString(NSString *str);




//获取当前显示的VC
UIViewController *GetCurrentVC(void);


//验证身份证合法性
BOOL ValidationIDCard(NSString *idNum);
//验证港澳居民来往内地通行证号合法性
BOOL ValidationHongKongandMacaoTravelPermitCard(NSString *cardNumber);
//验证华侨护照合法性
BOOL ValidationOverseasChinesePassportCard(NSString *cardNumber);
//验证邮箱合法
BOOL ValidationEmail(NSString *emailNumber);
//验证手机号
BOOL ValidationPhoneNumber(NSString *phoneNumber);
//验证银行卡
BOOL ValidationBankCard(NSString *cardNumber);
//验证字符串是否符合正则表达式
BOOL ValidationStringConformRegex(NSString *string, NSString *regex);


//显示alertView
void ShowAlertView(NSString *title, NSString *message, NSTextAlignment alignment, NSArray<UIAlertAction *> *actions);
void ShowDefaultAlertView(NSString *title, NSString *message);


//16进制转10进制
NSString *StringToHexString(NSString *hexString);
//10进制转16进制
NSString *HexStringToString(NSInteger value);


//检查相机权限
void CheckCameraPermissions(void (^callback)(void));
//检查麦克风权限
void CheckMicrophonePermissions(void (^callback)(void));
//检查相册权限
void CheckAlbumPermissions(void (^callback)(void));


//根据正则表达式，过滤字符串
NSString *FilterCharactorWithRegex(NSString *string, NSString *regexStr);
//根据指定的字符串，过滤字符串
NSString *FilterCharactorWithSpecifyString(NSString *string, NSString *specifyStr);
//过滤字符串中除指定字符串外的字符串（即获取字符串中的指定字符串）
NSString *FilterOtherCharactorWithSpecifyString(NSString *string, NSString *specifyStr);


//图片压缩
NSData *CompressImageToSize(UIImage *image, CGFloat imageSize);
//压缩图片到指定的大小
UIImage *CompressImageToCGSize(UIImage *image, CGSize size);
//获取view截图
UIImage *GetViewSnapShot(UIView *view);


//创建文件夹
void NSFileCreateDirectory(NSString *directoryPath);
//创建文件
void NSFileCreateFile(NSString *filePath);
//移除文件
void NSFileRemoveFile(NSString *filePath);



//生成条形码
UIImage *generateBarCodeImage(NSString *source);
UIImage *generateBarCodeImageWithSize(NSString *source, CGSize size);
UIImage *generateBarCodeImageWithSizeRGB(NSString *source, CGSize size, CGFloat r, CGFloat g, CGFloat b);

//生成二维码
UIImage *generateQrCodeImage(NSString *source);
UIImage *generateQrCodeImageWithSize(NSString *source, CGFloat size);
UIImage *generateQrCodeImageWithLogo(NSString *source, CGFloat size, UIImage *logo, CGFloat logoSize);
UIImage *generateQrCodeImageWithSizeRGB(NSString *source, CGFloat size, CGFloat r, CGFloat g, CGFloat b);


