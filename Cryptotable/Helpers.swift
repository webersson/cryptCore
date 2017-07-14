
import Cocoa


struct UnixDateHelper {
    static func converUnix(_ timestamp: Int) -> Double? {
        
        let date = NSDate(timeIntervalSince1970: TimeInterval(timestamp))
        
        let elapsed = Date().timeIntervalSince(date as Date)
        _ = DispatchTime.now()
  
        return elapsed
    }
    
}








