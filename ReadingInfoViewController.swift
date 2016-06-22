//
//  ReadingInfoViewController.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/20/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import UIKit

class ReadingInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var divisionList = [Division]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Grapes of Wrath" //change depending on reading title
        
        self.setUpTableView()
    }

    override func viewWillAppear(animated: Bool) {
        
        divisionList = DivisionsController.sharedInstance.getDivisions()
        
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setUpTableView() {
        
        self.tableView.allowsSelectionDuringEditing = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "MyReadingsTableViewCell", bundle: nil) , forCellReuseIdentifier: "myReadingsTableViewCell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.divisionList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let division = divisionList[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myReadingsTableViewCell", forIndexPath: indexPath) as! MyReadingsTableViewCell
        
        cell.referenceDCell(division)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //nothing yet
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(88)
    }
    
    func deleteCell(indexPath: NSIndexPath) {
        
        DivisionsController.sharedInstance.divisions.removeAtIndex(indexPath.row)
        DivisionsController.sharedInstance.updateDivision()
        self.divisionList = DivisionsController.sharedInstance.getDivisions()
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    func editCell(indexPath: NSIndexPath) {
        
        //implement
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let action = UITableViewRowAction(style: .Normal, title: "Mark As Complete") { action, index in
            print("Cell edit")
            //Add cell edit functionality
            self.deleteCell(indexPath)
        }
        action.backgroundColor = UIColor.greenColor()
        
        return [action]
    }

}
