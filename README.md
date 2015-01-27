# Stopwatch
Timer usage
-----------
* **Create a Timer**

    var timer = NSTimer()

* **Start a Timer**

        @IBAction func playButtonPressed(sender: UIBarButtonItem) {
            if !timer.valid {
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "myAction", userInfo: nil, repeats: true)
            }
        }
        
        func myAction() {
            ++count
            timeLabel.text = "\(count)"
        }

* **Stop a Timer**

        @IBAction func pauseButtonPressed(sender: UIBarButtonItem) {
            // Stop the timer
            timer.invalidate()
        }
        
* **Reset a Timer**

  Timer is never reset and just the counter is reset

        @IBAction func resetButtonPressed(sender: UIBarButtonItem) {
            // Stop the timer
            timer.invalidate()
            count = 0
            timeLabel.text = "0"
            recordLabel.hidden = true
        }
