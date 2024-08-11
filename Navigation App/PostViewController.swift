//
//  PostViewController.swift
//  Navigation
//
//  Created by Matvey Krasnov on 7.8.24..
//

import UIKit

struct Post {
    let title: String
}

class PostViewController: UIViewController {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = .white
        title = post.title
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showInfo))
        
        let alertButton = UIButton(type: .system)
        
        alertButton.setTitle("Check alert", for: .normal)
        
        alertButton.setImage(UIImage(systemName: "exclamationmark.triangle"), for: .normal)
        
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        // Do any additional setup after loading the view.
    }
    
    @objc func showInfo() {
        let infoVC = UINavigationController()
        
        infoVC.viewControllers = [InfoViewController()]
        
        infoVC.modalPresentationStyle = .pageSheet
        infoVC.modalTransitionStyle = .coverVertical
        
        tabBarController?.present(infoVC, animated: true, completion: nil)
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "Your post is not a post", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true, completion: {
            return
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
