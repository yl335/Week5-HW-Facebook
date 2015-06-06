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
    
    var selectedPhotoIndex: Int!
    var selectedPhoto: UIImageView!
    var photoList: [UIImageView]!
    
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var photoImage1: UIImageView!
    @IBOutlet weak var photoImage2: UIImageView!
    @IBOutlet weak var photoImage3: UIImageView!
    @IBOutlet weak var photoImage4: UIImageView!
    @IBOutlet weak var photoImage5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectedPhotoIndex = 0
        photoList = [photoImage1, photoImage2, photoImage3, photoImage4, photoImage5]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapPhoto(sender: UITapGestureRecognizer) {
        
        selectedPhoto = sender.view as! UIImageView
        for (i, photo) in enumerate(photoList) {
            if ((sender.view as! UIImageView) == photo) {
                selectedPhotoIndex = i
            }
        }
        performSegueWithIdentifier("photoSegue", sender: sender.view)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var photoCtrl = segue.destinationViewController as! PhotoViewController        
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
