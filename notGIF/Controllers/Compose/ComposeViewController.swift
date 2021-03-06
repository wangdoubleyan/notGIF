//
//  ComposeViewController.swift
//  notGIF
//
//  Created by Atuooo on 13/10/2016.
//  Copyright © 2016 xyz. All rights reserved.
//

import UIKit
import Social
import Accounts

class ComposeViewController: SLComposeServiceViewController {
    public var accounts = [ACAccount]()
    public var selectedAccount: ACAccount? = nil

    fileprivate var shareType: ShareType!
    fileprivate var gifInfo: GIFDataInfo!
    
    convenience init(shareType: ShareType, with dataInfo: GIFDataInfo) {
        self.init()
        
        self.shareType = shareType
        self.gifInfo = dataInfo
        
        getAccounts(of: shareType)
    }
    
    deinit {
        printLog(" deinited")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
    }
    
    // MARK: - Override SLComposeService
    
    override func loadPreviewView() -> UIView! {
        let img = gifInfo.thumbnail
        let scaledImg = img.aspectFill(toSize: CGSize(width: 75, height: 75))
        return UIImageView(image: scaledImg)
    }
    
    override func configurationItems() -> [Any]! {
        let item = SLComposeSheetConfigurationItem()!
        item.title = String.trans_titleAccount
        item.value = selectedAccount?.accountDescription
        item.tapHandler = { [unowned self] in
            let accountTableVC = AccountTableViewController()
            accountTableVC.composeVC = self
            self.pushConfigurationViewController(accountTableVC)
        }
        return [item]
    }
    
    override func isContentValid() -> Bool {
        let remainingCount = 140 - contentText.characters.count
        charactersRemaining =  NSNumber(value: remainingCount)
        return remainingCount < 0 ? false : true
    }
    
    override func didSelectCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didSelectPost() {
        guard let account = selectedAccount else {
            return
        }

        SLRequestManager.shareGIF(with: gifInfo.data, and: contentText, to: account)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Get Account
    
    private func getAccounts(of type: ShareType) {
        
        let accountStore = ACAccountStore()
        var accountType = ACAccountType()
        
        switch type {
        case .twitter:
            accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
            title = String.trans_titleTwitter
            
        case .weibo:
            accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierSinaWeibo)
            title = String.trans_titleWeibo
            
        default:
            title = String.trans_titleUnknowType
            Alert.show(.unknowType, in: self, withConfirmAction: {
                self.dismiss(animated: true, completion: nil)
            })
            break
        }
        
        accountStore.requestAccessToAccounts(with: accountType, options: nil) {granted, error in
            if granted {
                
                self.accounts = accountStore.accounts(with: accountType) as! [ACAccount]
                
                if self.accounts.isEmpty {
                    Alert.show(.noAccount(accountType.identifier), in: self, withConfirmAction: {
                        self.dismiss(animated: true, completion: nil)
                    })
                    
                } else {
                    self.selectedAccount = self.accounts.first
                    
                    DispatchQueue.main.safeAsync {
                        self.reloadConfigurationItems()
                    }
                }
                
            } else {
                Alert.show(.noAccessAccount(accountType.identifier), in: self, withConfirmAction: {
                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
}
