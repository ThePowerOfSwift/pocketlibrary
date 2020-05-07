

import UIKit
import UserNotifications
import DateTimePicker

class NjoftimetController: UIViewController {
    
    //MARK: - Karakteristikat
    
    let shprehjeModel = ShprehjeModel()
    
    @IBOutlet weak var butoniOresOutlet: UIButton!
    
    let defaults = UserDefaults.standard
    
    //MARK: - Lifecycle i App - it
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        konfiguroUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 0.8039215686, green: 0.5215686275, blue: 0.2470588235, alpha: 1))
        
        self.navigationItem.title = "Push Notifications"
        
    }
    
    //MARK: - Konfigurimi i UI
    
    func konfiguroUI() {
        
        shfaqFotonGIF()
        
        aktivizoNjoftimet()
        
        
        if defaults.string(forKey: "Ora") == nil {
            
            defaults.set("09:00", forKey: "Ora")
            
        }
        
        
        self.butoniOresOutlet.setTitle(defaults.string(forKey: "Ora"), for: .normal)
        
    }
    
    
    //MARK: - Zgjedhja e Kohes
    
    func pickerUI(_ picker: DateTimePicker) {
        
        picker.isTimePickerOnly = true
        
        picker.highlightColor = .black
        
        picker.doneBackgroundColor = #colorLiteral(red: 0.8039215686, green: 0.5215686275, blue: 0.2470588235, alpha: 1)
        
        
    }
    
    @IBAction func zgjidhOren(_ sender: UIButton) {
        
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 4)
        
        let max = Date().addingTimeInterval(60 * 60 * 24 * 4)
        
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        
        pickerUI(picker)
        
        self.view.addSubview(picker)
        
        picker.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 300)
        
        picker.completionHandler = { ora in
            
            let oraString = (String(describing: ora))
            
            var indeks = 0
            
            var oraTekst = ""
            
            for shkronje in oraString {
                
                if indeks > 9 && indeks < 16 {
                    
                    oraTekst += "\(shkronje)"
                    
                }
                
                indeks += 1
            }
            
            
            self.defaults.set(oraTekst, forKey: "Ora")
            
            self.butoniOresOutlet.setTitle(oraTekst, for: .normal)
            
        }
        
        picker.dismissHandler = {
            
            picker.isHidden = true
            
        }
        
        
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
        
        permbajtjaENjoftimit.body = shprehjeModel.shprehjeInspiruese.randomElement() ?? "You became what you think about."
        
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
