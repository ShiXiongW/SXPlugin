//
//  WCommonUtils.m
//  TopiOSBaseLib
//
//  Created by wangshixiong on 2020/6/24.
//  Copyright © 2020 WSX. All rights reserved.
//

#import "WCommonUtils.h"
#import "UIColor+WColor.h"
#import <sys/utsname.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>


//APP信息
static NSDictionary *const APPInfo()
{
    return [NSBundle mainBundle].infoDictionary;
}

NSString *AppBudleName() {
    return [APPInfo() objectForKey:@"CFBundleName"];
}
NSString *APPBundleId() {
    return [APPInfo() objectForKey:@"CFBundleIdentifier"];
}
NSString *APPBundleVersion() {
    return [APPInfo() objectForKey:@"CFBundleShortVersionString"];
}
NSString *APPBundleBuild() {
    return [APPInfo() objectForKey:@"CFBundleVersion"];
}


//获取手机设备信息
NSString *PhoneName(void) {
    return [UIDevice currentDevice].name;
}
NSString *PhoneModel(void) {
    return [UIDevice currentDevice].model;
}
NSString *PhoneSystemName(void) {
    return [UIDevice currentDevice].systemName;
}
NSString *PhoneSystemVersion(void) {
    return [UIDevice currentDevice].systemVersion;
}
NSString *PhoneDetailModel(void) {
//    需要导入头文件：#import <sys/utsname.h>
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";//国行、日版、港行
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";//港行、国行
    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";//美版、台版
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";//美版、台版
    
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone 8";//国行(A1863)、日行(A1906)
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone 8";//美版(Global/A1905)
    
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";//国行(A1864)、日行(A1898)
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";//美版(Global/A1897)
    
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone X";//国行(A1865)、日行(A1902)
    if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone X";//美版(Global/A1901)
    
    if ([platform isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([platform isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    
    if ([platform isEqualToString:@"iPhone12,1"]) return @"iPhone 11";
    if ([platform isEqualToString:@"iPhone12,3"]) return @"iPhone 11 Pro";
    if ([platform isEqualToString:@"iPhone12,5"]) return @"iPhone 11 Pro Max";
    
    return platform;
}


//页面布局尺寸
CGFloat MainScreenWidth() {
    return [UIScreen mainScreen].bounds.size.width;
}
CGFloat MainScreenHeight() {
    return [UIScreen mainScreen].bounds.size.height;
}
CGFloat SizePercentWidth(CGFloat w) {
    return w / 375.0 * MainScreenWidth();
}
CGFloat SizePercentHeight(CGFloat h) {
    return h / 667.0 * MainScreenHeight();
}

static BOOL isIphoneX() {//X、XS 5.8英寸 375×812pt；XR 6.1英寸 414×896pt；XS Max 6.5英寸 414×896pt
    return (MainScreenHeight() == 812.0 || MainScreenHeight() == 896.0) ? true : false;
}
CGFloat KStatusBarHeight() {
    return isIphoneX() ? 44.0 : 20.0;
}
CGFloat KNavHeight() {
    return isIphoneX() ? 88.0 : 64.0;
}
CGFloat KTabbarHeight() {
    return isIphoneX() ? 83.0 : 49.0;
}


//颜色
UIColor *ClearColor() {
    return [UIColor clearColor];
}
UIColor *WhiteColor() {
    return [UIColor whiteColor];
}
UIColor *BlackColor() {
    return [UIColor blackColor];
}
UIColor *RGBColor(CGFloat r, CGFloat g, CGFloat b) {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}
UIColor *RGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a) {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0];
}
UIColor *HexColor(NSString *hexStr) {
    return [UIColor hexColorWith:hexStr];
}


//字体
UIFont *FontSystem(CGFloat size) {
    return [UIFont systemFontOfSize:size];
}
UIFont *FontBoldSystem(CGFloat size) {
    return [UIFont boldSystemFontOfSize:size];
}
UIFont *FontCustom(NSString *fontName, CGFloat size) {
    return [UIFont fontWithName:fontName size:size];
}


//沙盒路径
NSString *DocumentPath() {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}
NSString *LibraryPath() {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}
NSString *TempPath() {
    return NSTemporaryDirectory();
}


//常用工具代码
NSData *StringToData(NSString *str) {
    return [str dataUsingEncoding:NSUTF8StringEncoding];
}
NSString *DataToString(NSData *data) {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
NSString *JsonToString(id json) {
    return DataToString([NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil]);
}
id StringToJson(NSString *str) {
    return [NSJSONSerialization JSONObjectWithData:StringToData(str) options:NSJSONReadingMutableContainers error:nil];
}
UIImage *UIImageNamed(NSString *s) {
    return [UIImage imageNamed:s];
}



BOOL ValidString(NSString *str) {
    return str != nil && [str isKindOfClass:[NSString class]] && ![str isEqualToString:@""];
}
NSString *SafeString(NSString *str) {
    return ValidString(str) ? str : @"";
}



//获取当前显示的VC
UIViewController *getCurrentVCFrom(UIViewController *rootVC) {
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = getCurrentVCFrom([(UITabBarController *)rootVC selectedViewController]);
    } else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        currentVC = getCurrentVCFrom([(UINavigationController *)rootVC visibleViewController]);
    } else {
        currentVC = rootVC;
    }
    
    return currentVC;
}

UIViewController *GetCurrentVC() {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = getCurrentVCFrom(rootViewController);
    
    return currentVC;;
}

//验证身份证合法性
BOOL ValidationIDCard(NSString *idNum) {
    if (idNum.length != 15 && idNum.length != 18) {
        return false;
    }
    
    NSString *regex2 = @"(^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$)";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    
    if ([identityCardPredicate evaluateWithObject:idNum]) {
        if (idNum.length == 18) {
            NSMutableArray *IDArray = [NSMutableArray array];
            // 遍历身份证字符串,存入数组中
            for (int i = 0; i <18; i++) {
                NSRange range = NSMakeRange(i, 1);
                NSString *subString = [idNum substringWithRange:range];
                [IDArray addObject:subString];
            }
            // 系数数组
            NSArray *coefficientArray = @[@7, @9, @10, @5, @8, @4, @2, @1, @6, @3, @7, @9, @10, @5, @8, @4, @"2"];
            // 余数数组
            NSArray *remainderArray = @[@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            // 每一位身份证号码和对应系数相乘之后相加所得的和
            int sum = 0;
            for (int i = 0; i <17; i++) {
                int coefficient = [coefficientArray[i] intValue];
                int ID = [IDArray[i] intValue];
                sum += coefficient * ID;
            }
            // 这个和除以11的余数对应的数
            NSString *str = remainderArray[(sum % 11)];
            // 身份证号码最后一位
            NSString *string = [idNum substringFromIndex:17];
            // 如果这个数字和身份证最后一位相同,则符合国家标准,返回YES
            return [str isEqualToString:string];
        }
        
        return true;
    } else {
        return false;
    }
}
//验证港澳居民来往内地通行证号合法性
BOOL ValidationHongKongandMacaoTravelPermitCard(NSString *cardNumber) {
    NSString *regex = @"(H|M)\\d{8}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", regex];
    return [pre evaluateWithObject:cardNumber];
}
//验证华侨护照合法性
BOOL ValidationOverseasChinesePassportCard(NSString *cardNumber) {
    NSString *reges = @"[0-9A-Za-z]{9}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", reges];
    return [pre evaluateWithObject:cardNumber];
}
//验证邮箱合法
BOOL ValidationEmail(NSString *emailNumber) {
    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", emailCheck];
    return [emailTest evaluateWithObject:emailNumber];
}
//验证手机号
BOOL ValidationPhoneNumber(NSString *phoneNumber) {
    NSString *phoneRegex = @"1[3456789]([0-9]){9}";
    NSPredicate *phonePre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return  [phonePre evaluateWithObject:phoneNumber];
}
//验证银行卡
BOOL ValidationBankCard(NSString *cardNumber) {
    if(cardNumber.length==0)
    {
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++)
    {
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--)
    {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo)
        {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}
//验证字符串是否符合正则表达式
BOOL ValidationStringConformRegex(NSString *string, NSString *regex) {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pre evaluateWithObject:string];
}


