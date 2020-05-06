
import UIKit

class BrowseController: UIViewController {
    
    //MARK: - Karakteristikat
    
    var tag = -1
    
    @IBOutlet weak var butoniBusiness: UIButton!
    @IBOutlet weak var butoniZhvillimPersonal: UIButton!
    @IBOutlet weak var butoniEdukim: UIButton!
    @IBOutlet weak var butoniShkence: UIButton!
    @IBOutlet weak var butoniPsikologji: UIButton!
    @IBOutlet weak var butoniFitnes: UIButton!
    @IBOutlet weak var butoniTeoriKonspiracioni: UIButton!
    @IBOutlet weak var butoniBiografi: UIButton!
    @IBOutlet weak var butoniReligion: UIButton!
    @IBOutlet weak var butoniTeknologji: UIButton!
    
    //MARK: - Lifecycle i App - it
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func konfiguroUI() {
        
        view.karakteristikaView(butoniBusiness)
        
        view.karakteristikaView(butoniZhvillimPersonal)
        
        view.karakteristikaView(butoniEdukim)
        
        view.karakteristikaView(butoniShkence)
        
        view.karakteristikaView(butoniPsikologji)
        
        view.karakteristikaView(butoniFitnes)
        
        view.karakteristikaView(butoniTeoriKonspiracioni)
        
        view.karakteristikaView(butoniBiografi)
        
        view.karakteristikaView(butoniReligion)
        
        view.karakteristikaView(butoniTeknologji)
        
    }
    
    
    //MARK: - Segue
    
    @IBAction func butoniKategoriseAction(_ sender: UIButton) {
        
        tag = sender.tag
        
        performSegue(withIdentifier: K.shkoTekKategoriaSpecifike, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let kategoriteDestinacion = segue.destination as! KategoriteController
        
        
        switch tag {
            
        case 1:
            
            kategoriteDestinacion.emriKategorise = "Business & Career"
            
            break
            
            
        case 2:
            
            kategoriteDestinacion.emriKategorise = "Personal Growth"
            
            break
            
            
        case 3:
            
            kategoriteDestinacion.emriKategorise = "Academic & Education"
            
            break
            
            
        case 4:
            
            kategoriteDestinacion.emriKategorise = "Science & Research"
            
            break
            
            
        case 5:
            
            kategoriteDestinacion.emriKategorise = "Psychology"
            
            break
            
            
        case 6:
            
            kategoriteDestinacion.emriKategorise = "Health & Fitness"
            
            break
            
            
        case 7:
            
            kategoriteDestinacion.emriKategorise = "Conspiracy Theory"
            
            break
            
            
        case 8:
            
            kategoriteDestinacion.emriKategorise = "Biography"
            
            break
            
            
        case 9:
            
            kategoriteDestinacion.emriKategorise = "Religion"
            
            break
            
            
        case 10:
            
            kategoriteDestinacion.emriKategorise = "Technology"
            
            break
            
            
        default:
            
            print("Nuk ekziston butoni")
            
        }
        
        
    }
    
    
    
}
