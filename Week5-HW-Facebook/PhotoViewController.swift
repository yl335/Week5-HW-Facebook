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
    
    @IBOutlet weak var imageScrollVIew: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButtonImageView: UIImageView!
    @IBOutlet weak var actionImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
        imageScrollVIew.delegate = self
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
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
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
