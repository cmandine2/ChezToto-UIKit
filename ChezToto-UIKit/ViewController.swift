//
//  ViewController.swift
//  ChezToto-UIKit
//
//  Created by Amandine Cousin on 22/11/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var banImageView: UIImageView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setUpUI()
    }
    
    private func setUpUI() {
        self.menuButton.layer.cornerRadius = 10
        self.setUpDetailsView()
        self.setUpBan()
    }
    
    private func setUpBan() {
        let backView = UIView()
        backView.layer.cornerRadius = 10
        backView.backgroundColor = .white
        
        self.banImageView.addSubview(backView)
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.centerXAnchor.constraint(equalTo: self.banImageView.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: self.banImageView.centerYAnchor).isActive = true
        backView.widthAnchor.constraint(equalToConstant: 117).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = "Chez Toto"
        
        backView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: backView.centerYAnchor, constant: -4).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 86).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = "Pizzeria"
        
        backView.addSubview(subTitleLabel)
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: backView.centerYAnchor, constant: 4).isActive = true
        subTitleLabel.widthAnchor.constraint(equalToConstant: 42).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setUpDetailsView() {
        let schedule: [(day: String, hours: String)] = [
                    ("Lundi", "Fermé"),
                    ("Mardi", "11h30-14h30・18h30-22h00"),
                    ("Mercredi", "11h30-14h30・18h30-22h00"),
                    ("Jeudi", "11h30-14h30・18h30-22h00"),
                    ("Vendredi", "11h30-14h30・18h30-22h00"),
                    ("Samedi", "11h30-14h30・18h30-22h00"),
                    ("Dimanche", "Fermé")
                ]

        var previousView: UIView = self.detailsView
        for (day, hours) in schedule {
            let lineView = LineView()
            lineView.setUpLineContent(day: day, openTime: hours)
            self.detailsView.addSubview(lineView)
            lineView.translatesAutoresizingMaskIntoConstraints = false
            if previousView === self.detailsView {
                lineView.topAnchor.constraint(equalTo: previousView.topAnchor).isActive = true
            }
            else {
                lineView.topAnchor.constraint(equalTo: previousView.bottomAnchor).isActive = true
            }
            lineView.leftAnchor.constraint(equalTo: self.detailsView.leftAnchor).isActive = true
            lineView.rightAnchor.constraint(equalTo: self.detailsView.rightAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            previousView = lineView
        }
    }
}

class LineView: UIView {
    var day: String = ""
    var openTime: String = ""
    
    func setUpLineContent(day: String, openTime: String) {
        self.day = day
        self.openTime = openTime
        
        self.setUp()
    }
    
    func setUp() {
        var clockImageView: UIImageView = UIImageView(image: UIImage(named: "clock"))
        self.addSubview(clockImageView)
        
        clockImageView.translatesAutoresizingMaskIntoConstraints = false
        clockImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        clockImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        clockImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        clockImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        var dayLabel: UILabel = UILabel()
        dayLabel.text = self.day
        dayLabel.font.withSize(11)
        self.addSubview(dayLabel)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: clockImageView.rightAnchor, constant: 8).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        dayLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        var openTimeLabel: UILabel = UILabel()
        openTimeLabel.text = self.openTime
        openTimeLabel.font.withSize(10)
        openTimeLabel.textAlignment = .right
        self.addSubview(openTimeLabel)
        
        openTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        openTimeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        openTimeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        openTimeLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        openTimeLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
}
