//
//  ViewController.m
//  UIImageView缩放功能
//
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>{
    CGRect _rect;
    CGPoint _point;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic)  UIImageView *bgshowImgView;
@property (strong, nonatomic)  UIImageView *fshowImgView;
@property (strong, nonatomic)  UIView *containView;

@end


@implementation ViewController
#pragma mark - 页面视图初始化
-(void)initContainView {
    self.scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    self.scrollView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height/2.0);
    
    CGRect rect = self.scrollView.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    self.containView = [[UIView alloc] initWithFrame:rect];
    [self.scrollView addSubview:self.containView];
    
    self.bgshowImgView = [[UIImageView alloc] initWithFrame:rect];
    self.bgshowImgView.image = [UIImage imageNamed:@"image1"];
    [self.containView addSubview:self.bgshowImgView];
    
//    self.fshowImgView = [[UIImageView alloc] initWithFrame:rect];
//    self.fshowImgView.image = [UIImage imageNamed:@"floral_9"];
//    [self.containView addSubview:self.fshowImgView];
}




- (void)viewDidLoad {
    [super viewDidLoad];

    [self initContainView];
    
    _scrollView.contentSize=self.containView.frame.size;
    _scrollView.delegate=self;
    _scrollView.maximumZoomScale=100.0;//设置最大伸缩比例
    _scrollView.minimumZoomScale=1;//设置最小伸缩比例
    _scrollView.bouncesZoom = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//告诉scrollview要缩放的是哪个子控件
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.containView;
}

//缩放后的位置控制
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGPoint point = scrollView.center;
    CGRect containRect = self.containView.frame;
    CGRect scrollViewRect = scrollView.frame;
    if(containRect.size.width<[UIScreen mainScreen].bounds.size.width){
        scrollViewRect.size.width = containRect.size.width;
    }else {
        scrollViewRect.size.width = [UIScreen mainScreen].bounds.size.width;
    }
    
    if(containRect.size.height<[UIScreen mainScreen].bounds.size.height){
        scrollViewRect.size.height = containRect.size.height;
    }else {
        scrollViewRect.size.height = [UIScreen mainScreen].bounds.size.height;
    }
    
    self.scrollView.frame = scrollViewRect;
    self.scrollView.center = point;
    
//    NSLog(@"scrollViewRect----%f----%f----%f----%f",self.scrollView.frame.origin.x,self.scrollView.frame.origin.y,self.scrollView.frame.size.width,self.scrollView.frame.size.height);
    
    
    
}



@end
