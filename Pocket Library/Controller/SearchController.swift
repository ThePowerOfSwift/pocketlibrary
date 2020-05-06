


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
        
        view.karakteristikaView(fushaETekstitKerko)
        
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
