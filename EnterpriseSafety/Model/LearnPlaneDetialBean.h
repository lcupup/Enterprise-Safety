//
//  LearnPlaneBean.h
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/17.
//  Copyright © 2020 chao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LearnPlaneBeanFrame.h"


NS_ASSUME_NONNULL_BEGIN

@interface LearnPlaneDetialBean : NSObject


@property(strong,nonatomic) NSMutableArray *totalDataArr;

@property(strong,nonatomic) NSMutableArray * sectionTitleArr;

@property(strong,nonatomic) NSDictionary * messageDic;
@property(strong,nonatomic) NSArray * articleDicArr;
@property(nonatomic,strong) NSString * clazzID;

-(void) setMessageDic:(NSDictionary * )messageDic setArticleDicArr:(nullable  NSArray * )  articleDicArr;

@end

/**
 标题封装类
 */
@interface SectionTitleBean : NSObject

@property(nonatomic,strong) NSString * titleStr;
@property(nonatomic,strong) NSString * tipsStr;
@property(nonatomic,strong) NSString * progressTipsStr;
@property(nonatomic,strong) NSString * sectionType;

@end
/**
 课程  包含 必修 选修
 */
@interface CourseBean: NSObject
@property(strong,nonatomic)NSString * courseName;
@property(nonatomic,strong) NSString *  courseID;
@property(nonatomic,assign) BOOL isStartLearn;
@property(nonatomic,assign) BOOL  isPassed;
@property(nonatomic,assign) int    trackType;

//左侧 状态图片 当为正常学习模式 按学习进度实时显示，其余不显示
@property(nonatomic,strong) NSString * courseLeftStatusIcon;
//右侧 状态图片
@property(nonatomic,strong) NSString * courseRightStatusIcon;
@end
/**
 阅读
 */
@interface ArticleBean : NSObject
@property(strong,nonatomic)NSString * articleTitle;
@property(strong,nonatomic)NSString * articleImg;
@property(strong,nonatomic)NSString * articleID;
@property(assign,nonatomic)BOOL isPassed;
@end
/**
 测评
 */
@interface ExamBean : NSObject
@property(strong,nonatomic) NSString * examTitle;
@property(strong,nonatomic) NSString * examTime;
@property(strong,nonatomic) NSString * examScore;
@property(strong,nonatomic) NSString * examChance;
@property(strong,nonatomic) NSString * examDuration;

//@property(assign,nonatomic) int examDuracation;
@property(assign,nonatomic) BOOL  isPassed;
@property(assign,nonatomic) long examStartTime;
@property(assign,nonatomic) long examEndTime;
//学习模式
@property(assign,nonatomic) int learnMode;
//通过分数
@property(assign,nonatomic) int passScore;

@end



NS_ASSUME_NONNULL_END
