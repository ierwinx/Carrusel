import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iCarouselView: iCarousel!
    
    let imagenesMostrar: [UIImage] = [
        UIImage(named: "uno")!,
        UIImage(named: "dos")!,
        UIImage(named: "tres")!,
        UIImage(named: "cuatro")!,
        UIImage(named: "cinco")!,
        UIImage(named: "seis")!,
        UIImage(named: "siete")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iCarouselView.delegate = self
        iCarouselView.dataSource = self
        iCarouselView.type = .coverFlow
        //iCarouselView.isPagingEnabled = true // este evita que se pasen ultra rapido las imagenes
        iCarouselView.contentMode = .scaleAspectFill
    }

}

extension ViewController: iCarouselDelegate, iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return self.imagenesMostrar.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imagen: UIImageView!
        
        if view == nil {
            imagen = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
            imagen.contentMode = .scaleAspectFill
        } else {
            imagen = view as? UIImageView
        }
        
        imagen.image = self.imagenesMostrar[index]
        
        return imagen
    }
    
}
