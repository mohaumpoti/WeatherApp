//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var headerImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(errorLabel)
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            errorLabel.topAnchor.constraint(equalTo: view.topAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(headerCityLabel)
        NSLayoutConstraint.activate([
            headerCityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            headerCityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(headerCurrentTemperatureLabel)
        NSLayoutConstraint.activate([
            headerCurrentTemperatureLabel.topAnchor.constraint(equalTo: headerCityLabel.topAnchor, constant: 32),
            headerCurrentTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(headerWeatherDescriptionLabel)
        NSLayoutConstraint.activate([
            headerWeatherDescriptionLabel.topAnchor.constraint(equalTo: headerCurrentTemperatureLabel.bottomAnchor, constant: 16),
            headerWeatherDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    private lazy var headerCityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private lazy var headerCurrentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var headerWeatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36)
        label.textColor = .white
        return label
    }()
    
    private lazy var temperatureContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let topStackView = UIStackView()
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        topStackView.layoutMargins = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        topStackView.isLayoutMarginsRelativeArrangement = true
        topStackView.addArrangedSubview(minTemperatureLabel)
        topStackView.addArrangedSubview(currentTemperatureLabel)
        topStackView.addArrangedSubview(maxTemperatureLabel)
        view.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topStackView.topAnchor.constraint(equalTo: view.topAnchor),
            topStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 2)
        ])
        
        let bottomStackView = UIStackView()
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        bottomStackView.layoutMargins = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        bottomStackView.isLayoutMarginsRelativeArrangement = true
        bottomStackView.addArrangedSubview(minLabel)
        bottomStackView.addArrangedSubview(currentLabel)
        bottomStackView.addArrangedSubview(maxLabel)
        
        view.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: -16),
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "0°"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var minLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "min"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "0°"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var currentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "0°"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var maxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "max"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)

        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.style = .large
        view.color = .white
        return view
    }()

    let interactor = WeatherInteractor()
    var viewModels: [WeatherForecastItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.view = self
        interactor.viewDidAppear()
        activityIndicator.startAnimating()
    }
    
    override var shouldAutorotate: Bool {
        false
    }
    
    // MARK: - Helpers
    
    func update(with viewModel: WeatherViewModel) {
        headerImageView.image = viewModel.weatherType?.backgroundImage
        headerCityLabel.text = viewModel.city
        headerCurrentTemperatureLabel.text = "\(Int(viewModel.temperature))° C"
        headerWeatherDescriptionLabel.text = viewModel.weatherType?.description
        
        // populate min, current and max temperature labels
        minTemperatureLabel.text = "\(Int(viewModel.minTemperature))° C"
        currentTemperatureLabel.text = "\(Int(viewModel.temperature))° C"
        maxTemperatureLabel.text = "\(Int(viewModel.maxTemperature))° C"
        
        // set view background colors
        temperatureContainerView.backgroundColor = viewModel.weatherType?.color
        tableView.backgroundColor = viewModel.weatherType?.color
        
        errorLabel.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func update(with errorMessage: String) {
        errorLabel.text = errorMessage
        errorLabel.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    private func setupConstraints() {
        // header view
        view.addSubview(headerImageView)
        NSLayoutConstraint.activate([
            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImageView.topAnchor.constraint(equalTo: view.topAnchor),
            headerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2 / 5)
        ])
        
        // temperature container view
        view.addSubview(temperatureContainerView)
        NSLayoutConstraint.activate([
            temperatureContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            temperatureContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            temperatureContainerView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor),
            temperatureContainerView.heightAnchor.constraint(equalToConstant: 70.0)
        ])
        
        // underline view
        view.addSubview(underlineView)
        NSLayoutConstraint.activate([
            underlineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            underlineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            underlineView.topAnchor.constraint(equalTo: temperatureContainerView.bottomAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
        
        // table view
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: underlineView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // activity indicator
        view.addSubview(activityIndicator)
        headerImageView.embed(activityIndicator)
    }
}

// MARK: - UITableView UITableViewDelegate

extension WeatherViewController: UITableViewDelegate {}

// MARK: - UITableView UITableViewDataSource

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        cell.populate(using: viewModels[indexPath.row], and: tableView.backgroundColor)
        return cell
    }
}

