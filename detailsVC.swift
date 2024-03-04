//
//  detailsVC.swift
//  LandMarkBook
//
//  Created by Ahmed Emrah Calayır on 4.03.2024.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandMark = ""
    var selectedImageView = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedImageView
        landmarkLabel.text = selectedLandMark
    }

}
