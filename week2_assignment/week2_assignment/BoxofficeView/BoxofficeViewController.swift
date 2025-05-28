//
//  BoxofficeViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 5/9/25.
//

import UIKit
import SnapKit

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String { String(describing: Self.self) }
}

class BoxofficeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ReuseIdentifiable {

    private let tableView = UITableView()
    private var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        fetchMovies()
    }

    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)

        setDelegate()
        register()
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func register() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: BoxofficeViewController.reuseIdentifier)
    }

    private func fetchMovies() {
        BoxofficeService.shared.fetchMovies(date: "20250527") { [weak self] movies in
            DispatchQueue.main.async {
                self?.movies = movies
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxofficeViewController.reuseIdentifier, for: indexPath)
        let movie = movies[indexPath.row]
        cell.dataBind(movie)

        return cell
    }
}

extension UITableViewCell {
    func dataBind(_ movieData: Movie) {
        self.textLabel?.numberOfLines = 0
        self.textLabel?.text = "\(movieData.rank)위: \(movieData.movieNm)\n개봉날짜: \(movieData.openDt)\n관객수: \(movieData.audiAcc)명"
    }
}
