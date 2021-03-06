//
//  Alert.swift
//  notGIF
//
//  Created by Atuooo on 13/10/2016.
//  Copyright © 2016 xyz. All rights reserved.
//

import UIKit

public enum AlertShowScene {
    case badNetwork
    case messageUnsupport
    
    case noAccount(String)
    case noAccessAccount(String)
    
    case unknowType
    
    case confirmDeleteTag(String)
    case confirmRemoveGIF(Int, String)
}

typealias Completion = (() -> Void)

final class Alert {
    
    class func show(_ scene: AlertShowScene, in viewController: UIViewController? = nil, withConfirmAction confirmAction: Completion? = nil) {
        guard let vc = viewController ?? UIApplication.shared.keyWindow?.rootViewController else { return }
        
        var title = "", message: String? = nil
        var confirmTitle = String.trans_promptGetIt
        var showCancel: Bool = false
        var style: UIAlertControllerStyle = .alert
        
        switch scene {
        case .badNetwork:
            title = String.trans_badNetwork
            
        case .messageUnsupport:
            title = String.trans_messageUnsupport
            
        case .noAccount(let accountType):
            title = String.trans_noAccount(accountType: accountType)
            message = String.trans_h2Add(accountType: accountType)
            
        case .noAccessAccount(let accountType):
            title = String.trans_noAccess(accountType: accountType)
            message = String.trans_h2Access(accountType: accountType)
            
        case .unknowType:
            title = String.trans_titleUnknowType
            
        case .confirmDeleteTag(let name):
            title = String.trans_promptTitleDeleteTag(name)
            message = String.trans_promptMessageDeleteTag
            confirmTitle = String.trans_titleDeleteTag
            style = .actionSheet
            showCancel = true
            
        case .confirmRemoveGIF(let count, let name):
            title = String.trans_promptTitleRemoveGIF(count, from: name)
            confirmTitle = String.trans_titleRemoveGIF(count)
            style = .actionSheet
            showCancel = true
        }
        
        alert(title: title, message: message, style: style, confirmTitle: confirmTitle, in: vc, showCancel: showCancel, confirmAction: confirmAction)
    }
    
    class func alert(title: String, message: String?, style: UIAlertControllerStyle, confirmTitle: String, in viewController: UIViewController?, showCancel: Bool = false, confirmAction: Completion?) {
        
        DispatchQueue.main.safeAsync {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
            alertController.view.tintColor = UIColor.black
            
            if showCancel {
                let action = UIAlertAction(title: String.trans_titleCancel, style: .cancel, handler: nil)
                alertController.addAction(action)
            }
            
            let action: UIAlertAction = UIAlertAction(title: confirmTitle, style: style == .actionSheet ? .destructive : .default) { action in
                confirmAction?()
            }
            
            alertController.addAction(action)
            viewController?.present(alertController, animated: true, completion: nil)
        }
    }
}

