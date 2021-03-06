//
//  String+Trans.swift
//  notGIF
//
//  Created by Atuooo on 11/06/2017.
//  Copyright © 2017 xyz. All rights reserved.
//

import Foundation
import Accounts

extension String {
    
    static var trans_titleAccount: String {
        return NSLocalizedString("title.account", comment: "")
    }
    
    static var trans_promptError: String {
        return NSLocalizedString("prompt.error", comment: "")
    }
    
    static var trans_titleWeibo: String {
        return NSLocalizedString("title.weibo", comment: "")
    }
    
    static var trans_titleTwitter: String {
        return NSLocalizedString("title.twitter", comment: "")
    }
    
    static var trans_titleUnknowType: String {
        return NSLocalizedString("title.unknow_type", comment: "")
    }
    
    static var trans_badNetwork: String {
        return NSLocalizedString("prompt.bad_network", comment: "")
    }
    
    static var trans_messageUnsupport: String {
        return NSLocalizedString("prompt.message_unsupport", comment: "")
    }
    
    static var trans_tagAll: String {
        return NSLocalizedString("tag.all", comment: "")
    }
    
    static var trans_tag: String {
        return NSLocalizedString("title.tag", comment: "")
    }
    
    static var trans_titleDone: String {
        return NSLocalizedString("title.done", comment: "")
    }
    
    static var trans_titleCancel: String {
        return NSLocalizedString("title.cancel", comment: "")
    }
    
    static var trans_titleConfirm: String {
        return NSLocalizedString("title.confirm", comment: "")
    }
    
    static var trans_titleOpenSettings: String {
        return NSLocalizedString("title.open_settings", comment: "")
    }
    
    static var trans_needPhotosPermission: String {
        return NSLocalizedString("prompt.need_photos_permission", comment: "")
    }
    
    static func trans_titleChoosedTag(_ count: Int) -> String {
        return String(format: NSLocalizedString("title.choosed_gif_%@", comment: ""), count) 
    }
    
    static var trans_titleAdd: String {
        return NSLocalizedString("title.add", comment: "")
    }
    
    static var trans_titleUpdating: String {
        return NSLocalizedString("title.updating", comment: "")
    }
    
    static var trans_titleAddDone: String {
        return NSLocalizedString("title.add_done", comment: "")
    }
    
    static var trans_titleIntroTag: String {
        return NSLocalizedString("title_intro_tag", comment: "")
    }
    
    static var trans_titleIntroTagMessage: String {
        return NSLocalizedString("title_intro_tag_messge", comment: "")
    }
    
    static var trans_titleIntroShare: String {
        return NSLocalizedString("title_intro_share", comment: "")
    }
    
    static var trans_titleIntroShareMessage: String {
        return NSLocalizedString("title_intro_share_message", comment: "")
    }
}

// MARK: - Toast

extension String {
    
    static var trans_sending: String {
        return NSLocalizedString("prompt.sending", comment: "")
    }
    
    static var trans_postFailed: String {
        return NSLocalizedString("prompt.post_failed", comment: "")
    }
    
    static var trans_postSuccess: String {
        return NSLocalizedString("prompt.post_success", comment: "")
    }
    
    static var trans_requestFailed: String {
        return NSLocalizedString("prompt.request_failed", comment: "")
    }
    
    static var trans_gifNotPrepared: String {
        return NSLocalizedString("prompt.gif_not_prepared", comment: "")
    }
    
    static var trans_titlePreparing: String {
        return NSLocalizedString("title_prepareing", comment: "")
    }
    
    static var trans_titleFetching: String {
        return NSLocalizedString("title_fetching", comment: "")
    }
}

// MARK: - Alert
extension String {
    
    static var trans_promptGetIt: String {
        return NSLocalizedString("prompt.get_it", comment: "")
    }
    
    static func trans_noAccess(accountType: String) -> String {
        switch accountType {
        case ACAccountTypeIdentifierSinaWeibo:
            return NSLocalizedString("prompt.account_no_access_weibo", comment: "")
        case ACAccountTypeIdentifierTwitter:
            return NSLocalizedString("prompt.account_no_access_twitter", comment: "")
        default:
            return NSLocalizedString("title.unknow_type", comment: "")
        }
    }
    
    static func trans_h2Access(accountType: String) -> String {
        switch accountType {
        case ACAccountTypeIdentifierSinaWeibo:
            return NSLocalizedString("prompt.account_h2_authorize_weibo", comment: "")
        case ACAccountTypeIdentifierTwitter:
            return NSLocalizedString("prompt.account_h2_authorize_twitter", comment: "")
        default:
            return NSLocalizedString("title.unknow_type", comment: "")
        }
    }
    
    static func trans_noAccount(accountType: String) -> String {
        switch accountType {
        case ACAccountTypeIdentifierSinaWeibo:
            return NSLocalizedString("prompt.no_weibo_account", comment: "")
        case ACAccountTypeIdentifierTwitter:
            return NSLocalizedString("prompt.no_twitter_account", comment: "")
        default:
            return NSLocalizedString("title.unknow_type", comment: "")
        }
    }
    
    static func trans_h2Add(accountType: String) -> String {
        switch accountType {
        case ACAccountTypeIdentifierSinaWeibo:
            return NSLocalizedString("prompt.h2_add_weibo_account", comment: "")
        case ACAccountTypeIdentifierTwitter:
            return NSLocalizedString("prompt.h2_add_twitter_account", comment: "")
        default:
            return NSLocalizedString("title.unknow_type", comment: "")
        }
    }
    
    static func trans_promptTitleDeleteTag(_ name: String) -> String {
        return String(format: NSLocalizedString("prompt.title_delete_tag_%@", comment: ""), name)
    }
    
    static func trans_promptTitleRemoveGIF(_ count: Int, from name: String) -> String {
        return String(format: NSLocalizedString("prompt.title_remove_gif_%@", comment: ""), count, name)
    }
    
    static func trans_titleRemoveGIF(_ count: Int) -> String {
        return String(format: NSLocalizedString("title.remove_gif_%@", comment: ""), count)
    }
    
    static var trans_promptMessageDeleteTag: String {
        return NSLocalizedString("prompt.message_delete_tag", comment: "")
    }
    
    static var trans_titleDeleteTag: String {
        return NSLocalizedString("title.delete_tag", comment: "")
    }
}
