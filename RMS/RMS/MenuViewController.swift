//
//  MenuViewController.swift
//  RMS
//
//  Created by Rashdan Natiq on 28/09/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTabelView: UITableView!
    var menuList = [Menu]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.toolbar.backgroundColor = UIColor.green
        for i  in 0 ..< 5 {
            print(i)
            let saveItem = Menu(itemId: i, itemName: "item \(i)", itemImage: "item \(i)",itemCount: 0)
            menuList.append(saveItem)
            if i == 4 {
                myTabelView.reloadData()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MenuTableViewCell", owner: self, options: nil)?.first as! MenuTableViewCell
        cell.menuLabel.text = menuList[indexPath.row].itemName
        cell.menuImage.image = #imageLiteral(resourceName: "chicken")
        cell.backGroundView.layer.borderWidth = 2
        cell.backGroundView.layer.borderColor = UIColor.green.cgColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(indexPath.row)")
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "CategoriesDetailViewController") as! CategoriesDetailViewController
        nextVC.indexNo = indexPath.row
        nextVC.selectedItems = menuList
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
