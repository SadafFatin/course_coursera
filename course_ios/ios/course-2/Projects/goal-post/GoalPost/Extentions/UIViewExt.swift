//
//  UiView.swift
//  GoalPost
//
//  Created by Sadaf Fatin on 3/21/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit


extension UIView {
    

    
    func bindToKeyBoard(){
        
        NotificationCenter.default.addObserver(self, selector:   #selector(keyBoardWillChange(_ :)), name:  UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
      //  NotificationCenter.default.addObserver(self, selector:   #selector(keyBoardWillHide(_ :)), name:  UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyBoardWillChange(_ notification:NSNotification){
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let animation = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = (endingFrame.origin.y - startingFrame.origin.y)
        
        print(self.frame.origin.y , endingFrame.origin.y , startingFrame.origin.y , deltaY)
        
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: animation), animations: {
           
            self.frame.origin.y += deltaY
            
        }, completion: nil)
        
    }
    
    
    /*@objc func keyBoardWillHide(_ notification:NSNotification){
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            if self.frame.origin.y != 0 {
                self.frame.origin.y = 0
            }
           
       }
    }
    */
    
    
    
    
    
}
