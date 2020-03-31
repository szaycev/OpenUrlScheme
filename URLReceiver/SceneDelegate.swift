//
//  SceneDelegate.swift
//  URLReceiver
//
//  Created by Sergey Zaycev on 31.03.2020.
//  Copyright © 2020 s.zaycev. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
     
     func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
         guard let urlContext = URLContexts.first else {
             return
         }
         guard let urlComponents = URLComponents(url: urlContext.url, resolvingAgainstBaseURL: true) else {
             return
         }
         dump(urlComponents)
         guard let viewController = window?.rootViewController as? ViewController else {
             return
         }
         viewController.label.text = urlComponents.host
     }
}
