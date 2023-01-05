//
//  UpcomingViewController.swift
//  Netflix
//
//  Created by Dimash Nsanbaev on 10/24/22.
//

import UIKit

class UpcomingViewController: UIViewController {
    private var titles: [Title] = [Title]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        upcomingTable.dataSource = self
        upcomingTable.delegate = self
        navigationItem.title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(upcomingTable)
        
        fetchUpcoming()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    private let upcomingTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    private func fetchUpcoming() {
        APICaller.shared.getUpcomingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    

}
extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: title.original_title ?? "Uknown data", posterURL: title.poster_path ?? "uknown"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}