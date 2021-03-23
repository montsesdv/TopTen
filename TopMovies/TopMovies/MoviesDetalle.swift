//
//  MoviesDetalle.swift
//  TopMovies
//
//  Created by Montserrat De la Paz on 22/03/21.
//  Copyright © 2021 Montserrat De la Paz. All rights reserved.
//

import UIKit

class MoviesDetalle: UIViewController {

    @IBOutlet weak var tituloDet: UILabel!
    @IBOutlet weak var imgDet: UIImageView!
    @IBOutlet weak var descDet: UILabel!
    @IBOutlet weak var fechaDet: UILabel!
    @IBOutlet weak var rakingDet: UILabel!
    
    var topTen = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let urlImg = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2"
        tituloDet.text = "Titulo: " + topTen[0].original_title!
        descDet.text = "Descripción: " + topTen[0].overview!
        fechaDet.text = "Fecha de lanzamiento: " + topTen[0].release_date!
        rakingDet.text = "rating: " + String(format: "%f", topTen[0].vote_average!)
        
    if let imageURL = URL(string: urlImg + topTen[0].poster_path!){
        DispatchQueue.global().async {
            let data  = try? Data(contentsOf: imageURL)
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imgDet.image = image
                }
            }
        }
    }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
