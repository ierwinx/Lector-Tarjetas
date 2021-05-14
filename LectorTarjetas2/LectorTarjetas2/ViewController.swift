//
//  ViewController.swift
//  LectorTarjetas2
//
//  Created by Erwin on 05/03/21.
//

import UIKit
import PayCardsRecognizer

class ViewController: UIViewController {
    
    var recognizer: PayCardsRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        recognizer = PayCardsRecognizer(delegate: self, resultMode: .sync, container: self.view, frameColor: .green)
        
    }

    @IBAction func mostrar(_ sender: Any) {
        
        recognizer.startCamera()
    }
    
    
}

extension ViewController: PayCardsRecognizerPlatformDelegate {
    func payCardsRecognizer(_ payCardsRecognizer: PayCardsRecognizer, didRecognize result: PayCardsRecognizerResult) {
        recognizer.stopCamera()
        print("Nombre: \(String(describing: result.recognizedHolderName))")
        print("Numero: \(String(describing: result.recognizedNumber))")
        print("Numero: \(String(describing: result.recognizedExpireDateMonth))")
        print("Numero: \(String(describing: result.recognizedExpireDateYear))")
    }
    
    
}
