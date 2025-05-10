//
//  BoxofficeViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 5/9/25.
//

import UIKit
import SnapKit

class BoxofficeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    private func setLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func fetchMovies() {
        BoxofficeService.shared.fetchMovies(date: "20250501") { [weak self] movies in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(movie.rank)위: \(movie.movieNm)\n개봉날짜: \(movie.openDt)\n관객수: \(movie.audiAcc)명"
        return cell
    }

}
