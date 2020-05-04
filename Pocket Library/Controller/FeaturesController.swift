


import UIKit

class FeaturesController: UIViewController {
    
    //MARK: - Karakteristikat
    
    @IBOutlet weak var shprehjeView: UIView!
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    @IBOutlet weak var fotoGeorgeMartin: UIImageView!
    @IBOutlet weak var butoniQuoteOutlet: UIButton!
    
    
    var titull: String = ""
    
    var foto: UIImage = #imageLiteral(resourceName: "fotoMotivuese")
    
    var autor: String = ""
    
    var gjatesia: String = ""
    
    var url: String = ""
    
    var numriFaqeve: Int = 0
    
    
    //MARK: - Librat e rinj dhe popullor
    
    let libratMeTeRinj =  LibraTeRinj.libratTeRinj
    
    let libratMePopullor = LibraPopullor.libratPopullor
    
    let libraAudioPopullor = LibraAudioPoullor.libraAudioPopullor
    
    
    //MARK: - Lifecycle e App - it
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        kofiguroUI()
        
        Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(shfaqInformacion), userInfo: nil, repeats: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
    func kofiguroUI() {
        
        view.karakteristikatEFotos(foto: fotoGeorgeMartin)
        
        view.karakteristikatView(view: shprehjeView)
        
        view.karakteristikatCollView(collectionView: collectionView1)
        
        view.karakteristikatCollView(collectionView: collectionView2)
        
        view.karakteristikatEButonit(buton: butoniQuoteOutlet)
        
        collectionView1.allowsMultipleSelection = false
        
        collectionView1.allowsMultipleSelection = false
        
        collectionView1.allowsMultipleSelection = false
        
    }
    
    
    //MARK: - PopUp Informacion
    
    @objc func shfaqInformacion() {
        
        AlertView.shfaqInfo()
        
    }
    
}


//MARK: - UICollectionViewDelegate

extension FeaturesController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == collectionView2) {
            
            return libratMePopullor.count
            
        }
            
        else if (collectionView == collectionView3) {
            
            return libraAudioPopullor.count
            
        }
        
        return libratMeTeRinj.count
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView1.dequeueReusableCell(withReuseIdentifier: K.collectionCell1, for: indexPath) as! TeRejatCollectionCell
        
        cell1.fotoCollView1.image = libratMeTeRinj[indexPath.row].fotojaELibrit
        
        cell1.titulliCollView1.text = libratMeTeRinj[indexPath.row].titulliLibrit
        
        if (collectionView == collectionView2) { 
            
            let cell2 = collectionView2.dequeueReusableCell(withReuseIdentifier: K.collectionCell2, for: indexPath) as! PopulloretCollectionCell
            
            cell2.fotoCollView2.image = libratMePopullor[indexPath.row].fotojaELibrit
            
            cell2.titulliCollView2.text = libratMePopullor[indexPath.row].titulliLibrit
            
            return cell2
            
        }
            
        else  if (collectionView == collectionView3) {
            
            let cell3 = collectionView3.dequeueReusableCell(withReuseIdentifier: K.collectionCell3, for: indexPath) as! PopulloreAudioCollectionCell
            
            cell3.fotoCollView3.image = libraAudioPopullor[indexPath.row].fotojaELibrit
            
            cell3.titulliCollView3.text = libraAudioPopullor[indexPath.row].titulliLibrit
            
            return cell3
            
        }
        
        return cell1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == collectionView1) {
            
            foto = libratMeTeRinj[indexPath.row].fotojaELibrit
            
            titull = libratMeTeRinj[indexPath.row].titulliLibrit
            
            autor = libratMeTeRinj[indexPath.row].autoriLibrit
            
            numriFaqeve = libratMeTeRinj[indexPath.row].numriFaqeve
            
            self.performSegue(withIdentifier: K.shkoTekPdfEPlote, sender: self)
            
        }
            
        else if (collectionView == collectionView2) {
            
            foto = libratMePopullor[indexPath.row].fotojaELibrit
            
            titull = libratMePopullor[indexPath.row].titulliLibrit
            
            autor = libratMePopullor[indexPath.row].autoriLibrit
            
            numriFaqeve = libratMePopullor[indexPath.row].numriFaqeve
        
            self.performSegue(withIdentifier: K.shkoTekPdfEPlote, sender: self)
            
        }
            
        else {
            
            foto = libraAudioPopullor[indexPath.row].fotojaELibrit
            
            titull = libraAudioPopullor[indexPath.row].titulliLibrit
            
            autor = libraAudioPopullor[indexPath.row].autoriLibrit
            
            gjatesia = libraAudioPopullor[indexPath.row].gjatesiaEAudios
            
            url = libraAudioPopullor[indexPath.row].urlAudio
            
            self.performSegue(withIdentifier: K.shkoTekAudioEPlote, sender: self)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.shkoTekAudioEPlote {
            
            let destinacionAudio = segue.destination as! DetajeAudioController
            
            destinacionAudio.fotojaEZgjedhur = foto
            
            destinacionAudio.titulliZgjedhur = titull
            
            destinacionAudio.autoriZgjedhur = autor
            
            destinacionAudio.gjatesia = gjatesia
            
            destinacionAudio.url = url
            
        }
        
        else  if segue.identifier == K.shkoTekPdfEPlote {
            
            let destinacionPDF = segue.destination as! PDFController
            
            destinacionPDF.fotojaEZgjedhur = foto
            
            destinacionPDF.titulliZgjedhur = titull
            
            destinacionPDF.autoriZgjedhur = autor
            
            destinacionPDF.numer = numriFaqeve
            
        }
        
    }
    
}

