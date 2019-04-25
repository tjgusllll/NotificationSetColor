//
//  ViewController.swift
//  NotificationSetColor
//
//  Created by 조서현 on 2019. 4. 23..
//  Copyright © 2019년 조서현. All rights reserved.
//  Use Selector

import UIKit
var observer: NSObjectProtocol?
class ViewController: UIViewController {
    
    //MARK:- Properties
    let notiCenter = NotificationCenter.default

    
    //MARK:- UI Properties
    struct UI {
        static let maxValue: Float = 255
        static let alphaValue: Float = 1
    }
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        redSlider.maximumValue = UI.maxValue
        greenSlider.maximumValue = UI.maxValue
        blueSlider.maximumValue = UI.maxValue
        alphaSlider.maximumValue = UI.alphaValue
    }
    


    //MARK:- Use Notification
    @IBAction func setColor(_ sender: Any) {
        
        let colorValue = ["Red":redSlider.value, "Green":greenSlider.value, "Blue":blueSlider.value, "Alpha":alphaSlider.value]
        
        notiCenter.post(name: showColorNoti, object: self, userInfo: colorValue)
    }
    
    var result = ColorModal()
    @IBAction func setClosureColor(_ sender: Any) {
       
        result.red = redSlider.value
        result.green = greenSlider.value
        result.blue = blueSlider.value
        result.alpha = alphaSlider.value
        print(result)
        
    }

    func setColor(completion: @escaping (ColorModal) -> ()) {
        
        print("SetColor : \(result)")
        completion(result)
    }
   
}

