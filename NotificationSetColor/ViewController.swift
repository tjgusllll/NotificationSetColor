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
    let showColorNoti2 = Notification.Name.init("setColor2") //Use Closure
    
    let setColorVC = ShowColorViewController()
    
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
        
        //Use Closure
        observer = notiCenter.addObserver(forName: showColorNoti2, object: nil, queue: .main) { (noti) in
            print(noti)
            self.setColorVC.setViewColor(noti)
        }
    }
    
    func setupUI() {
        redSlider.maximumValue = UI.maxValue
        greenSlider.maximumValue = UI.maxValue
        blueSlider.maximumValue = UI.maxValue
        alphaSlider.maximumValue = UI.alphaValue
    }
    


    //MARK:- Use Selector
    @IBAction func setColor(_ sender: Any) {
        
        let colorValue = ["Red":redSlider.value, "Green":greenSlider.value, "Blue":blueSlider.value, "Alpha":alphaSlider.value]
        
        notiCenter.post(name: showColorNoti, object: self, userInfo: colorValue)
    }
    
    
    //MARK:- Use Closure
    @IBAction func setColorClosure(_ sender: Any) {
        let colorValue = ["Red":redSlider.value, "Green":greenSlider.value, "Blue":blueSlider.value, "Alpha":alphaSlider.value]
        
        notiCenter.post(name: showColorNoti2, object: self, userInfo: colorValue)
    }
}