//显示alertView
void ShowAlertView(NSString *title, NSString *message, NSTextAlignment alignment, NSArray<UIAlertAction *> *actions) {
    if (!actions || actions.count == 0) {
        return;
    }
    
    UIAlertController *ctr = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    for (UIAlertAction *action in actions) {
        [ctr addAction:action];
    }
//    @"attributedTitle"
    
//    //修改按钮的颜色
//    [cancelAction setValue:[UIColor orangeColor] forKey:@"titleTextColor"];
    
    //设置消息文本显示位置
    NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:message];
    [messageAtt addAttribute:NSFontAttributeName value:FontSystem(13.0) range:NSMakeRange(0, message.length)];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = alignment;
    [messageAtt addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, message.length)];
    [ctr setValue:messageAtt forKey:@"attributedMessage"];
    
    [GetCurrentVC() presentViewController:ctr animated:YES completion:nil];
}
void ShowDefaultAlertView(NSString *title, NSString *message) {
    UIAlertController *ctr = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    [ctr addAction:action];
    
    [GetCurrentVC() presentViewController:ctr animated:YES completion:nil];
}


//16进制转10进制
NSString *StringToHexString(NSString *hexString) {
    if (!ValidString(hexString)) {
        return @"";
    }
    
    long value = strtoul(hexString.UTF8String, 0, 16);
    return [NSString stringWithFormat:@"%ld", value];
}
//10进制转16进制
NSString *HexStringToString(NSInteger value) {
    return [[NSString alloc] initWithFormat:@"%1lx", (long)value];
}


