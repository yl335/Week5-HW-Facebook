//
//  PhotoViewController.swift
//  Week5-HW-Facebook
//
//  Created by Sara Lin on 6/5/15.
//  Copyright (c) 2015 Sara Lin. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    var image: UIImage!
    var scrollOffset: Float! = 0
    var currentPage: Int! = 0
    var isZooming: Bool! = false
    var beforeZoomingPhotoOrigin: CGPoint! = CGPoint(x: 0, y: 0)
    var photoList: [UIImageView]!
    
    @IBOutlet weak var imageScrollContainer: UIView!
    @IBOutlet weak var imageScrollVIew: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButtonImageView: UIImageView!
    @IBOutlet weak var actionImageView: UIImageView!

    @IBOutlet weak var photoView1: UIImageView!
    @IBOutlet weak var photoView2: UIImageView!
    @IBOutlet weak var photoView3: UIImageView!
    @IBOutlet weak var photoView4: UIImageView!
    @IBOutlet weak var photoView5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageScrollVIew.delegate = self
        imageScrollVIew.directionalLockEnabled = true
    }
    
    override func viewDidAppear(animated: Bool) {
        photoList = [photoView1, photoView2, photoView3, photoView4, photoView5]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func onPressDoneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollOffset = Float(scrollView.contentOffset.y)
        
        var alpha = convertValue(scrollOffset, 0.0, -50.0, 1.0, 0.5)
        var alphaViews = convertValue(scrollOffset, 0.0, -20.0, 1.0, 0.0)
        imageScrollVIew.backgroundColor = UIColor(white: 0, alpha: CGFloat(alpha))
        doneButtonImageView.alpha = CGFloat(alphaViews)
        actionImageView.alpha = CGFloat(alphaViews)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollOffset = Float(scrollView.contentOffset.y)
        
        if (scrollOffset < -50) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if (!isZooming) {
            var tempScrollOffset = scrollView.contentOffset.x
            currentPage = Int(floor(tempScrollOffset / imageScrollVIew.frame.size.width))
        }
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView!) {
        if (!isZooming)
        {
            scrollView.pagingEnabled = false
            scrollView.directionalLockEnabled = false
            scrollView.contentSize = CGSize(width: 320, height: 569)
            
            beforeZoomingPhotoOrigin = photoList[currentPage].frame.origin
            photoList[currentPage].frame.origin = CGPoint(x: 0, y: 0)
            imageScrollContainer.frame.origin.y = 0
            
            for (i, photo) in enumerate(photoList) {
                if (i != currentPage) {
                    photo.hidden = true
                }
            }
            
            actionImageView.hidden = true
            doneButtonImageView.hidden = true
            isZooming = true
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photoList[currentPage]
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {

        if (scale == 1) {
            isZooming = false
            photoList[currentPage].frame.origin = beforeZoomingPhotoOrigin
            imageScrollVIew.contentSize.width = imageScrollContainer.frame.width
            actionImageView.hidden = false
            doneButtonImageView.hidden = false
            imageScrollVIew.contentOffset.x = CGFloat(currentPage) * imageScrollVIew.frame.size.width
            
            UIView.animateWithDuration(0.2, animations: {
                self.imageScrollContainer.frame.origin.y = 45
            })
            
            scrollView.pagingEnabled = true
            scrollView.directionalLockEnabled = true
            
            for (i, photo) in enumerate(photoList) {
                if (i != currentPage) {
                    photo.hidden = false
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
