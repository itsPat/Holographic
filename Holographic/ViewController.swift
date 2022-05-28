//
//  ViewController.swift
//  Holographic
//
//  Created by Pat Trudel on 5/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    let container = UIView(frame: .zero)
    let shinyView = HolographicView(frame: .zero)
    let borderView = UIView(frame: .zero)
    let maskView = UIView(frame: .zero)
    let label = UILabel(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        shinyView.mask = maskView
    }
    
    func setupViews() {
        container.backgroundColor = .label.withAlphaComponent(0.05)
        container.layer.cornerCurve = .continuous
        container.layer.cornerRadius = 20.0
        container.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        label.textColor = .black
        label.text = "Pat Trudel"
        label.font = .boldSystemFont(ofSize: 72)
        label.textAlignment = .center
        
        borderView.layer.borderColor = UIColor.black.cgColor
        borderView.layer.borderWidth = 10.0
        borderView.layer.cornerCurve = .continuous
        borderView.layer.cornerRadius = 20.0
        borderView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        shinyView.scale = 3.0
        shinyView.colors = [
            .systemRed.withAlphaComponent(0.9),
            .systemOrange.withAlphaComponent(0.9),
            .systemYellow.withAlphaComponent(0.9),
            .systemGreen.withAlphaComponent(0.9),
            .systemBlue.withAlphaComponent(0.9),
            .systemPurple.withAlphaComponent(0.9),
            .systemPink.withAlphaComponent(0.9)
        ]
        
        maskView.addSubview(label)
        maskView.addSubview(borderView)
        container.addSubview(maskView)
        container.addSubview(shinyView)
        view.addSubview(container)
        
        container.addParallaxRotation(maxRotationDegrees: 45, inverted: true)
    }
    
    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        maskView.translatesAutoresizingMaskIntoConstraints = false
        shinyView.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            container.heightAnchor.constraint(equalToConstant: 320),
            
            shinyView.topAnchor.constraint(equalTo: container.topAnchor),
            shinyView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            shinyView.leftAnchor.constraint(equalTo: container.leftAnchor),
            shinyView.rightAnchor.constraint(equalTo: container.rightAnchor),
            
            maskView.topAnchor.constraint(equalTo: container.topAnchor),
            maskView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            maskView.leftAnchor.constraint(equalTo: container.leftAnchor),
            maskView.rightAnchor.constraint(equalTo: container.rightAnchor),
            
            borderView.topAnchor.constraint(equalTo: maskView.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: maskView.bottomAnchor),
            borderView.leftAnchor.constraint(equalTo: maskView.leftAnchor),
            borderView.rightAnchor.constraint(equalTo: maskView.rightAnchor),
            
            label.leftAnchor.constraint(equalTo: maskView.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: maskView.rightAnchor, constant: -20),
            label.centerYAnchor.constraint(equalTo: maskView.centerYAnchor)
        ])
    }


}

