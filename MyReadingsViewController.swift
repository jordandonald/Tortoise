//
//  MyReadingsViewController.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/20/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import UIKit

class MyReadingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addReadingButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var readingList = [Reading]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Readings"
        addReadingButton.layer.cornerRadius = 5
        
        self.setUpTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        readingList = ReadingsController.sharedInstance.getReadings()
        
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addReadingButtonTapped(sender: UIButton) {
        
        let arc = AddReadingViewController(nibName: "AddReadingViewController", bundle: nil)
        self.navigationController?.pushViewController(arc, animated: true)
        
    }
    
    func setUpTableView() {
        
        self.tableView.allowsSelectionDuringEditing = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "MyReadingsTableViewCell", bundle: nil) , forCellReuseIdentifier: "myReadingsTableViewCell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.readingList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let reading = readingList[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myReadingsTableViewCell", forIndexPath: indexPath) as! MyReadingsTableViewCell
        
        cell.referenceCell(reading)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let rivc = ReadingInfoViewController(nibName: "ReadingInfoViewController", bundle: nil)
        self.navigationController?.pushViewController(rivc, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(88)
    }
    
    func deleteCell(indexPath: NSIndexPath) {

        ReadingsController.sharedInstance.readings.removeAtIndex(indexPath.row)
        ReadingsController.sharedInstance.updateReading()
        self.readingList = ReadingsController.sharedInstance.getReadings()
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    func editCell(indexPath: NSIndexPath) {
        
        //implement
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let action1 = UITableViewRowAction(style: .Normal, title: " Edit ") { action, index in
            print("Cell edit")
            //Add cell edit functionality
            self.editCell(indexPath)
        }
        action1.backgroundColor = UIColor.blueColor()
        
        let action2 = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            print("Cell deleted")
            self.deleteCell(indexPath)
        }
        action2.backgroundColor = UIColor.redColor()
        
        return [action1, action2]
    }

    @IBAction func logOutButtonTapped(sender: UIButton) {
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.navigateToAuth()
        
    }
 
    

}
