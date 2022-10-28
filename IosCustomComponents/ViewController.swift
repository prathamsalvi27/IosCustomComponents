//
//  ViewController.swift
//  IosCustomComponents
//
//  Created by Prathamesh Salvi on 26/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addNotificationObserver()
        addNotificationObserver2()
        
        MyNotificationCenter.shared.post(name: MyNotificationName(name: "MyFirstNotification"), object: nil)
        MyNotificationCenter.shared.post(name: MyNotificationName(name: "MySecondNotification"), object: self)
        MyNotificationCenter.shared.post(name: MyNotificationName(name: "MySecondNotification"), object: nil, userInfo: ["yoyo": "omg"])
    }

    func addNotificationObserver() {
       
        MyNotificationCenter.shared.addObserver(self, selector: #selector(notificationSelector), name: MyNotificationName(name: "MyFirstNotification"), object: nil)
        MyNotificationCenter.shared.removeObserver(objectName: self, name: MyNotificationName(name: "MyFirstNotification"))
        MyNotificationCenter.shared.addObserver(self, selector: #selector(notificationSelector2), name: MyNotificationName(name: "MyFirstNotification"), object: nil)
    }
    
    func addNotificationObserver2() {
        MyNotificationCenter.shared.addObserver(self, selector: #selector(notificationSelectorWithObject(_ :)), name: MyNotificationName(name: "MySecondNotification"), object: nil)
        MyNotificationCenter.shared.addObserver(self, selector: #selector(notificationSelectorWithObject(_ :)), name: MyNotificationName(name: "MySecondNotification"), object: nil)
        MyNotificationCenter.shared.addObserver(self, selector: #selector(notificationSelectorWithUserInfo(_ :)), name: MyNotificationName(name: "MySecondNotification"), object: nil)
       
    }
    
    @objc func notificationSelector() {
        print("oh no, why its working")
    }

    @objc func notificationSelector2() {
        print("yo yo its working")
    }
    
    @objc func notificationSelectorWithObject(_ object: MyNotification) {
        print("yo yo its working with object \(object.object)")
    }
    
    @objc func notificationSelectorWithUserInfo(_ object: MyNotification) {
        print("yo yo its working with object \(object.userInfo)")
    }

}