//检查相机权限
void CheckCameraPermissions(void (^callback)(void)) {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (status == AVAuthorizationStatusAuthorized) {
        callback();
    } else if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                callback();
            } else {
                ShowDefaultAlertView(@"无法访问相机", @"请在iPhone的“设置-隐私-相机”中允许访问相机");
            }
        }];
    } else {
        ShowDefaultAlertView(@"无法访问相机", @"请在iPhone的“设置-隐私-相机”中允许访问相机");
    }
}
//检查麦克风权限
void CheckMicrophonePermissions(void (^callback)(void)) {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    
    if (status == AVAuthorizationStatusAuthorized) {
        callback();
    } else if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
            if (granted) {
                callback();
            } else {
                ShowDefaultAlertView(@"无法访问麦克风", @"请在iPhone的“设置-隐私-麦克风”中允许访问麦克风");
            }
        }];
    } else {
        ShowDefaultAlertView(@"无法访问麦克风", @"请在iPhone的“设置-隐私-麦克风”中允许访问麦克风");
    }
}
//检查相册权限
void CheckAlbumPermissions(void (^callback)(void)) {
    PHAuthorizationStatus author = [PHPhotoLibrary authorizationStatus];
    
    if (author == PHAuthorizationStatusAuthorized) {
        callback();
    } else if (author == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                callback();
            } else {
                ShowDefaultAlertView(@"无法访问相册", @"请在iPhone的“设置-隐私-照片”中允许访问照片");
            }
        }];
    } else {
        ShowDefaultAlertView(@"无法访问相册", @"请在iPhone的“设置-隐私-照片”中允许访问照片");
    }
}


//根据正则表达式，过滤字符串
NSString *FilterCharactorWithRegex(NSString *string, NSString *regexStr) {
    NSError *error = nil;
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:&error];

    NSString *finalStr = [expression stringByReplacingMatchesInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, string.length) withTemplate:@""];
    
    return finalStr;
}
//根据指定的字符串，过滤字符串
NSString *FilterCharactorWithSpecifyString(NSString *string, NSString *specifyStr) {
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:specifyStr];
    
    NSString *finalStr = [[string componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];
    
    return finalStr;
}
//过滤字符串中除指定字符串外的字符串（即获取字符串中的指定字符串）
NSString *FilterOtherCharactorWithSpecifyString(NSString *string, NSString *specifyStr) {
    NSCharacterSet *set = [[NSCharacterSet characterSetWithCharactersInString:specifyStr] invertedSet];//invertedSet 取反
    
    NSString *finalStr = [[string componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];
    
    return finalStr;
}


//图片压缩
NSData *CompressImageToSize(UIImage *image, CGFloat imageSize) {
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    
    if (imageData.length > imageSize * 1024.0) {
        CGFloat max = 1.0;
        CGFloat min = 0.0;
        
        CGFloat compression = 1.0;
        for (int i=0; i<6; i++) {
            compression = (max + min) / 2;
            imageData = UIImageJPEGRepresentation(image, compression);
            
            if (imageData.length > imageSize * 1024.0) {
                max = compression;
            } else if (imageData.length < imageSize * 1024.0 * 0.9) {
                min = compression;
            } else {
                break;
            }
        }
    }
    
    return imageData;
}
//压缩图片到指定的大小
UIImage *CompressImageToCGSize(UIImage *image, CGSize size) {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}
//获取view截图
UIImage *GetViewSnapShot(UIView *view) {
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


//创建文件夹
void NSFileCreateDirectory(NSString *directoryPath) {
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isDirectory = YES;
    if (![manager fileExistsAtPath:directoryPath isDirectory:&isDirectory]) {
        NSError *error = nil;
        [manager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:&error];
    }
}
//创建文件
void NSFileCreateFile(NSString *filePath) {
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:filePath]) {
        [manager createFileAtPath:filePath contents:nil attributes:nil];
    }
}
//移除文件
void NSFileRemoveFile(NSString *filePath) {
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]) {
        [manager removeItemAtPath:filePath error:nil];
    }
}



