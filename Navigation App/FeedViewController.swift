//
//  FeedViewController.swift
//  Navigation
//
//  Created by Matvey Krasnov on 7.8.24..
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        
        let postButton = UIButton(type: .system)
        
        postButton.setTitle("New post", for: .normal)
        
        postButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
        postButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    @objc func showPost() {
        let post = Post(title: "New Post")
        
        let postVC = PostViewController(post: post)
//        let postVC = UINavigationController()
//        postVC.viewControllers = [PostViewController(post: post)
        
        navigationController?.pushViewController(postVC, animated: true)
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
