//
//  DivisionsController.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/21/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import Foundation

class DivisionsController {
    
    var divisions: [Division] = []
    
    class var sharedInstance: DivisionsController
    {
        struct Static
        {
            static var instance:DivisionsController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)
        {
            Static.instance = DivisionsController()
        }
        return Static.instance!
    }
    
    func addDivision (title: String?, startPage: Int?, endPage:Int?, deadline: NSDate?){
        
        let division = Division()
        
        division.title = title
        division.startPage = startPage
        division.endPage = endPage
        
        if let deadline = deadline {
            division.deadline = deadline
        }
        
        divisions.append(division)
        
        self.updateDivision()
        
    }
    
    func updateDivision() {
        PersistenceManager.saveNSArray(divisions, fileName: "DivisionArchive")
    }
    
    private func populateDivisionsFromMemory(){
        
        if let divisionList = PersistenceManager.loadNSArray("DivisionArchive") as? [Division] {
            divisions = divisionList
        }
        
    }
    
    func getDivisions() -> [Division]{
        
        populateDivisionsFromMemory()
        
        if (divisions.count == 0){
            
            self.divisions = Division.divisionList()
            PersistenceManager.saveNSArray(divisions, fileName: "DivisionArchive")
            
        }
        
        return self.divisions
    }
    
}
