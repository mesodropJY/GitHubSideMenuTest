//
//  MenuNavigationViewController.swift
//  GitHubSideMenuTest
//
//  Created by 林建羽 on 2021/9/2.
//

import UIKit
import SideMenu

class MenuNavigationViewController: SideMenuNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let presentationStyle = SideMenuPresentationStyle.menuSlideIn
        
        // sideMenu 邊框陰影
        presentationStyle.onTopShadowOpacity = 0.5
        
        // sideMenu跑出來後，其餘畫面的透明度
        // 0 = 不透明，全黑。 1 = 透明
        presentationStyle.presentingEndAlpha = 0.5
        
        
        var mySittings = SideMenuSettings()
        mySittings.presentationStyle = presentationStyle
        
        // 設置statusBar的透明度
        mySittings.statusBarEndAlpha = 0
        
        // sideMenu 寬度
        mySittings.menuWidth = view.safeAreaLayoutGuide.layoutFrame.size.width * 0.7
      
        self.settings = mySittings
        
    }
}
