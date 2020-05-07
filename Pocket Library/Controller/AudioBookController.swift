

import UIKit

class AudioBookController: UIViewController {
    
    let libraAudio = LibraAudio.libratAudio
    
    var indeks: IndexPath = []
    
    //MARK: - Lifecycle i Appit
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 0.8039215686, green: 0.5215686275, blue: 0.2470588235, alpha: 1))
        
    }
    
    
}

//MARK: - Table View

extension AudioBookController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return libraAudio.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.libraAudioCell, for: indexPath) as! LibraAudioCell
        
        cell.foto.image = libraAudio[indexPath.row].fotojaELibrit
        
        cell.titull.text = libraAudio[indexPath.row].titulliLibrit
        
        cell.autor.text = libraAudio[indexPath.row].autoriLibrit
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            indeks = indexPath
            
        }
        
        self.performSegue(withIdentifier: K.shkoTekAudio, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.shkoTekAudio {
            
            let teDhenatAudio = segue.destination as! DetajeAudioController
            
            teDhenatAudio.fotojaEZgjedhur = libraAudio[indeks.row].fotojaELibrit
            
            teDhenatAudio.titulliZgjedhur = libraAudio[indeks.row].titulliLibrit
            
            teDhenatAudio.autoriZgjedhur = libraAudio[indeks.row].autoriLibrit
            
            teDhenatAudio.gjatesia = libraAudio[indeks.row].gjatesiaEAudios
            
            teDhenatAudio.url = libraAudio[indeks.row].urlAudio
            
        }
        
    }
    
}
