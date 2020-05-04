
import UIKit
import SCLAlertView

struct AlertView {
    
    static func shfaqParalajmerim() {
        
        SCLAlertView().showTitle(
            "Warning",
            subTitle: "Sound file exists.",
            timeout: nil,
            completeText: "Close",
            style: .warning,
            colorStyle: 0xFFFF00,
            colorTextButton: 0x000000
        )
        
    }
    
    static func sukses() {
        
        SCLAlertView().showTitle(
            "Success",
            subTitle: "The audio file was downloaded successfully.",
            timeout: nil,
            completeText: "Close",
            style: .success,
            colorStyle: 0x32CD32,
            colorTextButton: 0x000000
        )
        
    }
    
    static func shfaqInfo() {
        
        SCLAlertView().showTitle(
            "Information",
            subTitle: "Order your book.",
            timeout: nil,
            completeText: "OK",
            style: .info,
            colorStyle: 0xCD853F,
            colorTextButton: 0x000000
        )
        
        
    }
    
}
