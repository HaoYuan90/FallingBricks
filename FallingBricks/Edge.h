//for coder's own use
//thoroughly checkded code quality

#import <Foundation/Foundation.h>
#import "BrickModel.h"

typedef enum {
    top ,
    btm ,
    left,
    right
} edgePosition;
    
    
@interface Edge : BrickModel {
}

-(id) initEdge :(edgePosition) edge;

@end
