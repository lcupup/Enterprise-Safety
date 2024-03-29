//
//  DWUploadSessionManager.h
//  Demo
//
//  Created by zwl on 2019/8/5.
//  Copyright © 2019 com.bokecc.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DWUploadModel.h"

@protocol DWUploadSessionManagerDelegate <NSObject>

@optional
//开始上传
-(void)uploadSessionManagerBeginWithUploadModel:(DWUploadModel *)uploadModel;

//更新上传状态
-(void)uploadSessionManagerUploadModel:(DWUploadModel *)uploadModel WithState:(DWUploadState)state;

//更新上传进度
-(void)uploadSessionManagerUploadModel:(DWUploadModel *)uploadModel totalBytesSent:(int64_t)totalBytesSent WithExpectedToSend:(int64_t)expectedToSend;

//上传失败回调
-(void)uploadSessionManagerUploadModel:(DWUploadModel *)uploadModel WithError:(NSError *)error;

//后台任务完成时回调
-(void)uploadBackgroundSessionCompletion;


@end

@interface DWUploadSessionManager : NSObject

/**
 上传数据列表
 */
@property(nonatomic,strong,readonly)NSArray <DWUploadModel *> * uploadModelList;

/**
 代理
 */
@property(nonatomic,weak) id <DWUploadSessionManagerDelegate> delegate;

/**
 初始化DWUploadSessionManager
 
 @return DWUploadSessionManager对象
 */
+(DWUploadSessionManager *)manager;


/**
 初始化上传对象

 @param userId 用户ID，不能为nil
 @param apikey  用户秘钥，不能为nil
 @param title 视频标题，不能为nil
 @param description  视频描述
 @param tag 视频标签
 @param path 视频路径，不能为nil
 @param notifyURL 通知URL
 @return 上传对象model
 */
+(DWUploadModel *)createUploadModelWithUserId:(NSString *)userId
                             Apikey:(NSString *)apikey
                         VideoTitle:(NSString *)title
                   VideoDescription:(NSString *)description
                           VideoTag:(NSString *)tag
                          VideoPath:(NSString *)videoPath
                         CategoryId:(NSString *)categoryId
                          NotifyURL:(NSString *)notifyURL;

/**
 添加视频水印，请在调用startWithUploadModel:方法前设置，否则不生效。

 @param uploadModel DWUploadModel对象
 @param text 水印文字内容, 1-50个字符，数字、字母、汉字，不填写则文字水印不生效
 @param corner 水印位置0,左上 1右上 2左下 3右下，默认3，非必填
 @param offsetX X轴偏移像素值，要求大于0，默认值5,超出视频大小按默认值，非必填
 @param offsetY Y轴偏移像素值，要求大于0，默认值5,超出视频大小按默认值，非必填
 @param fontFamily 字体类型：0,微软雅黑 1宋体 2黑体，默认0，非必填
 @param fontSize 字体大小，[0-100]，默认12
 @param fontColor 16进制字体颜色，如#FFFFFF，不能写#号，默认灰色D3D3D3，非必填
 @param fontAlpha 透明度，[0-100],默认100，100为不透明，非必填
 @return 是否设置成功。YES 设置成功，NO 设置失败，参数不合法
 */
-(BOOL)insertWaterMarkWithUploadModel:(DWUploadModel *)uploadModel
                                 Text:(NSString *)text
                               Corner:(NSNumber *)corner
                              OffsetX:(NSNumber *)offsetX
                              OffsetY:(NSNumber *)offsetY
                           FontFamily:(NSNumber *)fontFamily
                             FontSize:(NSNumber *)fontSize
                            FontColor:(NSString *)fontColor
                            FontAlpha:(NSNumber *)fontAlpha;

/**
 保存视频文件，以供上传使用
 
 @param videoPath 视频文件路径
 @return 本地文件路径
 */
-(NSString *)moveToLocalWithVideoPath:(NSString *)videoPath;

/**
 开始上传任务

 @param uploadModel DWUploadModel对象
 */
-(void)startWithUploadModel:(DWUploadModel *)uploadModel;


/**
 暂停上传任务

 @param uploadModel DWUploadModel对象
 */
-(void)suspendWithUploadModel:(DWUploadModel *)uploadModel;


/**
 继续上传任务

 @param uploadModel DWUploadModel对象
 */
-(void)resumeWithUploadModel:(DWUploadModel *)uploadModel;

/**
 删除上传任务

 @param uploadModel DWUploadModel对象
 */
-(void)deleteWithUploadModel:(DWUploadModel *)uploadModel;

/**
 获取appdelegate，handleEventsForBackgroundURLSession事件回调
 
 @param identifier identifier
 @param completionHandler completionHandler
 */
-(void)setUploadSession:(NSString *)identifier CompletionHandler:(void (^)())completionHandler;

@end
