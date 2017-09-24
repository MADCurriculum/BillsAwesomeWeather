//
//  ViewController.swift
//  BillsAwesomeWeather
//
//  Created by Bill Skrzypczak on 9/23/17.
//  Copyright © 2017 Bill Skrzypczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
            if let data = NSData(contentsOf: url as URL){
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                    
                    let newDict = parsed 
                    print(newDict["currently"]!["summary"])
                    print(newDict["currently"]!["temperature"])
                    print(newDict["currently"]!["dewPoint"])
                    
                    self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                    self.currentSummary.text = "\(newDict["currently"]!["summary"]!!)"

                    
                    
                }
                catch let error as NSError {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
                }
                
            }
        }
    }
  
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentSummary: UILabel!

   }

