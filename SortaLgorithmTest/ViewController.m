//
//  ViewController.m
//  SortaLgorithmTest
//
//  Created by Hongfei Zhai on 2017/11/29.
//  Copyright © 2017年 Hongfei Zhai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@12,@34,@32,@56,@21,@2,@58,@53,@13,@99]];
    
    [self bubbleSortWithDataArray:arr];
    
    [self selectionSortWithDataArray:arr];
    
    [self insertSortWithDataArray:arr];
    
}

//bubbleSort优化算法 -- 双向冒泡排序(每一次外层循环，不仅能找到一个最小的，同时也能找到一个最大的)
- (void)bubbleSortWithDataArray:(NSMutableArray *)dataArr {
    NSInteger index = 0;
    BOOL isExchange = YES;
    for (NSInteger i = 0; i < dataArr.count - 1 && isExchange; i++) {
        isExchange = NO;
        for (NSInteger j = 0; j < dataArr.count - i - 1; j++) {
            if ([dataArr[j] integerValue] < [dataArr[j+1] integerValue]) {
                NSInteger temp = [dataArr[j] integerValue];
                dataArr[j] = dataArr[j+1];
                dataArr[j+1] = [NSNumber numberWithInteger:temp];
                isExchange = YES;
            }
        }
        for (NSInteger k = dataArr.count - i - 2; k > 0; k--) {
            if ([dataArr[k] integerValue] > [dataArr[k-1] integerValue]) {
                NSInteger temp = [dataArr[k] integerValue];
                dataArr[k] = dataArr[k-1];
                dataArr[k-1] = [NSNumber numberWithInteger:temp];
                isExchange = YES;
            }
        }
        index ++ ;
    }
    NSLog(@"bubbleSortArray --- %@   index - %ld",dataArr,index);
}

//selectionSort优化算法
- (void)selectionSortWithDataArray:(NSMutableArray *)dataArr {
    NSInteger min,i,j;
    for (i = 0; i < dataArr.count; i++) {
        min = i;
        for (j = i + 1; j < dataArr.count; j++) {
            if ([dataArr[min] integerValue] > [dataArr[j] integerValue]) {
                min = j;
            }
        }
        if (i != min) {
            NSInteger temp = [dataArr[i] integerValue];
            dataArr[i] = dataArr[min];
            dataArr[min] = [NSNumber numberWithInteger:temp];
        }
    }
    NSLog(@"selectionSortArray --- %@",dataArr);
}

//插入排序
- (void)insertSortWithDataArray:(NSMutableArray *)dataArr {
    int i,j;
    NSNumber *temp = [[NSNumber alloc]init];//哨兵
    for (i = 1; i< dataArr.count; i++) {
        //判断当前的下标i的数组元素是否大于下标i-1的数组元素,如果大于,就执行以下操作
        if (dataArr[i] < dataArr[i-1]) {
            temp = dataArr[i];
            //找到合适位置,插入有序表中
            for (j = i-1 ; j >= 0 && dataArr[j] > temp; j--) {
                dataArr[j+1] = dataArr[j];
            }
            dataArr[j+1] = temp;
        }
    }
    NSLog(@"insertSort%@",dataArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
