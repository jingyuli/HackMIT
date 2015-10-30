//
//  ViewController.swift
//  HackMIT
//
//  Created by Jeffrey Lu on 9/19/15.
//  Copyright © 2015 Jeffrey Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    @IBAction func takePicture(sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        let image = imageView.image!;
        let size = CGSizeMake(320, 320 * image.size.height / image.size.width);
        UIGraphicsBeginImageContext(size);
        image.drawInRect(CGRectMake(0, 0, size.width, size.height));
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let client = ClarifaiClient(appID: "iuf1IFUNnbOvisUHG1WvNcT6qKRwJp0i4qZE0p7r", appSecret: "Pwr2tq7z21Veub72QPOD1JiaOWaXnXHYvPZ8q6_g");
        let jpeg = UIImageJPEGRepresentation(scaledImage!, 0.9);
        client.recognizeJpegs([jpeg!]) { (results, err) -> Void in
            for result in results {
                let cResult = result as! ClarifaiResult
                print(cResult.tags);
                print(cResult.probabilities);
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

