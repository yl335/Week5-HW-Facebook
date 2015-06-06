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
        var selectedPhoto = feedCtrl.photoList[feedCtrl.selectedPhotoIndex]
        tempImageView = UIImageView(image: selectedPhoto.image)
        tempImageView.frame = selectedPhoto.frame
        tempImageView.frame.origin.y += feedCtrl.feedScrollView.frame.origin.y
        tempImageView.contentMode = UIViewContentMode.ScaleAspectFill
        tempImageView.clipsToBounds = true
        
        containerView.addSubview(tempImageView)
        var tempFrame: CGRect = photoCtrl.imageScrollVIew!.frame
        tempFrame.origin.x = tempFrame.size.width * CGFloat(feedCtrl.selectedPhotoIndex)
        photoCtrl.imageScrollVIew.scrollRectToVisible(tempFrame, animated: false)
        photoCtrl.currentPage = feedCtrl.selectedPhotoIndex
        photoCtrl.imageScrollContainer.hidden = true
        
        UIView.animateWithDuration(0.5, animations: {
            //frame and position the photo to where the photo controller has it
            self.tempImageView.frame = photoCtrl.imageView.frame
            self.tempImageView.frame.origin.y += photoCtrl.imageScrollContainer.frame.origin.y
            
            toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                photoCtrl.imageScrollContainer.hidden = false
                self.tempImageView.hidden = true
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        
        var photoCtrl = fromViewController as! PhotoViewController
        var feedCtrl = ((toViewController as! UITabBarController).selectedViewController as! FeedViewController)
        var selectedPhoto = feedCtrl.photoList[photoCtrl.currentPage]

        tempImageView = UIImageView(image: selectedPhoto.image)
        tempImageView.frame = photoCtrl.imageView.frame
        tempImageView.frame.origin.y += photoCtrl.imageScrollContainer.frame.origin.y
        tempImageView.frame.origin.y -= CGFloat(photoCtrl.scrollOffset)
        tempImageView.contentMode = UIViewContentMode.ScaleAspectFill
        containerView.addSubview(tempImageView)
        
        photoCtrl.imageScrollContainer.hidden = true
        
        UIView.animateWithDuration(0.5, animations: {
            self.tempImageView.frame = selectedPhoto.frame
            self.tempImageView.frame.origin.y += feedCtrl.feedScrollView.frame.origin.y
            
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}
