//
//  ViewController.swift
//  URLSender
//
//  Created by Sergey Zaycev on 31.03.2020.
//  Copyright © 2020 s.zaycev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let appleMapsUrl = "https://maps.apple.com/?q="
    private let youtubeUrl   = "https://youtube.com/results?search_query="
    private let receiverUrl  = "receiverapp://"
    
    
    // MARK: - Views
    @IBOutlet private weak var searchTextField: UITextField!
    
    
    // MARK: - Properties
    private var userInput: String { searchTextField.text ?? "" }
    
    
    // MARK: - User Interactions
    @IBAction func openAppleMaps(_ sender: UIButton) {
        guard let url = URL(string: appleMapsUrl + userInput) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func openYouTube(_ sender: UIButton) {
        guard let url = URL(string: youtubeUrl + userInput) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func openReceiverApp(_ sender: UIButton) {
        guard let url = URL(string: receiverUrl + userInput) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            showAlert()
        }
    }
}


// MARK: - Private
private extension ViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "Receiver not found",
                                      message: "ReceiverApp is not installed on this device",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
