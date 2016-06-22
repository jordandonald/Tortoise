//
//  AddReadingViewController.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/20/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import UIKit

class AddReadingViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var startPageField: UITextField!
    
    @IBOutlet weak var endPageField: UITextField!
    
    @IBOutlet weak var datePicked: UIDatePicker!
    
    var deadline: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Add Reading"
        
        self.datePicked.addTarget(self, action: #selector(self.datePickerChanged), forControlEvents: .ValueChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerChanged(datePicker: UIDatePicker) {
        
        deadline = datePicker.date
    }

    @IBAction func beginButtonTapped(sender: UIButton) {
        
//        let rivc = ReadingInfoViewController(nibName:"ReadingInfoViewController", bundle: nil)
//        self.navigationController?.pushViewController(rivc, animated: true)
        
        self.navigationController?.popViewControllerAnimated(true)
        
        let start = Int(startPageField.text!)
        let end = Int(endPageField.text!)

        
        ReadingsController.sharedInstance.addReading(titleField.text, startPage: start, endPage: end, deadline: deadline)
        
    }

}
