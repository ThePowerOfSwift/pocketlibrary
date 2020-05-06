
import UIKit
import SCLAlertView

struct AlertView {
    
    static func shfaqParalajmerim(tekst: String) {
        
        SCLAlertView().showTitle(
            "Warning",
            subTitle: tekst,
            timeout: nil,
            completeText: "Close",
            style: .warning,
            colorStyle: 0xFFFF00,
            colorTextButton: 0x000000
        )
        
    }
    
    
    
    static func sukses(tekst: String) {
        
        SCLAlertView().showTitle(
            "Success",
            subTitle: tekst,
            timeout: nil,
            completeText: "Close",
            style: .success,
            colorStyle: 0x32CD32,
            colorTextButton: 0x000000
        )
        
    }
    
    
    
    static func shfaqInfo(tekst: String) {
        
        SCLAlertView().showTitle(
            "Notification",
            subTitle: tekst,
            timeout: nil,
            completeText: "OK",
            style: .info,
            colorStyle: 0xCD853F,
            colorTextButton: 0x000000
        )
        
    }
    
    static func shfaqGabim(tekst: String) {
        
        SCLAlertView().showTitle(
            "Error",
            subTitle: tekst,
            timeout: nil,
            completeText: "OK",
            style: .error,
            colorStyle: 0xFF0000,
            colorTextButton: 0x000000
        )
        
    }
    
}
