//
//  Movie.swift
//  TopMovies
//
//  Created by Montserrat De la Paz on 22/03/21.
//  Copyright © 2021 Montserrat De la Paz. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var tituloLbl: UILabel!
    @IBOutlet var fechaLbl: UILabel!
    
    @IBOutlet var imageLbl: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
