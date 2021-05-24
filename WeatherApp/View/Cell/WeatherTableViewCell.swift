//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 24/05/2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
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
        imageView.image = UIImage(named: "clear")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(using weatherItem: WeatherForecastItem, and backgroundColor: UIColor?) {
        // day label
        let date = Date(timeIntervalSince1970: TimeInterval(weatherItem.dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dayLabel.text = dateFormatter.string(from: date)
        
        // temperature label
        temperatureLabel.text = "\(Int(weatherItem.main.temp))°"
        
        // cell background color
        contentView.backgroundColor = backgroundColor
        
        // weather icon
        guard let mainWeather = weatherItem.weather.first?.main else { return }
        let weatherType = WeatherType(rawValue: mainWeather.lowercased())
        weatherIcon.image = weatherType?.icon
    }
    
    private func setupViews() {
        contentView.backgroundColor = .orange
        
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
