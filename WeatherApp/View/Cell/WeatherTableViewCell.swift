//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    static let identifier: String = "WeatherTableViewCell"
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.layer.borderWidth = 0
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func populate(using weatherItem: WeatherForecastItem, and backgroundColor: UIColor?) {
        // day label
        dayLabel.text = weatherItem.weekday
        
        // temperature label
        temperatureLabel.text = weatherItem.temperatureAsString
        
        // cell background color
        contentView.backgroundColor = backgroundColor
        
        // weather icon
        weatherIcon.image = weatherItem.icon
    }
    
    private func setupViews() {        
        // day label
        contentView.addSubview(dayLabel)
        NSLayoutConstraint.activate([
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0)
        ])
        
        // weather icon
        contentView.addSubview(weatherIcon)
        NSLayoutConstraint.activate([
            weatherIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherIcon.widthAnchor.constraint(equalToConstant: 32),
            weatherIcon.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        // temperature label
        contentView.addSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            temperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12.0)
        ])
    }
}
