//
//  ViewController.swift
//  Stopwatch
//
//  Created by Yosemite on 1/10/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    var count = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var recordLabel: UILabel!
    
    @IBAction func playButtonPressed(sender: UIBarButtonItem) {
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "myAction", userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pauseButtonPressed(sender: UIBarButtonItem) {
        // Stop the timer
        timer.invalidate()
    }
    
    @IBAction func resetButtonPressed(sender: UIBarButtonItem) {
        // Stop the timer
        timer.invalidate()
        count = 0
        timeLabel.text = "0"
        recordLabel.hidden = true
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        recordLabel.hidden = false
        recordLabel.text = "Last record is at \(count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myAction() {
        ++count
        timeLabel.text = "\(count)"
    }


}

