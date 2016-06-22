//
//  ReadingsController.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/20/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import Foundation

class ReadingsController {
    
    var readings: [Reading] = []

    class var sharedInstance: ReadingsController
    {
        struct Static
        {
            static var instance:ReadingsController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)
        {
            Static.instance = ReadingsController()
        }
        return Static.instance!
    }
    
    func addReading (title: String?, startPage: Int?, endPage:Int?, deadline: NSDate?){
        
        let reading = Reading()
        
        reading.title = title
        reading.startPage = startPage
        reading.endPage = endPage
    
        if let deadline = deadline {
            reading.deadline = deadline
        }
        
        readings.append(reading)
        
        self.updateReading()
        
        //call reading func readings.controller
        
    }
    
    func updateReading() {
        PersistenceManager.saveNSArray(readings, fileName: "ReadingArchive")
    }
    
    private func populateReadingsFromMemory (){
    
        if let readingList = PersistenceManager.loadNSArray("ReadingArchive") as? [Reading] {
            readings = readingList
        }
        
    }
    
    func getReadings() -> [Reading]{
        
         populateReadingsFromMemory()
        
        if (readings.count == 0){
            
            self.readings = Reading.readingList()
            PersistenceManager.saveNSArray(readings, fileName: "ReadingArchive")
            
        }
        
        return self.readings
    }
}
