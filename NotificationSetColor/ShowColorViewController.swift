//
//  ShowColorViewController.swift
//  NotificationSetColor
//
//  Created by 조서현 on 2019. 4. 23..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit

let showColorNoti = Notification.Name.init("setColor") //Use Notification

class ShowColorViewController: UIViewController {
    
    //MAKR:- Properties
    let notiCenter = NotificationCenter.default
    //let vc = ViewController()
    let vc = ViewController()
    
    //MARK:- UI Properties
    @IBOutlet weak var colorView: UIView! //Use Notification
    @IBOutlet weak var colorViewClosure: UIView! //Use Closure
    
    
    //MARK:- Use Notification
    override func viewDidLoad() {
        super.viewDidLoad()
        //Use Selector
        NotificationCenter.default.addObserver(self, selector: #selector(setColor(_:)), name: showColorNoti, object: nil)
    }
    
    
    @objc func setColor(_ noti: Notification) {
        guard let userinfo = noti.userInfo else{return}
        
        if let red = userinfo["Red"] as? Float,
            let green = userinfo["Green"] as? Float,
            let blue = userinfo["Blue"] as? Float,
            let alpha = userinfo["Alpha"] as? Float {
            colorView.backgroundColor = UIColor(red: CGFloat(floor(red))/255, green: CGFloat(floor(green))/255, blue: CGFloat(floor(blue))/255, alpha: CGFloat(floor(alpha*10)/10))
        }
    }

    
    
    //MARK:- Use Closure
    override func viewWillAppear(_ animated: Bool) {
        setViewColor()
    }
    
    
    func setViewColor() {
        print("setViewColor")
        vc.setColor() { result in
            guard let red = result.red else{return}
            guard let blue = result.blue else{return}
            guard let green = result.green else{return}
            guard let alpha = result.alpha else{return}
            print(result)
            self.colorViewClosure.backgroundColor = UIColor(red: CGFloat(floor(red))/255, green: CGFloat(floor(green))/255, blue: CGFloat(floor(blue))/255, alpha: CGFloat(floor(alpha*10)/10)/255)
        }
    }
}
