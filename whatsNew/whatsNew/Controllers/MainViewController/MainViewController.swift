//
//  MainViewController.swift
//  whatsNew
//
//  Created by Mohammed Saqib on 28/11/23.
//

import UIKit

class MainViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //variables
    var cellDataSource: [MovieTableCellViewModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                }
                else
                {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
        
    }
    
    func openDetails(movieId: Int) {
        guard let movie = viewModel.retrieveMovie(with: movieId) else {
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsViewController = DetailsMovieViewController(viewModel: detailsViewModel)
        
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }

}
