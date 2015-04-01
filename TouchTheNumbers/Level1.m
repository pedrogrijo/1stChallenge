//
//  Level1.m
//  TouchTheNumbers
//
//  Created by Eduardo Carlassara on 3/25/15.
//  Copyright (c) 2015 Eduardo Carlassara. All rights reserved.
//

#import "Level1.h"
#import <AVFoundation/AVFoundation.h>

@interface Level1 ()

@property NSMutableArray* array;
@property int counter;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property (strong, nonatomic) NSTimer *countWatchTimer;
@property (weak, nonatomic) IBOutlet UILabel *watchTimer;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *labelNextNumber;

@property (nonatomic) int mseconds;
@property (nonatomic) int seconds;
@property (nonatomic) int minutes;

@property (nonatomic) AVAudioPlayer *background;
@end

@implementation Level1

@synthesize counter;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // somm cracra
    // Inicializa variaveis do cronometro
    self.mseconds = 0;
    self.seconds = 0;
    self.minutes = 0;
    
    // Inicializa o cronometro chamando o método updateTimer
    self.countWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/100.0 target: self selector:@selector(updateTimer) userInfo: nil repeats: YES];
    
    // Inicializa variaveis
    clickable = TRUE;
    
    /** Nesse trecho será gerado uma MutableArray que serão embaralhados via o método shuffle para ser usado na posição dos botões **/
    self.array = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12" , @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21",@"22", @"23", @"24", @"25", nil];
    
    [self shuffle:self.array];
    for (UIButton *button in self.buttons) {
        [button setTitle:[self.array objectAtIndex:button.tag] forState:UIControlStateNormal];
    }
    
    counter = 1;
   
    NSString *path = [NSString stringWithFormat:@"%@/William Tell Overture Finale.mp3", [[NSBundle mainBundle] resourcePath]];
    
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    self.background = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.background play];
    
    self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"level1Background.png"]];
    [self.backgroundImage setFrame: CGRectMake ( 0.0f, 0.0f, 620.0f, 680.0f)];
    [self.view addSubview: self.backgroundImage];
        
}

- (IBAction)returnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.background stop];
}


/** Atualiza o tempo que está na label do cronometro **/
- (void) updateTimer {
    
    _mseconds++;
    
    if(_mseconds > 99) {
        _mseconds = 0;
        _seconds++;
        
        if(_seconds > 59) {
            _seconds = 0;
            _minutes++;
            
            if(_minutes > 59) {
                _minutes = 0;
            }
        }
    }
    
    // Imprime o horário após os incrementos realizados.
    self.watchTimer.text = [NSString stringWithFormat:@"%02i:%02i:%03i", self.minutes, self.seconds, self.mseconds];
}

- (IBAction)button:(UIButton *)sender {
    
    if(clickable) {
        if([self.array[[sender tag]] intValue] == self.counter){
            NSLog(@"%@", self.array[[sender tag]]);
           
            // Desabilita o botão e altera sua cor
            [sender setEnabled:NO];
            [sender setBackgroundColor:[UIColor grayColor]];
            
            self.counter++;
            
            self.counterLabel.text = [NSString stringWithFormat:@"%d", counter];
    
        }
    }
    
    // Caso acerte os 25 números, o programa encerra.
    if(counter == 26){
        
        for(UIButton *button in self.buttons)
            [button setHidden:YES];
        
       
       // [self.labelNextNumber.hidden = YES];
        [self.countWatchTimer invalidate];
        [self.background stop];
        
        
        UIAlertView *myAlert = [[UIAlertView alloc]
                                initWithTitle:@"x9 migué"
                                message:@""
                                delegate:self
                                cancelButtonTitle:nil
                                otherButtonTitles:@"ok", nil];
        myAlert.cancelButtonIndex = -1;
        [myAlert setTag:1000];
        [myAlert show];
        
        
        
        
     /*   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ROFL"
                                                        message:@"Dee dee doo doo."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:@"return", nil];
        [alert show]; */
        
        
    }
}

/** Método responsável embaralhar o conteúdo de uma MutableArray passada como parâmetro **/
- (void) shuffle: (NSMutableArray*) array{
    for(int i = 0; i < [array count]; i++){
        int rowElements = (int) ([array count] - i);
        int n = (arc4random() % rowElements) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
