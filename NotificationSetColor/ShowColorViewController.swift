//
//  ShowColorViewController.swift
//  NotificationSetColor
//
//  Created by 조서현 on 2019. 4. 23..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit

let showColorNoti = Notification.Name.init("setColor") //Use Selector


class ShowColorViewController: UIViewController {
    
    let notiCenter = NotificationCenter.default

 
    @IBOutlet weak var colorView: UIView! //Use Selector
    @IBOutlet weak var colorViewClosure: UIView! //Use Closure
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Use Selector
        NotificationCenter.default.addObserver(self, selector: #selector(setColor(_:)), name: showColorNoti, object: nil)
        
    }
    

    
    //MARK:- Selector setColor
    @objc func setColor(_ noti: Notification) {
        guard let userinfo = noti.userInfo else{return}
        
        if let red = userinfo["Red"] as? Float,
            let green = userinfo["Green"] as? Float,
            let blue = userinfo["Blue"] as? Float,
            let alpha = userinfo["Alpha"] as? Float {
            colorView.backgroundColor = UIColor(red: CGFloat(floor(red))/255, green: CGFloat(floor(green))/255, blue: CGFloat(floor(blue))/255, alpha: CGFloat(floor(alpha*10)/10))
        }
    }
    
 
    func setViewColor(_ noti: Notification) {
        guard let userinfo = noti.userInfo else{return}
        
        if let red = userinfo["Red"] as? Float,
            let green = userinfo["Green"] as? Float,
            let blue = userinfo["Blue"] as? Float,
            let alpha = userinfo["Alpha"] as? Float {
            print("\(floor(red)) \(floor(green)) \(floor(blue)) \(floor(alpha))")
            self.colorViewClosure.backgroundColor = UIColor(red: CGFloat(floor(red))/255, green: CGFloat(floor(green))/255, blue: CGFloat(floor(blue))/255, alpha: CGFloat(floor(alpha*10)/10))
            
        }
    }
    

}
