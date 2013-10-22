//
//  XYPrecompile.h
//  TWP_SkyBookShelf
//
//  Created by Heaven on 13-5-29.
//
//

#ifndef TWP_SkyBookShelf_XYPrecompile_h
#define TWP_SkyBookShelf_XYPrecompile_h

// 性能测试
#define __XY_PERFORMANCE__          (1)
// not used
#define __OPEN_Statistics__         (1)



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVSpeechSynthesis.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CoreMotion/CoreMotion.h>




// 第三方支持
#define __USED_FMDatabase__         (1)
#define __USED_LKDBHelper__         (1)
#define __USED_MKNetworkKit__       (1)
#define __USED_ASIHTTPRequest__     (0)
#define __USED_YYJSONHelper__       (1)
#define __USED_CocosDenshion__      (1)
#define __USED_OpenUDID__           (1)

#define __USED_IQKeyBoardManager__  (1)
#define __USED_MBProgressHUD__      (1)
#define __USED_RTLabel__            (1)


#if (1 == __USED_Statistics__)
#define UMENG
#endif

#import "CommonDefine.h"

#endif
