

import UIKit
import MessageUI

class EmailController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Karakteristika
    
    @IBOutlet weak var emri: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var titulliLibrit: UITextField!
    @IBOutlet weak var autoriLibrit: UITextField!
    @IBOutlet weak var llojiLibrit: UITextField!
    @IBOutlet weak var butoniSendOutlet: UIButton!
    
    
    //MARK: - Lifecycle i app - it
    
    override func viewDidLoad() {
        
        karakteristikaUI()
        
    }
    
    
    func karakteristikaUI() {
        
        view.karakteristikaPlaceholder(fushaETekstit: emri, teksti: "Your Name")
        
        view.karakteristikaPlaceholder(fushaETekstit: email, teksti: "Email")
        
        view.karakteristikaPlaceholder(fushaETekstit: titulliLibrit, teksti: "Book Title")
        
        view.karakteristikaPlaceholder(fushaETekstit: autoriLibrit, teksti: "Book Author")
        
        view.karakteristikaPlaceholder(fushaETekstit: llojiLibrit, teksti: "Book Type (Ex. Audiobook / PDF Book)")
        
        view.karakteristikaView(butoniSendOutlet)
        
        
    }
    
    @IBAction func butoniSendAction(_ sender: UIButton) {
        
        dergoEmail()
        
        boshatisFushatETekstit()
        
    }
    
    
    //MARK: - Dergimi i email
    
    func dergoEmail() {
        
        let mc = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        
        mc.setToRecipients(["gerinuraj2506@gmail.com"])
        
        mc.setSubject(titulliLibrit.text!)
        
        mc.setMessageBody("Name: \(emri.text!) \n\n Email: \(email.text!) \n\n Book Title: \(titulliLibrit.text!) \n\n Book Author: \(autoriLibrit.text!) \n\n Book Type: \(llojiLibrit.text!) \n\n", isHTML: false) 
        
        present(mc, animated: true)
        
    }
    
    //MARK: - Boshatis fushat e tekstit
    
    func boshatisFushatETekstit() {
        
        emri.text! = ""
        
        email.text! = ""
        
        titulliLibrit.text! = ""
        
        autoriLibrit.text! = ""
        
        llojiLibrit.text! = ""
        
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
            
            AlertView.shfaqInfo(tekst: "Cancelled")
            
        case .failed:
            
            AlertView.shfaqGabim(tekst: "Email failed to send.")
            
        case .saved:
            
            AlertView.shfaqInfo(tekst: "Saved")
            
        case .sent:
            
            AlertView.sukses(tekst: "Email was sent successfully.")
            
        default:
            
            print("ERROR")
            
        }
        
        controller.dismiss(animated: true)
        
        
    }
    
    
}
