import UIKit
import SwiftIconFont

final class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeTabbarItemsText()
        
        // Load Wallet 
        let etherKeystore: EtherKeystore = EtherKeystore()
        etherKeystore.createWalletIfNotExists()
        
        // UI TabBarItem
        let airdropViewController = AirdropViewController(titleName: "Airdrop")
        let airdropImage = UIImage(from: .fontAwesome, code: "gift", backgroundColor: .clear, size: CGSize(width: 35, height: 35))
        airdropViewController.tabBarItem = UITabBarItem(title: "airdrop", image: airdropImage, tag: 1)
        
        let walletViewController = WalletViewController(titleName: "EconoMe Wallet")
        let walletImage = UIImage(from: .fontAwesome, code: "creditcard", backgroundColor: .clear, size: CGSize(width: 30, height: 30))
        walletViewController.tabBarItem = UITabBarItem(title: "wallet", image: walletImage, tag: 2)
        
        let transactionViewController = TransactionViewController(titleName: "Transactions")
        let transactionImage = UIImage(from: .fontAwesome, code: "list", backgroundColor: .clear, size: CGSize(width: 30, height: 30))
        transactionViewController.tabBarItem = UITabBarItem(title: "transactions", image: transactionImage, tag: 3)
        
        let settingViewController = SettingViewController(titleName: "Setting")
        let settingImg = UIImage(from: .fontAwesome, code: "cog", backgroundColor: .clear, size: CGSize(width: 30, height: 30))
        settingViewController.tabBarItem = UITabBarItem(title: "setting", image: settingImg, tag: 4)
        
        let nv = UINavigationController(rootViewController: airdropViewController)
        let nv2 = UINavigationController(rootViewController: walletViewController)
        let nv3 = UINavigationController(rootViewController: transactionViewController)
        let nv4 = UINavigationController(rootViewController: settingViewController)
        setViewControllers([nv, nv2, nv3, nv4], animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func removeTabbarItemsText() {
        if let items = tabBarController?.tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
            }
        }
    }
}
