//
//  HUD.swift
//  notGIF
//
//  Created by ooatuoo on 2017/6/6.
//  Copyright © 2017年 xyz. All rights reserved.
//

import MBProgressHUD

public enum HUDShowScene {
    case fetchGIF
    case requestData
    
    var message: String {
        switch self {
        case .fetchGIF:
            return "fetching GIFs..."
        case .requestData:
            return "preparing..."
        }
    }
}

class HUD {
    
    class func show(to view: UIView? = nil, _ scene: HUDShowScene) {
        guard let superView = view ?? UIApplication.shared.keyWindow else { return }
        
        let hud = MBProgressHUD.showAdded(to: superView, animated: true)
        
        hud.removeFromSuperViewOnHide = true
        hud.mode = .indeterminate
        hud.animationType = .fade
        hud.contentColor = .textTint
        hud.bezelView.color = .clear
        hud.bezelView.style = .solidColor
        hud.backgroundView.color = .clear
        
        if scene == .fetchGIF {
            hud.offset = CGPoint(x: 0, y: -superView.frame.height/4)
        }
                
        hud.label.text = scene.message
        hud.label.font = UIFont.menlo(ofSize: 12)
    }
    
    class func hide(in view: UIView? = nil) {
        guard let superView = view ?? UIApplication.shared.keyWindow else { return }
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: superView, animated: true)
        }
    }
    
    class func show(to view: UIView? = nil, text: String, delay: TimeInterval = 1) {
        guard let superView = view ?? UIApplication.shared.keyWindow else { return }
        
        let hud = MBProgressHUD.showAdded(to: superView, animated: true)
        hud.mode = .text
        hud.margin = 10
        hud.contentColor = .textTint
        hud.bezelView.color = .bgColor
//        hud.bezelView.style = .solidColor
        hud.label.text = text
        hud.label.font = UIFont.menlo(ofSize: 15)
        
        hud.hide(animated: true, afterDelay: delay)
    }
}
