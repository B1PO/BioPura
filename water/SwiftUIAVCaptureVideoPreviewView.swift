import UIKit
import AVFoundation
import Vision

class UIAVCaptureVideoPreviewView: UIView, AVCaptureVideoDataOutputSampleBufferDelegate {
    var recognitionInterval = 0
    var mlModel: VNCoreMLModel?
    var captureSession: AVCaptureSession!
    var resultLabel: UILabel!
    var monitorDetectedRecently = false // Para controlar la detección reciente de un monitor
    var onMonitorDetected: ((Bool) -> Void)? // Actualizado para manejar la presencia/ausencia de un monitor
    var audioPlayer: AVAudioPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setModel()
        setupSession()
        setupPreview()
    }
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "barcode", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("No se pudo cargar el archivo de sonido")
        }
    }
    
    func setModel() {
        mlModel = try? VNCoreMLModel(for: MobileNetV2Int8LUT().model)
    }

    func setupSession() {
        captureSession = AVCaptureSession()
        captureSession.beginConfiguration()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else { return }
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return
        }

        let output = AVCaptureVideoDataOutput()
        output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoQueue"))
        if captureSession.canAddOutput(output) {
            captureSession.addOutput(output)
        } else {
            return
        }

        captureSession.commitConfiguration()
    }

    func setupPreview() {
        self.frame = UIScreen.main.bounds

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.bounds
        previewLayer.videoGravity = .resizeAspectFill
        self.layer.addSublayer(previewLayer)

        resultLabel = UILabel()
        resultLabel.text = ""
        resultLabel.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 200, width: UIScreen.main.bounds.width, height: 80)
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.boldSystemFont(ofSize: 20)
        resultLabel.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        resultLabel.alpha = 0 // Hacer el resultLabel completamente transparente
        self.addSubview(resultLabel)

        captureSession.startRunning()
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if recognitionInterval < 20 {
            recognitionInterval += 1
            return
        }
        recognitionInterval = 0

        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer),
              let model = mlModel else { return }

        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else { return }

            var displayText = ""
            var detectedMonitor = false

            for result in results.prefix(5) {
                let confidence = Int(result.confidence * 100)
                displayText += "\(confidence)% " + result.identifier + "\n"
                if result.identifier.lowercased().contains("hair spray") && confidence > 20 {
                    detectedMonitor = true
                    break
                }
                if result.identifier.lowercased().contains("packet") && confidence > 20 {
                    detectedMonitor = true
                    break
                }

            }

            DispatchQueue.main.async {
                self.resultLabel.text = displayText
                if detectedMonitor {
                    if !self.monitorDetectedRecently {
                        self.playSound()
                        self.onMonitorDetected?(true)
                        self.monitorDetectedRecently = true
                    }
                } else {
                    if self.monitorDetectedRecently {
                        self.onMonitorDetected?(false)
                        self.monitorDetectedRecently = false
                    }
                }
            }
        }

        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
}

