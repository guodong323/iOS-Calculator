//
//  MathOperations.h
//  Calculate
//
//  Created by 阿栋 on 1/1/25.
//

#ifndef MathOperations_h
#define MathOperations_h

#import <Foundation/Foundation.h>
#import <math.h>

@interface MathOperations : NSObject

+ (double)addition:(double)a with:(double)b;
+ (double)subtraction:(double)a with:(double)b;
+ (double)multiplication:(double)a with:(double)b;
+ (nullable NSNumber *)division:(double)a with:(double)b;

+ (double)sine:(double)angleInDegrees;
+ (double)cosine:(double)angleInDegrees;
+ (double)tangent:(double)angleInDegrees;

@end


#endif /* MathOperations_h */
