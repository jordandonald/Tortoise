//
//  Division.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/21/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import Foundation

class Division: NSObject {
    
    var title: String? = ""
    var startPage: Int? = 0
    var endPage: Int? = 0
    var deadline: NSDate = NSDate()
    
    
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
    class func divisionList() -> [Division] {
        
        let division = Division()
        division.title = "Test"
        division.startPage = 0
        division.endPage = 0
        //division.deadline =
        
        return [division]
        
    }
    
}
