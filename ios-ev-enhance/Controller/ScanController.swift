//
//  ScanController.swift
//  ios-ev-enhance
//
//  Created by carson tham on 7/4/24.
//

import AVFoundation
import UIKit

class ScanController: UIViewController {

    @IBOutlet weak var image: UIView!
    let session = AVCaptureSession()
    var evObject: EVResponse!
    override func viewDidLoad() {
        setupCamera()
        callAPI()
    }
    
    
    @IBAction func scanningButton(_ sender: Any) {
        print("sending request...")
//        callAPI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(self.evObject)
        if let vc = (segue.destination as? ConfirmViewController) {
            vc.obj = self.evObject
            print(self.evObject!)
        }
    }
    
    
    func callAPI(){
        guard let url = URL(string: "http://localhost:3000/company/ev-information") else{
            print("exiting")
            return
        }
        
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        
        let body: [String: AnyHashable] = [
            "charger_id": "B2728T"
        ]
       
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let decoder = JSONDecoder()
                self.evObject = try decoder.decode(EVResponse.self, from: data)
                print("cars", self.evObject)
//                if let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments){
//                    self.evObject = try decoder.decode(EVResponse.self, from: JSONSerialization.data(withJSONObject: response))
//                    print(self.evObject)
//                }
                print("object is ", self.evObject!)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    private enum Constants {
      static let alertTitle = "Scanning is not supported"
      static let alertMessage = "Your device does not support scanning a code from an item. Please use a device with a camera."
      static let alertButtonTitle = "OK"
    }

        
    func setupCamera() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            
            let output = AVCaptureMetadataOutput()

            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            session.addInput(input)
            session.addOutput(output)
            
            output.metadataObjectTypes = [.qr]
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.frame = view.bounds
            
            view.layer.addSublayer(previewLayer)
            
            session.startRunning()
        } catch {

            showAlert()
            print(error)
        }
    }

    // MARK: - Alert

    func showAlert() {
            let alert = UIAlertController(title: Constants.alertTitle,
                                          message: Constants.alertMessage,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.alertButtonTitle,
                                          style: .default))
            present(alert, animated: true)
    }
}



extension ScanController: AVCaptureMetadataOutputObjectsDelegate {

    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {

        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
                  metadataObject.type == .qr,
                  let stringValue = metadataObject.stringValue else { return }
        
        print(stringValue)
    }
}
