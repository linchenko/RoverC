//
//  LRLPictureDetailViewController.swift
//  RoverC
//
//  Created by Levi Linchenko on 13/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class LRLPictureDetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var cameraOutlet: UILabel!
    @IBOutlet weak var solOutlet: UILabel!
    @IBOutlet weak var earthDayOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

    }
    
    var photo: LRLPhoto?
    
    func updateView(){
        guard let photo = photo else {return}
        imageOutlet.image = photo.image
        cameraOutlet.text = photo.cameraName
        solOutlet.text = "\(photo.sol ?? 0)"
        earthDayOutlet.text = photo.earthDate
        
    }
    

   

}
