

import UIKit

class DetajeAudioController: UIViewController {
    
    //MARK: - Karakteristikat
    
    @IBOutlet weak var fotoELibritOutlet: UIImageView!
    @IBOutlet weak var butoniReadOutlet: UIButton!
    @IBOutlet weak var titulliLibritOutlet: UILabel!
    @IBOutlet weak var autoriLibritOutlet: UILabel!
    @IBOutlet weak var gjatesiaAudioOutlet: UILabel!
    
    var fotojaEZgjedhur: UIImage = #imageLiteral(resourceName: "fotoEPare")
    var titulliZgjedhur = ""
    var autoriZgjedhur = ""
    var gjatesia = ""
    var url = ""
    
    //MARK: - Lifecycle i App - it
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        konfiguroUI()
        
    }
    
    func konfiguroUI() {
        
        view.karakteristikatEButonit(buton: butoniReadOutlet)
        
        view.karakteristikatView(view: fotoELibritOutlet)
        
        fotoELibritOutlet.image = fotojaEZgjedhur
        
        titulliLibritOutlet.text = "Title: \(titulliZgjedhur)"
        
        autoriLibritOutlet.text = "Author: \(autoriZgjedhur)"
        
        gjatesiaAudioOutlet.text = "Duration:  \(gjatesia)"
        
        self.navigationItem.title = titulliZgjedhur
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 0.8039215686, green: 0.5215686275, blue: 0.2470588235, alpha: 1))
        
        
    }
    
    //MARK: - Shkarkimi i librit audio
    
    @IBAction func butoniDownloadAction(_ sender: UIButton) {
        
        if let audioUrl = URL(string: url) {
            
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let destinationUrl = documentsDirectoryURL.appendingPathComponent(audioUrl.lastPathComponent)
            print(destinationUrl)
            
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                
                AlertView.shfaqParalajmerim()
                
                
            } else {
                
                URLSession.shared.downloadTask(with: audioUrl) { location, response, error in
                    guard let location = location, error == nil else { return }
                    do {
                        
                        try FileManager.default.moveItem(at: location, to: destinationUrl)
                        
                        DispatchQueue.main.async {
                            
                            AlertView.sukses()
                            
                        }
                        
                    } catch {
                        print(error)
                    }
                }.resume()
            }
        }
        
    }
    
}
