//
//  ViewController.swift
//  XMLParser
//
//  Created by joelin on 9/19/15.
//  Copyright (c) 2015 joelin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var urlString = "http://wac.450f.edgecastcdn.net/80450F/kowb1290.com/files/2013/05/jingyulicrop-275x300.jpg"
        var request = NSURLRequest(URL: NSURL(string: urlString)!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse:nil, error:nil)
        var image = UIImage(data: data!)
        ImageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

