//
//  LearnHeaderView.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/9.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LearnHeaderView.h"
@interface LearnHeaderView()

@property(nonatomic,strong)UILabel * planeTitle;
@property(nonatomic,strong)UILabel * planeTime;
@property(nonatomic,strong) UIImageView * planePassIcon;

//刷新布局
@property(nonatomic,strong)UIView * refreshLayout;
@property(nonatomic,strong)UIImageView * refreshIcon;
@property(nonatomic,strong)UILabel * refreshLabel;


@property(nonatomic,strong)UILabel * planeDescLabel;

@end

@implementation LearnHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addselfView];
    
    }
    return self;
}

-(void) addselfView{
    [self addSubview:self.planeTitle];
    [_planeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.mas_right).offset(-46);
        make.height.equalTo(@20);
        make.top.equalTo(self.mas_top).offset(15);
    }];
    
    [self addSubview:self.planeTime];
    [_planeTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.planeTitle.mas_bottom).offset(12);
        make.left.equalTo(self.mas_left).offset(15);
    }];
    [self addSubview:self.planePassIcon];
    
    [_planePassIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.size.equalTo(@46);
    }];

}



#pragma mark -- 填充数据 ---

-(void)setPlaneName:(NSString *)planeName setPlaneDesc:(NSString *)planeDesc setPlaneTime:(NSString *)planeTime{
    self.planeTitle.text=planeName;
    self.planeTime.text=planeTime;
    if (planeDesc.length==0) {
        self.headerHeight=72;
        NSLog(@"headerHeight::::%f",self.headerHeight);
    }else{
        [self addSubview:self.planeDescLabel];
        [_planeDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.planeTime.mas_bottom).offset(12);
            make.left.equalTo(self.mas_left).offset(15);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
        self.planeDescLabel.text=planeDesc;
        CGSize planeDescSize= [planeDesc sizeWithFont:LCFont12 constrainedToSize:CGSizeMake(self.frame.size.width-LCMAEGIN_15*2,MAXFLOAT)];
        self.headerHeight=72+planeDescSize.height+LCMAEGIN_15;
        NSLog(@"headerHeight:::::::%f",self.planeTime.frame.origin.y);
    }

    

}



#pragma  mark  -- 懒加载 view --
-(UILabel *) planeTitle{
    if (_planeTitle==nil) {
        _planeTitle=[[UILabel alloc] init];
        _planeTitle.textColor=LCBlack333333;
        _planeTitle.font=LCFont15;
    
    }
    
    return _planeTitle;
}
-(UILabel *) planeTime{
    if (_planeTime==nil) {
        _planeTime=[[UILabel alloc] init];
        _planeTime.font=LCFont12;
        _planeTime.textColor=LCGay979797;
    }
    return _planeTime;
}


-(UIImageView *) planePassIcon{
    
    if (_planePassIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"passed.png"];
        _planePassIcon=[[UIImageView alloc] initWithImage:image];
    }
    return _planePassIcon;
    
}

-(UIView *) refreshLayout{
    
    if (_refreshLayout==nil) {
        _refreshLayout=[[UIView alloc] init];
    }
    return _refreshLayout;
}
-(UIImageView *) refreshIcon{
    
    if (_refreshIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"refresh.png"];
        _refreshIcon=[[UIImageView alloc] initWithImage:image];
    }
    return _refreshIcon;
}
-(UILabel *) refreshLabel{
    if (_refreshLabel==nil) {
        _refreshLabel=[[UILabel alloc] init];
        _refreshLabel.textColor=LCBlueColor;
        _refreshLabel.font=LCFont12;
        _refreshLabel.text=@"刷新";
    }

    return _refreshLabel;
}

-(UILabel *) planeDescLabel{
    if (_planeDescLabel==nil) {
        _planeDescLabel=[[UILabel alloc] init];
        _planeDescLabel.textColor=LCGay979797;
        _planeDescLabel.font=LCFont12;
        _planeDescLabel.numberOfLines=0;
    }
    return _planeDescLabel;
}







@end
