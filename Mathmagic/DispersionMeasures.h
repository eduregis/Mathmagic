//
//  DispersionMeasures.h
//  Mathmagic
//
//  Created by Eduardo Oliveira on 26/07/21.
//

#import <Foundation/Foundation.h>

@interface DispersionMeasures : NSObject

-(double) variance:(NSArray<NSNumber*>*) array;

-(double) standardDeviation:(NSArray<NSNumber*>*) array;

-(double) covariance:(NSArray<NSNumber*>*) X :(NSArray<NSNumber*>*) Y;

-(double) correlation:(NSArray<NSNumber*>*) X :(NSArray<NSNumber*>*) Y;

@end
