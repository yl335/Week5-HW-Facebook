//
//  PhotoTransition.swift
//  Week5-HW-Facebook
//
//  Created by Sara Lin on 6/5/15.
//  Copyright (c) 2015 Sara Lin. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    
    var tempImageView: UIImageView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        toViewController.view.alpha = 0
        
        var feedCtrl = ((fromViewController as! UITabBarController).selectedViewController as! FeedViewController)
        var photoCtrl = toViewController as! PhotoViewController
        
        //frame and position the initial position to start from the feed
        var feedImageView = feedCtrl.selectedPhoto
        tempImageView = UIImageView(image: feedImageView.image)
        tempImageView.frame = feedImageView.frame
        tempImageView.frame.origin.y += feedCtrl.feedScrollView.frame.origin.y
        tempImageView.contentMode = UIViewContentMode.ScaleAspectFill
        tempImageView.clipsToBounds = true
        
        containerView.addSubview(tempImageView)
        
        UIView.animateWithDuration(0.5, animations: {
            //frame and position the photo to where the photo controller has it
            self.tempImageView.frame = photoCtrl.imageView.frame
            self.tempImageView.frame.origin.y += photoCtrl.imageScrollVIew.frame.origin.y
            
            photoCtrl.imageView.hidden = true
            toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                photoCtrl.imageView.hidden = false
                self.tempImageView.hidden = true
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        
        var photoCtrl = fromViewController as! PhotoViewController
        var feedCtrl = ((toViewController as! UITabBarController).selectedViewController as! FeedViewController)
        var feedImageView = feedCtrl.selectedPhoto
        

        self.tempImageView.frame = photoCtrl.imageView.frame
        self.tempImageView.frame.origin.y += photoCtrl.imageScrollVIew.frame.origin.y
        self.tempImageView.frame.origin.y -= CGFloat(photoCtrl.scrollOffset)
        tempImageView.hidden = false
        photoCtrl.imageScrollVIew.hidden = true
        
        UIView.animateWithDuration(0.5, animations: {
            self.tempImageView.frame = feedImageView.frame
            self.tempImageView.frame.origin.y += feedCtrl.feedScrollView.frame.origin.y
            
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}
