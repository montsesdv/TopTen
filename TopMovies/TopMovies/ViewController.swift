//
//  ViewController.swift
//  TopMovies
//
//  Created by Montserrat De la Paz on 22/03/21.
//  Copyright © 2021 Montserrat De la Paz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    final let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=03fce313555a3f8578a30dd7456a5748&language=en-US&page=1")
    
    final let urlImg = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2"
    
    public var topTen = [Result]()
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Movies"
        downloadJson()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func downloadJson(){

        
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            
            guard let data = data, error == nil, urlResponse != nil else {
                print("siguiente paso")
                return
            }
            print("descargando")
            do{
                
                let result = try JSONDecoder().decode(RespuestaApi.self, from: data)
                self.topTen = (result.results)!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch {
                print("Parse Error")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topTen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell else { return UITableViewCell() }
        var posicion = indexPath.row
            cell.tituloLbl.text = topTen[indexPath.row].original_title!
            cell.fechaLbl.text =  topTen[indexPath.row].release_date!
            print(urlImg + topTen[indexPath.row].poster_path!)
            if let imageURL = URL(string: urlImg + topTen[indexPath.row].poster_path!){
                DispatchQueue.global().async {
                    let data  = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.imageLbl.image = image
                        }
                    }
                }
            }
        return cell
    }
    
    
     // MARK: - Navigation
     
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        let vistaDetalle = segue.destination as! MoviesDetalle
        let indice = tableView.indexPathForSelectedRow
        
        vistaDetalle.topTen = [topTen[(indice?.row)!]]
     }
    

}

