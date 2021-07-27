//
//  DispersionMeasures.m
//  Mathmagic
//
//  Created by Eduardo Oliveira on 26/07/21.
//

#import "DispersionMeasures.h"
#import <Mathmagic/CentralTrendMeasures.h>

@implementation DispersionMeasures

-(double) variance:(NSArray<NSNumber*>*) array {
    
    CentralTrendMeasures *ctm = [CentralTrendMeasures new];
    double mean = [ctm mean:array];
    
    double sum = 0;
    
    for (id obj in array) {
        double currentNumber = [((NSNumber*)obj) doubleValue];
        sum += pow(currentNumber - mean, 2);
    }
    
    return sum/(array.count - 1);
}

-(double) standardDeviation:(NSArray<NSNumber*>*) array {
    return sqrt([self variance:array]);
}

-(double) covariance:(NSArray<NSNumber*>*) X :(NSArray<NSNumber*>*) Y {
    CentralTrendMeasures *ctm = [CentralTrendMeasures new];
    double xMean = [ctm mean:X];
    double yMean = [ctm mean:Y];
    
    double sum = 0;
    
    for (int i = 0; i < X.count; i++) {
        sum += ([(NSNumber*)[X objectAtIndex: i] doubleValue] - xMean) * ([(NSNumber*)[Y objectAtIndex: i] doubleValue] - yMean);
    }
    
    return sum/(X.count - 1);
}

-(double) correlation:(NSArray<NSNumber*>*) X :(NSArray<NSNumber*>*) Y {
    double covariance = [self covariance:X :Y];
    double XStandardVariation = [self standardDeviation:X];
    double YStandardVariation = [self standardDeviation:Y];
    
    return covariance / (XStandardVariation * YStandardVariation);
}

@end
