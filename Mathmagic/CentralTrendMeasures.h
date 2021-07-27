//
//  CentralTrendMeasures.h
//  Mathmagic
//
//  Created by Eduardo Oliveira on 20/07/21.
//

#import <Foundation/Foundation.h>

@interface CentralTrendMeasures : NSObject

-(NSString *) processRequest: (NSString *)message;

-(double) mean:(NSArray<NSNumber*>*) array;

-(double) weightedMean:(NSArray<NSNumber*>*) array :(NSArray<NSNumber*>*) weights;

-(double) geometricMean:(NSArray<NSNumber*>*) array;

-(double) median:(NSArray<NSNumber*>*) array;

-(NSMutableArray<NSNumber*>*) mode:(NSArray<NSNumber*>*) array;

-(double) percentile:(NSArray<NSNumber*>*) array :(int) percentile;

-(double) quartile:(NSArray<NSNumber*>*) array :(double) quartile;

-(double) decile:(NSArray<NSNumber*>*) array :(double) decile;

@end


