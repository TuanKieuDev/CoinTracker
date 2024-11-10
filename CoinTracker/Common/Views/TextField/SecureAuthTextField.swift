//
//  SecureAuthTextField.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 24/10/2024.
//

import UIKit

final class SecureAuthTextField: AuthTextField {
    
    // The button for toggling password visibility
    private let toggleButton = UIButton(type: .custom)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSecureTextField()
    }
    
    private func setupSecureTextField() {
        // Enable secure text entry by default
        self.isSecureTextEntry = true
        
        // Set up the eye icon (password visibility toggle button)
        toggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)   // Eye icon for hidden password
        toggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)  // Eye-slash icon for visible password
        toggleButton.tintColor = .gray
        toggleButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        // Add action to toggle the visibility of the password
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        // Create a container view for the button with padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 24))
        toggleButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        paddingView.addSubview(toggleButton)
        
        // Set the right view of the text field with padding
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    // MARK: - Toggle Password Visibility
    @objc private func togglePasswordVisibility() {
        self.isSecureTextEntry.toggle()  // Toggle the secure text entry state
        toggleButton.isSelected.toggle()  // Toggle the button's selected state to switch icons
        
        // Fix cursor position after toggling the password
        let currentText = self.text
        self.text = ""
        self.text = currentText
    }
}
