


import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var fushaETekstitKerko: UISearchBar!
    
    //MARK: - Lifecycle i App - it
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        konfiguroUI()
        
    }
    
    func konfiguroUI() {
        
        fushaETekstitKerko.placeholder = "Search for a book or an author"
        
        fushaETekstitKerko.layer.cornerRadius = 10
        
        fushaETekstitKerko.layer.shadowColor = UIColor.brown.cgColor
        
        fushaETekstitKerko.layer.shadowOpacity = 0.7
        
        fushaETekstitKerko.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        
        fushaETekstitKerko.layer.masksToBounds = false
        
    }
    
    
}

//MARK: - UITextFieldDelegate

extension SearchController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print(fushaETekstitKerko.text!)
        
        fushaETekstitKerko.endEditing(true)
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text?.count == 0 {
            
            DispatchQueue.main.async {
                
                searchBar.resignFirstResponder()
                
            }
            
        }
        
        
    }
    
    
}