//生成指定大小尺寸的图片（处理图像变清晰）
UIImage *generateImageWithSize(CIImage *image, CGSize size)
{
    CGRect integralRect = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size.width/CGRectGetWidth(integralRect), size.height/CGRectGetHeight(integralRect));
    
    size_t width = CGRectGetWidth(integralRect)*scale;
    size_t height = CGRectGetHeight(integralRect)*scale;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:integralRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, integralRect, bitmapImage);
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

//生成指定颜色图片
void ProviderReleaseData (void *info, const void *data, size_t size){
    free((void*)data);
}
UIImage *generateImageWithRGB(UIImage *image, CGFloat r, CGFloat g, CGFloat b)
{
    int imageWidth = image.size.width;
    int imageHeight = image.size.height;
    size_t bytesPerRow = imageWidth * 4;
    uint32_t *rgbImageBuf = (uint32_t *)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpaceRef, kCGBitmapByteOrder32Little|kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    //遍历像素, 改变像素点颜色
    int pixelNum = imageWidth * imageHeight;
    uint32_t *pCurPtr = rgbImageBuf;
    for (int i = 0; i<pixelNum; i++, pCurPtr++) {
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900) {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = r;
            ptr[2] = g;
            ptr[1] = b;
        }else{
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0] = 0;
        }
    }
    //取出图片
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpaceRef,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpaceRef);
    
    return resultImage;
}


//生成条形码
CIImage *generateBarCodeCIImage(NSString *source)
{
    NSData *data = [source dataUsingEncoding:NSUTF8StringEncoding];
        
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@(0) forKey:@"inputQuietSpace"];//设置生成的条形码的上，下，左，右的margins的值
    
    CIImage *image = filter.outputImage;
    return image;
}
UIImage *generateBarCodeImage(NSString *source)
{
    CIImage *image = generateBarCodeCIImage(source);
    return [UIImage imageWithCIImage:image];
}
UIImage *generateBarCodeImageWithSize(NSString *source, CGSize size)
{
    CIImage *ciImage = generateBarCodeCIImage(source);
    
    return generateImageWithSize(ciImage, size);
}
UIImage *generateBarCodeImageWithSizeRGB(NSString *source, CGSize size, CGFloat r, CGFloat g, CGFloat b)
{
    UIImage *image = generateBarCodeImageWithSize(source, size);
    
    return generateImageWithRGB(image, r, g, b);
}



//生成二维码
CIImage *generateQrCodeCIImage(NSString *source)
{
    NSData *contentData = [source dataUsingEncoding:NSUTF8StringEncoding];
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:contentData forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    CIImage *image = qrFilter.outputImage;
    return image;
}

UIImage *generateQrCodeImage(NSString *source)
{
    CIImage *image = generateQrCodeCIImage(source);
    return [UIImage imageWithCIImage:image];
}
UIImage *generateQrCodeImageWithLogo(NSString *source, CGFloat size, UIImage *logo, CGFloat logoSize)
{
    UIImage *image = generateQrCodeImageWithSize(source, size);
    
    if (logo) {
        UIGraphicsBeginImageContextWithOptions(image.size, NO, [UIScreen mainScreen].scale);
//        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        CGFloat size = logoSize > image.size.width / 2 ? image.size.width / 2 : logoSize;
        [logo drawInRect:CGRectMake((image.size.width - size) / 2, (image.size.height - size) / 2, size, size)];
        UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return resultImage;
    } else {
        return image;
    }
}
UIImage *generateQrCodeImageWithSize(NSString *source, CGFloat size)
{
    CIImage *image = generateQrCodeCIImage(source);
    
    return generateImageWithSize(image, CGSizeMake(size, size));
}
UIImage *generateQrCodeImageWithSizeRGB(NSString *source, CGFloat size, CGFloat r, CGFloat g, CGFloat b)
{
    UIImage *image = generateQrCodeImageWithSize(source, size);
    
    return generateImageWithRGB(image, r, g, b);
}


