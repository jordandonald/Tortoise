//
//  Reading.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/20/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import Foundation

class Reading: NSObject {
    
    var title: String? = ""
    var startPage: Int? = 0
    var endPage: Int? = 0
    var deadline: NSDate = NSDate()
    //var assignments = [Reading]()
    

    required convenience init(title:String?, startPage:Int?, endPage:Int?, deadline:NSDate?) {
    
        self.init()
        self.title = title
        self.startPage = startPage
        self.endPage = endPage
        self.deadline = deadline!
  
    }

    // MARK: - NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.startPage, forKey: "startPage")
        aCoder.encodeObject(self.endPage, forKey: "endPage")
        aCoder.encodeObject(self.deadline, forKey: "deadline")
    
    }

    required convenience init?(coder aDecoder: NSCoder) {
    
        let title = aDecoder.decodeObjectForKey("title") as? String
        let startPage = aDecoder.decodeObjectForKey("startPage") as? Int
        let endPage = aDecoder.decodeObjectForKey("endPage") as? Int
        let deadline = aDecoder.decodeObjectForKey("deadline") as! NSDate
        
        self.init(title:title, startPage:startPage, endPage:endPage, deadline:deadline)
    
    }
    
    //test values
     class func readingList() -> [Reading] {
        
        let reading = Reading()
        reading.title = "Grapes of Wrath"
        reading.startPage = 6
        reading.endPage = 100
        //reading.deadline =
        
        let reading2 = Reading()
        reading2.title = "To Kill A Mockingbird"
        reading2.startPage = 76
        reading2.endPage = 323
        //reading2.deadline =
        
        let reading3 = Reading()
        reading3.title = "Otto Wagner: Modern Architecture"
        reading3.startPage = 2
        reading3.endPage = 12
        //reading3.deadline =
        
        return [reading, reading2, reading3]
        
    }
    
    func splitReading() {
        
        
        
    }
    
    func getAssignments() {
        
    }
    
    
    

}
