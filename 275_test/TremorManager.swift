//
//  TremorManager.swift
//  275_test

import Foundation
import CoreMotion
import Firebase
import FirebaseDatabase

class TremorManager {
    private static let inst = TremorManager()
    fileprivate let motionManager : CMMotionManager
    fileprivate var rotationRate : ([Double], [Double], [Double]) = ([],[],[])
    fileprivate var userAcceleration: ([Double], [Double], [Double]) = ([],[],[])
    fileprivate var curRotation: (Double, Double, Double) = (0,0,0)
    fileprivate var currAcceleration: (Double, Double, Double) = (0,0,0)
    fileprivate var dataTimer: Timer?
    fileprivate let fft = FastFourierTransform()
    fileprivate var fps:Double = 100
    
    class func shared()->TremorManager{
        return inst
    }
    
    private init()
    {
        motionManager = CMMotionManager()
        initialize()
        
        #if DEBUG
            // generate test data during simulation
            let n:Int = Int(pow(Double(2),Double(16)))
            let sineWave1:[Double] = (0..<n).map {
                11 * sin(2.0 * .pi / fps * Double($0) * 4)
            }
            

            let sineWave2:[Double] = (0..<n).map {
                10 * sin(2.0 * .pi / fps * Double($0) * 7)
            }
            
            userAcceleration = (sineWave1,sineWave1,sineWave1)
            rotationRate = (sineWave2,sineWave2,sineWave2)
        #endif
    }
    
    func start() {
        dataTimer = Timer.scheduledTimer(timeInterval: 1.0/fps, target: self, selector: #selector(TremorManager.get_data), userInfo: nil, repeats: true)
    }
    
    //writes gyroscope data to firebase
    func save(score : Double) {
        let strDate = getStrDate()
        let ref : DatabaseReference! = Database.database().reference()
        let uid = Firebase.Auth.auth().currentUser!.uid
        var dateAndTremorScore : [String: String]!
        ref.child("Users").child(Firebase.Auth.auth().currentUser!.uid).child("TremorScores").observeSingleEvent(of: .value, with: { (snapshot) in
            if (snapshot.exists()) {
                dateAndTremorScore = (snapshot.value as! [String: String])
                dateAndTremorScore[strDate] = "\(score)"
            } else {
                dateAndTremorScore = [strDate:"\(score)"]
            }
            
            ref.updateChildValues(["/Users/\(uid)/TremorScores" : dateAndTremorScore])
        })
        
        print(Date(), score)
    }
    
    // returns acceleration and gyroscope power spectrum events by processsing all the gyro and accel events1.
    func processAll()->[(([Double],[Double]),Double,Double)]{
        let x:[[Double]] = [rotationRate.0, rotationRate.1, rotationRate.2]
        let y:[[Double]] = [userAcceleration.0, userAcceleration.1, userAcceleration.2]
        return [fft.process(y, _fps: fps), fft.process(x, _fps: fps)]
    }
    
    //check to see if device motion available and set default parameters
    fileprivate func initialize()
    {
        if motionManager.isDeviceMotionAvailable
        {
            self.motionManager.deviceMotionUpdateInterval = 1.0 / 100.0
            self.motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
        }
        
        else
        {
            print("deviceMotion not available")
        }
        
    }
    
    // aquire events from CoreMotionManager
    @objc fileprivate func get_data()
    {
        if let data = self.motionManager.deviceMotion {
            currAcceleration = (data.userAcceleration.x, data.userAcceleration.y, data.userAcceleration.z)
            curRotation = (data.rotationRate.x, data.rotationRate.y, data.rotationRate.z)
            #if DEBUG
            #else
                user_accel.0.append(accel_curr.0);user_accel.1.append(accel_curr.1);user_accel.2.append(accel_curr.2);
                rot_rate.0.append(rot_curr.0);rot_rate.1.append(rot_curr.1);rot_rate.2.append(rot_curr.2);
            #endif
            //print("getTimer: %lf,%lf,%lf\n", data.userAcceleration.x, data.userAcceleration.y, data.userAcceleration.z)
        }
    }
    
    
    
    
}


