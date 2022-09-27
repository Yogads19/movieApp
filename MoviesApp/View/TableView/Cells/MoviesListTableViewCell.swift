//
//  MoviesListTableViewCell.swift
//  MoviesApp
//
//  Created by Abservetech on 26/09/22.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {
    
    //MARK: - CONSTRAINTS :
    
    @IBOutlet weak var ratingLb: UILabel!
    @IBOutlet weak var ratingImg: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var moviesImg: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    
    //MARK: - PROPERTIES :

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
