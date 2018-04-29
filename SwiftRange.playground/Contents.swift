// Implementation of NSRangeIntersect

import UIKit

let range1 = NSMakeRange(2, 4) // 2, 3, 4, 5
let range2 = NSMakeRange(4, 4) // 4, 5, 6, 7

func myIntersectionRange(_ range1 : NSRange , _ range2 : NSRange ) -> NSRange
{
    if (range1.location == NSNotFound || range1.length == NSNotFound || range2.location == NSNotFound || range2.length == NSNotFound) {
            return NSMakeRange(NSNotFound, NSNotFound);
    }
    
    let begin1 = range1.location;
    let end1 = range1.location + range1.length;
    let begin2 = range2.location;
    let end2 = range2.location + range2.length;
    
    if (end1 <= begin2 || end2 <= begin1) {
        return NSMakeRange(NSNotFound, NSNotFound);
    }
    
    let begin = max(begin1, begin2);
    let end = min(end1, end2);
    
    return NSMakeRange(begin, end - begin);
}

myIntersectionRange(range1, range2)

