

import UIKit

class QuotesController: UIViewController {
    
    let shprehjeModel = ShprehjeModel()
    
    @IBOutlet weak var shprehjaLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        shprehjaLabel.text = shprehjeModel.shprehjeInspiruese.randomElement()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 0.8039215686, green: 0.5215686275, blue: 0.2470588235, alpha: 1))
        
        self.navigationItem.title = "Inspirational"
    }
    
    //MARK: - Njoftimet
    
    @IBAction func aktivizoNjoftimetAction(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: K.shkoTekNjoftimet, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let backItem = UIBarButtonItem()
        
        backItem.title = "Back"
        
        navigationItem.backBarButtonItem = backItem
        
    }
    
}
