//
//  ViewController.swift
//  Concurrency_Example
//
//  Created by HeecheolYoon on 2023/03/02.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstLoadButton: UIButton!
    @IBOutlet weak var firstProgressView: UIProgressView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondLoadButton: UIButton!
    @IBOutlet weak var secondProgressView: UIProgressView!
    
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var thirdLoadButton: UIButton!
    @IBOutlet weak var thirdProgressView: UIProgressView!
    
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fourthLoadButton: UIButton!
    @IBOutlet weak var fourthProgressView: UIProgressView!
    
    @IBOutlet weak var fifthImageView: UIImageView!
    @IBOutlet weak var fifthLoadButton: UIButton!
    @IBOutlet weak var fifthProgressView: UIProgressView!
    
    @IBOutlet weak var loadAllImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    private func configure() {
        firstLoadButton.addTarget(self, action: #selector(tapLoadButton), for: .touchUpInside)
        secondLoadButton.addTarget(self, action: #selector(tapLoadButton), for: .touchUpInside)
        thirdLoadButton.addTarget(self, action: #selector(tapLoadButton), for: .touchUpInside)
        fourthLoadButton.addTarget(self, action: #selector(tapLoadButton), for: .touchUpInside)
        fifthLoadButton.addTarget(self, action: #selector(tapLoadButton), for: .touchUpInside)
        loadAllImageButton.addTarget(self, action: #selector(tapLoadButton), for: .touchUpInside)
    }
}

extension ViewController {
    
    @objc private func tapLoadButton(_ sender: UIButton) {
        switch sender {
        case firstLoadButton:
            loadImage(firstImageView)
        case secondLoadButton:
            loadImage(secondImageView)
        case thirdLoadButton:
            loadImage(thirdImageView)
        case fourthLoadButton:
            loadImage(fourthImageView)
        case fifthLoadButton:
            loadImage(fifthImageView)
        default:
            loadImage(firstImageView)
            loadImage(secondImageView)
            loadImage(thirdImageView)
            loadImage(fourthImageView)
            loadImage(fifthImageView)
        }
    }
    
    private func loadImage(_ imageView: UIImageView) {
        imageView.image = UIImage(systemName: "photo")
        var request = URLRequest(url: URL(string: "https://picsum.photos/200/300")!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300, let data = data, let imageData = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                print("다운 성공")
                imageView.image = imageData
            }
        }.resume()
    }
}
