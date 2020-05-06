

import UIKit
import UserNotifications

class NjoftimetController: UIViewController {
    
    let shprehjeModel = ShprehjeModel()
    
    //MARK: - Lifecycle i App - it
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        shfaqFotonGIF()
        
        aktivizoNjoftimet()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 0.8039215686, green: 0.5215686275, blue: 0.2470588235, alpha: 1))
        
        self.navigationItem.title = "Push Notifications"
        
    }
    
    //MARK: - Aktivizo Njoftimet
    
    func aktivizoNjoftimet() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound, .badge]) { (sukses, gabim) in
            
            if sukses {
                
                //  print("Perdoruesi ka dhene akses per aktivizimin e njoftimeve")
                
            }
                
            else {
                
                //  print("Perdoruesi nuk ka dhene akses per aktivizimin e njoftimeve")
                
            }
            
        }
        
        let permbajtjaENjoftimit = UNMutableNotificationContent()
        
        permbajtjaENjoftimit.title = "DAILY INSPIRATION"
        
        permbajtjaENjoftimit.sound = .default
        
        permbajtjaENjoftimit.body = shprehjeModel.shprehjeInspiruese.randomElement() ?? ""
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let uuIdString = UUID().uuidString
        
        let kerkese = UNNotificationRequest(identifier: uuIdString, content: permbajtjaENjoftimit, trigger: trigger)
        
        UNUserNotificationCenter.current().add(kerkese) { (error) in
            
            if error != nil {
                
                print(error?.localizedDescription ?? "Gabim ne shfaqjen e njoftimeve")
                
            }
            
        }
        
    }
    
    //MARK: - Shfaqja e fotos GIF
    
    func shfaqFotonGIF() {
        
        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "njoftimet", withExtension: "gif")!)
        let advTimeGif = UIImage.gifImageWithData(imageData!)
        
        let imageView2 = UIImageView(image: advTimeGif)
        
        view.addSubview(imageView2)
        
        imageView2.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 50, paddingRight: -50, height: 150)
        
    }
}
