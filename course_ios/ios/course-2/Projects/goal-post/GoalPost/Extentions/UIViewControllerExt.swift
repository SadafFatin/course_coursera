//
//  UIViewController.swift
//  GoalPost
//
//  Created by Sadaf Fatin on 3/20/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func presentDetail(_ viewControllerToPresent:UIViewController){
        
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent,animated: false,completion: nil)
    }
    
    
    
    
    func presentSecoendaryDeatil(_ viewControllerToPresent:UIViewController){
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        guard let presentedViewController = self.presentedViewController else  {return}
        presentedViewController.dismiss(animated: false, completion: {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent,animated: false,completion: nil)
        })
        
    }
    
    
    
    func dismiss(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: true, completion: nil) 
        
    }
    
    

    
    
    
}
