//
//  CategoriesDetailViewController.swift
//  RMS
//
//  Created by Rashdan Natiq on 02/10/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit
import Foundation
class CategoriesDetailViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var sideMenu: UIView!
    @IBOutlet weak var mainViewCons: NSLayoutConstraint!
    @IBOutlet weak var trollyButton: UIButton!
    @IBOutlet weak var homeTotalPrice: UILabel!
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var fruitView: UIView!
    @IBOutlet weak var fruitButton: UIButton!
    @IBOutlet weak var myCollectionView: UICollectionView!
     var selectedItems = [Menu]()
     var isSideMenu = false
    var indexNo = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        mySearchBar.resignFirstResponder()
        myCollectionView.reloadData()
        buttonEffectOnUI(selectedItems[indexNo].itemName)
    }
    func buttonEffectOnUI(_ type: String) {
        fruitButton.setTitleColor(UIColor.green, for: UIControlState.normal)
        fruitView.backgroundColor = UIColor.green
        fruitButton.setTitle(type, for: .normal)
        myCollectionView.reloadData()
    
    }
    /////////////////////////////////////////
    ///////// Outlet Function///////////////
    
    @IBAction func didTapViewButton(_ sender: UIButton) {
    }
    @IBAction func didTapTrolleyButton(_ sender: UIButton) {
    }
    @IBAction func sideMenuButtonClicked(_ sender: UIButton) {
        sideMenuView()
    }
    @IBAction func didTapLogOutButton(_ sender: UIButton) {
       // self.Logout()
        //self.tabBarController?.selectedIndex = 0
    }
    func sideMenuView()  {
        if (isSideMenu) {
            mainViewCons.constant = 0
            myCollectionView.isUserInteractionEnabled = true
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            myCollectionView.isUserInteractionEnabled = false
            mainViewCons.constant = 200
            sideMenu.isExclusiveTouch = true
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        isSideMenu = !isSideMenu
    }
    ///////////////////////////////////////////////////////////////
    ////////////// Collection View Delegates////////////////
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        popUpViewCall(indexPath.row)
    }
    func popUpViewCall(_ index: Int)  {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        popOverVC.count = index
        popOverVC.popVC = self
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.myCollectionView.register(UINib(nibName: "AllItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllItemCollectionViewCell")
        let cell : AllItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllItemCollectionViewCell", for: indexPath) as! AllItemCollectionViewCell
        let imageView = cell.viewWithTag(1) as! UIImageView
     //   imageView.sd_setImage(with: URL(string: selectedItems[indexPath.row].itemImage))
        cell.allPriceLabel.text =  "\(selectedItems[indexPath.row].itemId!) AED"
        cell.allDetailLabel.text = selectedItems[indexPath.row].itemName
        cell.allQuantityLabel.text = "per \(selectedItems[indexPath.row].itemImage!)"
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.allPriceLabel.layer.borderWidth = 1
        cell.allPriceLabel.layer.cornerRadius = 4
        cell.allPriceLabel.layer.borderColor = UIColor.gray.cgColor
        cell.addItem.tag = indexPath.row
        cell.hideViewAddItemButton.tag = indexPath.row
        if selectedItems[indexPath.row].itemCount == 0 {
            cell.hideView.alpha = 0
        } else {
            cell.hideView.alpha = 1
            cell.allCountLabel.text = "\( self.selectedItems[indexPath.row].itemCount!)"
        }
        cell.watchForClickHandler(completion: {index in
            if index == 0 {
                cell.hideView.alpha = 1
           //     Trolley.shared.addItemToTrolley(item: self.selectedItems[indexPath.row])
                cell.allCountLabel.text = "\( self.selectedItems[indexPath.row].itemCount!)"
            }else {
               // Trolley.shared.removeItemToTrolley(trolleyItem: self.selectedItems[indexPath.row])
                self.selectedItems[indexPath.row].itemCount =  self.selectedItems[indexPath.row].itemCount - 1
                if  self.selectedItems[indexPath.row].itemCount < 1 {
                    cell.hideView.alpha = 0
                } else {
                    cell.allCountLabel.text = "\( self.selectedItems[indexPath.row].itemCount!)"
                }
        }
        })
        return cell
    }

}
