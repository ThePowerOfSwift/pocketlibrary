

import UIKit
import MessageUI

class EmailController: UIViewController {
    
    //MARK: - Lifecycle i app - it
    
    override func viewDidLoad() {
        
        
    }
    
    //MARK: - Dergimi i email
    
    func dergoEmail() {
        
        let mc = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        
        mc.setToRecipients(["gerinuraj2506@gmail.com"]) // emaili i marresit
        
        mc.setSubject("Ketu eshte titulli i librit") // titulli i librit
        
        mc.setMessageBody("Ketu do te jene inputet e perdoruesit", isHTML: false) //detajet nga format e kontaktit
        
        present(mc, animated: true)
        
    }
    
}

//MARK: - MFMailComposeViewControllerDelegate

extension EmailController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let e = error {
            
            print(e.localizedDescription)
            
            controller.dismiss(animated: true)
            
            return
            
        }
        
        //Rezultati do te shfaqet me AlertView
        
        switch result {
            
        case .cancelled:
            
            print("Cancelled")
            
        case .failed:
            
            print("Failed")
            
        case .saved:
            
            print("Saved")
            
        case .sent:
            
            print("Sent")
            
        default:
            
            print("ERROR")
            
        }
        
        controller.dismiss(animated: true)
        
        
    }
    
    
}
