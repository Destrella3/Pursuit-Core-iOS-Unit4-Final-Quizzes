//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Diego Estrella III on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private var profilePickerViewContoller: UIImagePickerController!

    @IBOutlet weak var profileImageButton: UIButton!
    
    @IBOutlet weak var profileImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleButtonImage()
        profilePickerViewContoller = UIImagePickerController()
        profilePickerViewContoller.delegate = self
    }
    
    private func circleButtonImage() {
        profileImageButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        profileImageButton.layer.cornerRadius = 1 * profileImageButton.bounds.size.width
        profileImageButton.clipsToBounds = true
    }
    
    @IBAction func profileImagePressed(_ sender: UIButton) {
        showLibrayPhoto()
    }
    
    private func showLibrayPhoto() {
        present(profilePickerViewContoller, animated: true, completion: nil)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageButton.setImage(image, for: .normal)
        } else {
            print("original image is nil")
        }
        dismiss(animated: true, completion: nil)
        
    }
}
