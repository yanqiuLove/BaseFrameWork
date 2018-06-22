//
//  SCConstString.h
//  SanChiStudent
//
//  Created by xhwl on 16/8/18.
//  Copyright © 2016年 学会未来. All rights reserved.
//  常量字符串

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SCConstString : NSObject

// 通知
UIKIT_EXTERN NSString *const JumpToElectronicJournalsViewController;
UIKIT_EXTERN NSString *const JumpToVipPrefectureDetailViewController;
UIKIT_EXTERN NSString *const FromElectronJournaljumpToVipPrefectureDetailViewController;
UIKIT_EXTERN NSString *const JumpToVipPrefectureVideoListViewController;
UIKIT_EXTERN NSString *const JumpToMeetingDetailViewController;
UIKIT_EXTERN NSString *const JumpToVipPrefectVideoDetailViewController;
UIKIT_EXTERN NSString *const JumpToArticlesViewController;
UIKIT_EXTERN NSString *const VipPrefectureButtonIndexNotification;
UIKIT_EXTERN NSString *const MeetingManagmentButtonIndexNotification;
UIKIT_EXTERN NSString *const ElectronicJournalButtonIndexNotification;
UIKIT_EXTERN NSString *const RefreshInformation;

// 登录成功
UIKIT_EXTERN NSString *const LoginSuccessNotification;
// 退出成功的通知
UIKIT_EXTERN NSString *const LogOutSuccessNotification;
// 首页刷新完成
UIKIT_EXTERN NSString *const NewsEndRefreshNotification;
// session消息发送改变
UIKIT_EXTERN NSString *const UpdateRecentSessionNotification;
// 首页测评step发生改变
UIKIT_EXTERN NSString *const TestStepChangedNotification;
// 更新本地用户信息
UIKIT_EXTERN NSString *const UpdateLocalUserInfoNotification;


@end
