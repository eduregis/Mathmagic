//
//  CentralTrendMeasures.m
//  Mathmagic
//
//  Created by Eduardo Oliveira on 20/07/21.
//

#import "CentralTrendMeasures.h"

@implementation CentralTrendMeasures

-(NSString *) processRequest:(NSString *)message
{
    NSString *test = @"processRequest";
    return test;
}

// colocar no README: fazer o Obj-C entender o tipo especificado do Array
-(double) mean:(NSArray<NSNumber*>*) array {
    
    double mean = 0;
    
    for (id obj in array) {
        double currentNumber = [((NSNumber*)obj) doubleValue];
        mean += currentNumber;
    }
    
    return mean/array.count;
}

-(double) weightedMean:(NSArray<NSNumber*>*) array :(NSArray<NSNumber*>*) weights {
    
    double mean = 0;
    double sumWeight = 0;
    
    for (int i = 0; i < array.count; i++) {
        mean += [(NSNumber*)[array objectAtIndex: i] doubleValue] * [(NSNumber*)[weights objectAtIndex: i] doubleValue];
    }
    
    for (id obj in weights) {
        sumWeight += [((NSNumber*)obj) doubleValue];
    }
    
    return mean/sumWeight;
    
}

-(double) geometricMean:(NSArray<NSNumber*>*) array {
    double mean = 1.0;
    
    for (id obj in array) {
        double currentNumber = [((NSNumber*)obj) doubleValue];
        mean *= currentNumber;
    }
    
    return pow(mean, 1.0/array.count);
}

-(double) median:(NSArray<NSNumber*>*) array {
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey: nil ascending: YES];
    array = [array sortedArrayUsingDescriptors:@[sort]];
    
    if (array.count % 2 != 0) {
        return [(NSNumber*)[array objectAtIndex: (array.count - 1)/2] doubleValue];
    } else {
        return ([(NSNumber*)[array objectAtIndex: (array.count/2) - 1] doubleValue] + [(NSNumber*)[array objectAtIndex: (array.count/2)] doubleValue]) / 2;
    }
}

-(NSMutableArray<NSNumber*>*) mode:(NSArray<NSNumber*>*) array {
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey: nil ascending: YES];
    array = [array sortedArrayUsingDescriptors:@[sort]];
    
    int maxCount = 0.0;
    int count = 0;
    double currentNumber = [(NSNumber*)[array objectAtIndex: 0] doubleValue];
    NSMutableArray<NSNumber*>* results = [NSMutableArray<NSNumber*> array];
    
    for (id obj in array) {
        double number = [((NSNumber*)obj) doubleValue];
        if (number == currentNumber) {
            count += 1;
        } else {
            currentNumber = number;
            count = 1;
        }
        if (maxCount < count) {
            maxCount = count;
        }
    }
    
    currentNumber = [(NSNumber*)[array objectAtIndex: 0] doubleValue];
    count = 0;
    
    for (id obj in array) {
        double number = [((NSNumber*)obj) doubleValue];
        
        if (number == currentNumber) {
            count += 1;
            
            if (maxCount == count) {
                [results addObject: obj];
            }
        } else {
            currentNumber = number;
            count = 1;
        }
    }
    
    return results;
}

-(double) percentile:(NSArray<NSNumber*>*) array :(int) percentile {
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey: nil ascending: YES];
    array = [array sortedArrayUsingDescriptors:@[sort]];
    
    double newPercentile = percentile / 100.0;
    
    double minValue = 0.0, maxValue = 0.0;
    double minPercentile = 0.0, maxPercentile = 0.0;
    double stepPercentile = 1.0 / (array.count + 1.0);
    
    bool isHigherThanStep = false;
    
    for (int i = 0; i < array.count; i++) {
        if ((stepPercentile * (i + 1)) < newPercentile) {
            isHigherThanStep = true;
            if ((stepPercentile * (i + 2)) > newPercentile) {
                minValue = [(NSNumber*)[array objectAtIndex: i] doubleValue];
                minPercentile = (stepPercentile * (i + 1));
                if (i + 1 >= array.count) {
                    return 0.0;
                } else {
                    maxValue = [(NSNumber*)[array objectAtIndex: i + 1] doubleValue];
                    maxPercentile = (stepPercentile * (i + 2));
                }
            }
        } else if ((stepPercentile * (i + 1)) == newPercentile) {
            return [(NSNumber*)[array objectAtIndex: i] doubleValue];
        }
    }
    if (isHigherThanStep == false) {
        return 0.0;
    }
    
    double rangeValue = maxValue - minValue;
    double rangePercentile = maxPercentile - minPercentile;
    double rangeScale = (rangePercentile / rangeValue);
    return (newPercentile / rangeScale);
}

-(double) quartile:(NSArray<NSNumber*>*) array :(double) quartile {
    return [self percentile:array :quartile*25];
}

-(double) decile:(NSArray<NSNumber*>*) array :(double) decile {
    return [self percentile:array :decile*10];
}

@end
