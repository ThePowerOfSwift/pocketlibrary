

import UIKit
import PDFKit

class KategoriteController: UIViewController {
    
    //MARK: - Karakteristikat
    
    var emriKategorise: String = ""
    
    var listaELibrave = LibraBiznesKarriere.libratBiznesKarriere
    
    var indeks: IndexPath = []
    
    
    //MARK: - Lifecycle e App - it
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        shfaqLibrat()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 0.8039215686, green: 0.5215686275, blue: 0.2470588235, alpha: 1))
        
        self.navigationItem.title = emriKategorise
        
    }
    
    
    //MARK: - Shfaqja e Librave
    
    func shfaqLibrat() {
        
        switch emriKategorise {
            
        case "Business & Career":
            
            listaELibrave = LibraBiznesKarriere.libratBiznesKarriere
            
            break
            
        case "Technology":
            
            listaELibrave = LibraTeknologji.libratTeknologji
            
            break
            
        case "Conspiracy Theory":
            
            listaELibrave = LibraKonspiracion.libratKonspiracion
            
            break
            
        case "Personal Growth":
            
            listaELibrave = LibraZhvillimPersonal.libratZhvillimPersonal
            
            break
            
        case "Academic & Education":
            
            listaELibrave = LibraAkademike.libratAkademike
            
            break
            
        case "Science & Research":
            
            listaELibrave = LibraShkence.libratEShkences
            
            break
            
        case "Psychology":
            
            listaELibrave = LibraPsikologji.libratPsikologjik
            
            break
            
        case "Health & Fitness":
            
            listaELibrave = LibraFitnes.libratFitnes
            
            break
            
        case "Biography":
            
            listaELibrave = LibraBiografi.libratBiografik
            
            break
            
        case "Religion":
            
            listaELibrave = LibraFetar.libratFetar
            
            break
            
            
        default:
            
            print("Gabim")
            
        }
        
    }
}
    
    //MARK: - Table View
    
    extension KategoriteController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return listaELibrave.count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: K.tabeleCell, for: indexPath) as! TabeleCell
            
            cell.foto.image = listaELibrave[indexPath.row].fotojaELibrit
            
            cell.titull.text = listaELibrave[indexPath.row].titulliLibrit
            
            cell.autor.text = listaELibrave[indexPath.row].autoriLibrit
            
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                indeks = indexPath
                
            }
            
            self.performSegue(withIdentifier: K.shkoTekLibri, sender: self)
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            let backItem = UIBarButtonItem()
            
            backItem.title = ""
            
            navigationItem.backBarButtonItem = backItem
            
            if segue.identifier == K.shkoTekLibri {
                
                let liberSpecifik = segue.destination as! PDFController
                
                liberSpecifik.fotojaEZgjedhur = listaELibrave[indeks.row].fotojaELibrit
                
                liberSpecifik.titulliZgjedhur = listaELibrave[indeks.row].titulliLibrit
                
                liberSpecifik.autoriZgjedhur = listaELibrave[indeks.row].autoriLibrit
                
                liberSpecifik.numer = listaELibrave[indeks.row].numriFaqeve
                
            }
            
        }
        
}

