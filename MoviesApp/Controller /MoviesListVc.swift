//
//  MoviesListVc.swift
//  MoviesApp
//
//  Created by Abservetech on 26/09/22.
//

import UIKit
import SDWebImage


class MoviesListVc: UIViewController {
    
    //MARK: - CONSTRAINTS :
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTableview: UITableView!
    
    
    //MARK: - PROPERTIES
    var moviesListVm = MoviesListVm()
    var moviesListArray = [ResultModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        moviesList()
    }
}

extension MoviesListVc : UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - NUMBER OF COUNTS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.moviesListArray.isEmpty {
            return 0
        } else {
            return self.moviesListArray.count
        }
    }
    
    //MARK: - ASSIGN VALUES
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesListTableViewCell
        
        let details = self.moviesListArray[indexPath.row]
        let moviesimage = Constant.Imgkey.baseImgurl  + details.poster_path
        cell.moviesImg.sd_setImage(with: URL(string: moviesimage), placeholderImage: UIImage(named: "tree"))
        cell.nameLb.text! = details.title
        cell.ratingLb.text! = details.vote_average.description

        //MARK: - TOUCH ACTION :
        
        cell.contentView.addTap {
            let moviesDetailVc = MoviesDetailVc.instantiate(fromAppStoryboard: .main)
            moviesDetailVc.moviesDetails = details
            self.navigationController?.pushViewController(moviesDetailVc, animated: true)
        }
        return cell
        
    }
}
extension MoviesListVc : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search Text \(searchText)")
        if searchText.count >= 3 {
            let filtered = self.moviesListArray.filter { $0.title.contains(searchText)}
            moviesListArray = filtered
            self.moviesTableview.reloadData()
            print("filter valuess::\(filtered)")
        } else {
            moviesList()
        }
    }
}
extension MoviesListVc {
    func moviesList() {
        moviesListVm.moviesList()
        moviesListVm.successHandler = { (data) in
            print("SUCCESS::\(data)")
            self.moviesListArray = data.moviesList
            self.moviesTableview.reloadData()
        }
        moviesListVm.errorHandler = { (error) in
            ShowAlert.instance.showToast(msg: error)
            
        }
    }
}
struct Constant {
    
    struct  Imgkey {
        static let  baseImgurl = "https://image.tmdb.org/t/p/w500"
    }
    
    struct MoviesDetailsKey  {
        
        static let duration = "Duration: "
        static let releasedate = "Release Date: "
        static let language = "Languages: "
        static let genres = "Genres: "
        static let ratings = "Rating: "
        
    }
    
}
