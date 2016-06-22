//
//  MyReadingsTableViewCell.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/20/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import UIKit

class MyReadingsTableViewCell: UITableViewCell {

    @IBOutlet weak var readingTitle: UILabel!
    
    @IBOutlet weak var pagesRemaining: UILabel!
    
    @IBOutlet weak var dueDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func referenceCell(reading: Reading) {
        
        //title
        if let title = reading.title {
            readingTitle.text = title
        }
        
        //pages
        let pageCount = String((reading.endPage! - reading.startPage!) + 1)
        
        pagesRemaining.text = "\(pageCount) Pages Remaining"
        
        //deadline
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let strDate: String = dateFormatter.stringFromDate(reading.deadline)
        
        dueDate.text = "Due: \(strDate)"
        
    }
    
    func referenceDCell(division: Division) {
        
        //title
        if let title = division.title {
            readingTitle.text = title
        }
        
        //pages
        let pageCount = String((division.endPage! - division.startPage!) + 1)
        
        pagesRemaining.text = "\(division.startPage!) - \(division.endPage!) (\(pageCount) pages)"
        
        //deadline
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        
        let strDate: String = dateFormatter.stringFromDate(division.deadline)
        
        dueDate.text = "Due: \(strDate)"
        
    }

    
}
