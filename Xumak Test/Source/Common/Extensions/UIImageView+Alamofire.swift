//
//  UIImageView+Alamofire.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//


import AlamofireImage

extension UIImageView {
    
    func loadImage(path: String?, placeholder: UIImage? = nil, completion: ((UIImage?) -> Void)? = nil) {
        
        guard let strongPath = path else {
            image = placeholder != nil ? placeholder : UIImage(named: "book-placeholder")
            image?.accessibilityIdentifier = "book-placeholder"
            if let completion = completion {
                completion(image)
            }
            return
        }
        
        guard
            let urlEncoded = strongPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlEncoded) else { return }
        
        let imagePlaceholder = placeholder != nil ? placeholder : UIImage(named: "book-placeholder")
        imagePlaceholder?.accessibilityIdentifier = "book-placeholder"
        af.setImage(withURL: url,
                    placeholderImage: imagePlaceholder,
                    imageTransition: .crossDissolve(0.2),
                    runImageTransitionIfCached: false,
                    completion: { response in
                        if let completion = completion {
                            completion(response.value)
                        }
                    })
    }
    
}
