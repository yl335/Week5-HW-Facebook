//
//  FeedViewController.swift
//  Week5-HW-Facebook
//
//  Created by Sara Lin on 6/5/15.
//  Copyright (c) 2015 Sara Lin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    let photoTransition = PhotoTransition()
    
    var selectedPhoto: UIImageView!
    
    @IBOutlet weak var feedScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapPhoto(sender: UITapGestureRecognizer) {
        
        selectedPhoto = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: sender.view)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var photoCtrl = segue.destinationViewController as! PhotoViewController
        photoCtrl.image = (sender as! UIImageView).image
        
        photoCtrl.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoCtrl.transitioningDelegate = self.photoTransition
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
