//
//  PopUpViewController.swift
//  RMS
//
//  Created by Rashdan Natiq on 02/10/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var proImage: UIImageView!
    var selectedItems = [Menu]()
    var count = 0
    var popVC = CategoriesDetailViewController()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.layer.borderWidth = 4
        backView.layer.borderColor = UIColor.gray.cgColor
    }
    override func viewWillAppear(_ animated: Bool) {
        backView.layer.borderWidth = 4
        backView.layer.borderColor = UIColor.gray.cgColor
        displayOnView(index: count)
        
    }

    @IBAction func didTapCrossButton(_ sender: UIButton) {
        self.view.removeFromSuperview()
       
    }
    @IBAction func didTapAddButton(_ sender: UIButton) {
    }
    
    @IBAction func didTaPRightShift(_ sender: UIButton) {
    }
    @IBAction func didTapLeftShift(_ sender: UIButton) {
    }
    func displayOnView(index: Int) {
      //  proImage.image = #imageLiteral(resourceName: "loading")
      //  let imageView = self.proImage.viewWithTag(0) as! UIImageView
      //  imageView.sd_setImage(with: URL(string: (selectedItems[index].itemImage)!))
       
        
    }

   

  
}
