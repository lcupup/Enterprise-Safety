//
//  LearnPlaneBeanFrame.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/19.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LearnPlaneBeanFrame.h"
#import "LearnPlaneDetialBean.h"

@implementation LearnPlaneBeanFrame

@end


@implementation LearnPlaneDetialBeanCourseFrame

- (void)setCourseBean:(CourseBean *)courseBean{
    _courseBean=courseBean;
    
    CGFloat courseTitleX=LCMAEGIN_15;
    CGFloat courseTitleW=SCREEN_WIDTH-20-LCMAEGIN_15;
    if (courseBean.trackType==TRACK_TYPE_COMMON) {
        CGFloat courseLeftStatusX=LCMAEGIN_15;
        CGFloat courseLeftStatusY=LCMAEGIN_15;
        CGFloat courseLeftStatusW=20;
        CGFloat courseLeftStatusH=20;
        self.courseLeftStatusF=CGRectMake(courseLeftStatusX, courseLeftStatusY, courseLeftStatusW, courseLeftStatusH);
        courseTitleX=LCMAEGIN_15*2+20;
        courseTitleW-=courseLeftStatusW;
    }
    
    CGFloat courseRightStatusW=20;
    CGFloat courseRightStatusH=20;
    CGFloat courseRightStatusX=SCREEN_WIDTH-LCMAEGIN_15-courseRightStatusW;
    CGFloat courseRightStatusY=LCMAEGIN_15;
    self.courseRightStatusF=CGRectMake(courseRightStatusX, courseRightStatusY, courseRightStatusW, courseRightStatusH);
    
  
    CGFloat courseTitleY=LCMAEGIN_15;

    CGFloat courseTitleH=20;
    self.courseTitleF=CGRectMake(courseTitleX, courseTitleY, courseTitleW, courseTitleH);
    
    self.cellHeight=LCMAEGIN_15+CGRectGetMaxY(_courseTitleF);
    
}

@end


@implementation LearnPlaneDetailArticleFrame

-(void)setArticleBean:(ArticleBean *)articleBean{
    _articleBean=articleBean;
    
    
    CGFloat articleImgH=60;
    CGFloat articleImgW=80;
    CGFloat articleImgX=SCREEN_WIDTH-articleImgW-LCMAEGIN_15;
    CGFloat articleImgY=LCMAEGIN_15;
    
    CGFloat articleTitleX=LCMAEGIN_15;
    CGFloat articleTitleY=LCMAEGIN_15;
    CGFloat articleTitleW;
    
    CGFloat articleStatusH=20;
    CGFloat articleStatusW=20;
    CGFloat articleStatusX=LCMAEGIN_15;
    CGFloat articleStatusY=LCMAEGIN_15;
    
    if(articleBean.articleImg.length==0){
        articleTitleW=SCREEN_WIDTH-LCMAEGIN_15*2;
    }else{
        articleTitleW=SCREEN_WIDTH-articleImgW-LCMAEGIN_15;
        self.articleImgF=CGRectMake(articleImgX, articleImgY, articleImgW, articleImgH);
    }
    if (articleBean.isPassed) {
        articleStatusX+=LCMAEGIN_15;
        self.articleStatusF=CGRectMake(articleStatusX, articleStatusY, articleStatusW, articleStatusH);
        articleTitleW=articleTitleW-CGRectGetMaxX(self.articleStatusF);
    }
    
    CGSize articleSize=[LCUtils get15LabelSize:articleBean.articleTitle viewWith:articleTitleW];
    CGFloat articleSingleHeight=[LCUtils getSingleHeight:articleTitleW fontsize:LCFont15];
    CGFloat articleTitleHeight;
    if (articleSize.height>articleSingleHeight*2) {
        articleTitleHeight=articleSingleHeight*2;
    }else{
        articleTitleHeight=articleSize.height;
    }
    self.articleTitleF=CGRectMake(articleTitleX, articleTitleY, articleTitleW, articleTitleHeight);
    self.articleImgF=CGRectMake(articleImgX, articleImgY, articleImgW, articleImgH);
    
    if (articleBean.articleImg.length!=0) {
        self.cellHeight=CGRectGetMaxY(_articleImgF)+LCMAEGIN_15;
    }else{
        self.cellHeight=CGRectGetMaxY(_articleTitleF)+LCMAEGIN_15;
    }
}

@end


@implementation LearnPlaneDetailExamFrame

-(void) setExamBean:(ExamBean *)examBean{
    _examBean=examBean;

    CGFloat examTitleX=LCMAEGIN_15;
    CGFloat examTitleY=LCMAEGIN_15;
    CGFloat examTitleH=20;
    CGFloat examTitleW=SCREEN_WIDTH-LCMAEGIN_15*2;
    
    self.examTitleF=CGRectMake(examTitleX, examTitleY, examTitleW, examTitleH);
    
    CGFloat examTimeX=LCMAEGIN_15;
    CGFloat examTimeY=CGRectGetMaxY(_examTitleF)+LCMAEGIN_15;
    CGFloat examTimeH=15;
    CGFloat examTineW=SCREEN_WIDTH-LCMAEGIN_15*2;
    
    self.examTimeF=CGRectMake(examTimeX, examTimeY, examTineW, examTimeH);
    
    CGFloat examDurationX=200;
    CGFloat examDurationY=examTimeY;
    CGFloat examDurationW=80;
    CGFloat examDurationH=15;
    
    self.examDurationF=CGRectMake(examDurationX, examDurationY, examDurationW, examDurationH);
    
    
    if(examBean.examScore.length!=0){
        
        CGFloat examScoreX= LCMAEGIN_15;
        CGFloat examScoreY=CGRectGetMaxY(self.examTimeF)+LCMAEGIN_15;
        CGFloat examScoreW= 120;
        CGFloat examScoreH= 15;
        self.examScoreF=CGRectMake(examScoreX, examScoreY, examScoreW, examScoreH);
    }
    if (examBean.examChance.length!=0) {
        CGFloat examChanceX;
        if (examBean.examScore.length==0) {
            examChanceX=LCMAEGIN_15;
        }else{
            examChanceX=135;
        }
        CGFloat examChanceY=CGRectGetMaxY(self.examTimeF)+LCMAEGIN_15;
        CGFloat examChanceW=200;
        CGFloat examChanceH=15;
        self.examChanceF=CGRectMake(examChanceX, examChanceY, examChanceW, examChanceH);
    }
    
    
    
    if (examBean.examChance.length==0&&examBean.examScore.length==0) {
        self.cellHeight=CGRectGetMaxY(self.examTimeF)+LCMAEGIN_15;
    }else{
        if (examBean.examScore.length!=0) {
            self.cellHeight=CGRectGetMaxY(self.examScoreF)+LCMAEGIN_15;
        }else{
            self.cellHeight=CGRectGetMaxY(self.examChanceF)+LCMAEGIN_15;
        }
    }
    
    CGFloat examIconH=20;
    CGFloat examIconW=20;
    CGFloat examIconY=self.cellHeight*0.5-10;
    CGFloat examIconX=SCREEN_WIDTH-35;
    self.examIconF=CGRectMake(examIconX, examIconY, examIconW, examIconH);

    
}

@end
