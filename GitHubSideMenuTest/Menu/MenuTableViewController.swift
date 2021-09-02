//
//  MenuTableViewController.swift
//  GitHubSideMenuTest
//
//  Created by 林建羽 on 2021/9/2.
//

import UIKit
import SideMenu

class MenuTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        guard let menu = navigationController as? SideMenuNavigationController, menu.blurEffectStyle == nil else {
            return
        }
        
        // tableView 漸層背景
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.tableView.frame
        gradientLayer.colors = [
            UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).cgColor,
            UIColor(red: 1, green: 1, blue: 1, alpha: 0.14).cgColor
        ]
        let view = UIView()
        view.frame = self.tableView.frame
        view.layer.addSublayer(gradientLayer)
        view.layoutIfNeeded()
        
        self.tableView.backgroundView = view
        self.tableView.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! MenuTableViewCell
        
        if let menu = navigationController as? SideMenuNavigationController {
            cell.blurEffectStyle = menu.blurEffectStyle
        }
    
        // 被選取時的背景
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "選取")!)
        cell.selectedBackgroundView = view
        
        return cell
    }

}
