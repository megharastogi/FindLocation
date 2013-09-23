//
//  CustomAnnotationView.m
//  FindLocation
//
//  Created by Brad on 9/23/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import "CustomAnnotationView.h"



@implementation CustomAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
        self.backgroundColor = [UIColor redColor];
        
        self.annotationImage.frame = CGRectMake(0,0,70,70);
        
        
        
        NSString *thePath = [[NSBundle mainBundle] pathForResource:@"RW3" ofType:@"jpg"];
        
        UIImage *russellWilson = [[UIImage alloc] initWithContentsOfFile:thePath];
       
        self.annotationImage.image = russellWilson;
        
        [self addSubview:self.annotationImage];
        
        
    }
    
    return self;
    
}

@end
