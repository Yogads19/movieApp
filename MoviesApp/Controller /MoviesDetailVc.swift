//
//  MoviesDetailVc.swift
//  MoviesApp
//
//  Created by Abservetech on 26/09/22.
//

import UIKit
import SDWebImage

class MoviesDetailVc: UIViewController {
    
    //MARK: - CONSTRAINTS :
    
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var aboutTxtView: UITextView!
    @IBOutlet weak var aboutTxtHgt: NSLayoutConstraint!
    @IBOutlet weak var castTxtView: UITextView!
    @IBOutlet weak var castTxtHgt: NSLayoutConstraint!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var durationLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var languageLb: UILabel!
    @IBOutlet weak var genresLb: UILabel!
    @IBOutlet weak var ratingLb: UILabel!
    @IBOutlet weak var aboutTxView: UITextView!
    @IBOutlet weak var castTxView: UITextView!
    @IBOutlet weak var topImg: UIImageView!
    
    //MARK: - PROPERTIES :
    var moviesDetails = ResultModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAction()
        cornerSetup()
        valueSetup()
    }
}

extension MoviesDetailVc {
    func valueSetup() {
        titleLb.text! = moviesDetails.title
        let moviesimage = Constant.Imgkey.baseImgurl  + moviesDetails.poster_path
        topImg.sd_setImage(with: URL(string: moviesimage), placeholderImage: UIImage(named: "tree"))
        
        //MARK : DATE FORMAT SETUP :
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "YYYY-MM-dd"
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM yyyy"
        let showDate = inputFormatter.date(from: moviesDetails.release_date)
        let resultString = outputFormatter.string(from: showDate!)


        dateLb.text! =  Constant.MoviesDetailsKey.releasedate + resultString
        languageLb.text! = Constant.MoviesDetailsKey.language + moviesDetails.original_language
        genresLb.text! = Constant.MoviesDetailsKey.genres + moviesDetails.media_type
        ratingLb.text! = Constant.MoviesDetailsKey.ratings + moviesDetails.vote_average.description + " & " + moviesDetails.vote_count.description + " votes"
        aboutTxView.text! = moviesDetails.overview
    }
}
extension MoviesDetailVc {
    
    func cornerSetup() {
        aboutTxtHgt.constant = self.aboutTxtView.contentSize.height
        castTxtHgt.constant = self.castTxtView.contentSize.height
        aboutTxView.isUserInteractionEnabled = false
        castTxView.isUserInteractionEnabled = false
        [aboutTxtView, castTxtView].forEach { txtvw in
            txtvw?.translatesAutoresizingMaskIntoConstraints = false
            txtvw?.isScrollEnabled = false
        }
    }
    func setupAction() {
        backImg.addTap {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
