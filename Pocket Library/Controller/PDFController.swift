


import UIKit
import PDFKit

class PDFController: UIViewController {
    
    //MARK: - Karakteristikat
    
    @IBOutlet weak var fotoELibritOutlet: UIImageView!
    @IBOutlet weak var titulliLibritOutlet: UILabel!
    @IBOutlet weak var autoriLibritOutlet: UILabel!
    @IBOutlet weak var numriFaqeveOutlet: UILabel!
    @IBOutlet weak var butoniReadOutlet: UIButton!

    
    var fotojaEZgjedhur: UIImage = #imageLiteral(resourceName: "fotoEPare")
    
    var titulliZgjedhur = ""
    
    var autoriZgjedhur = ""
    
    var numer: Int = 0
    
    let libratRelated = LibraTeRinj.libratTeRinj
    
    
    //MARK: - Lifecycle i App - it
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        konfiguroUI()
        
    }
    
    func konfiguroUI() {
        
        fotoELibritOutlet.image = fotojaEZgjedhur
        
        titulliLibritOutlet.text = "Title:  \(titulliZgjedhur)"
        
        autoriLibritOutlet.text =  "Author:   \(autoriZgjedhur)"
        
        numriFaqeveOutlet.text = "Pages:  \(numer)"
        
        view.karakteristikatEButonit(buton: butoniReadOutlet)
        
        view.karakteristikatView(view: fotoELibritOutlet)
        
        self.navigationItem.title = titulliZgjedhur
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 0.8039215686, green: 0.5215686275, blue: 0.2470588235, alpha: 1))
        
    }
    
    //MARK: - Shfaqja e PDF
    
    @IBAction func butoniReadAction(_ sender: UIButton) {
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(shfaqPDF), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func shfaqPDF() {
        
        let pdfView = PDFView()
        
        self.navigationItem.title = titulliZgjedhur
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pdfView)
        
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        guard let path = Bundle.main.url(forResource: titulliZgjedhur, withExtension: "pdf") else { return }
        
        if let document = PDFDocument(url: path) {
            pdfView.document = document
        }
        
    }
    
  
    
}

//MARK: - UICollectionViewDelegate

extension PDFController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return libratRelated.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.relatedCollectionView, for: indexPath) as! RelatedCollectionCell
        
        cell.foto.image = libratRelated[indexPath.row].fotojaELibrit
        
        cell.titulli.text = libratRelated[indexPath.row].titulliLibrit
        
        return cell
        
    }
    
}


