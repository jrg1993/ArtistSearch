//
//  ViewController.swift
//  JustinMusicSearch
//
//  Created by Justin Gluck on 10/28/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var artResults: Results?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    @IBAction func searchTapped(_ sender: UIButton) {
        let url = URL(string: "http://itunes.apple.com/search?term=\(searchTextField.text ?? "yeah yeah yeahs")");
        spinner.startAnimating()
        
        let session = URLSession.shared
        session.dataTask(with: url!) { [self] (data, response, error) in
            if let data = data {
                do {
                  self.artResults = try JSONDecoder().decode(Results.self, from: data)
                } catch {
                    return
                }
                DispatchQueue.main.sync {
                    self.spinner.stopAnimating()
                    SearchArtResults.sharedInstance.resultsart = self.artResults
                    self.tabBarController!.selectedIndex=1;
                }
            }
        }.resume()
    
    }
    

}

