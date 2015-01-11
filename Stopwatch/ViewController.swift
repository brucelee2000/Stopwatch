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
    var seconds = 0
    var minutes = 0
    var hours = 0
    
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
        seconds = 0
        minutes = 0
        hours = 0
        timeLabel.text = "00:00:00"
        recordLabel.hidden = true
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        recordLabel.hidden = false
        recordLabel.text = "Last record is at " + timeString()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = "00:00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myAction() {
        ++seconds
        if seconds == 60 {
            seconds = 0
            ++minutes
            if minutes == 60 {
                minutes = 0
                ++hours
            }
        }
        timeLabel.text = timeString()
    }
    
    func timeString() -> String {
        let secondsSpace = seconds < 10 ? "0":""
        let minutesSpace = minutes < 10 ? "0":""
        let hoursSpace = hours < 10 ? "0":""
        
        return hoursSpace + "\(hours)" + ":" + minutesSpace + "\(minutes)" + ":" + secondsSpace + "\(seconds)"
    }


}

