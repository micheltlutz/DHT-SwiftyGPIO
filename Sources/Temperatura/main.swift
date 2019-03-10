import Glibc
import SwiftyGPIO
import Foundation

print("DHT11 Raspberry Pi with Swift \n")

// MAIN

let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPi2)
let dht = DHT(pin: gpios[.P4]!, for: .dht11)

var temperature = 0.0
var humidity = 0.0

var startTime:timeval = timeval(tv_sec: 0, tv_usec: 0)
var endTime:timeval = timeval(tv_sec: 0, tv_usec: 0)

gettimeofday(&startTime,nil)
while (true) {
    do {
        (temperature,humidity) = try dht.read(true)
        gettimeofday(&startTime,nil)
        print("\n\n\n")
        print("DHT11 Raspberry Pi with Swift \n")
        print("Temperatura: \(temperature)  Humidate: \(humidity)")
        print("\n\n\n")
    } catch (DHTError.invalidNumberOfPulses) {
        let errorMessage = "INVALID PULSES"
//        print(errorMessage)
    } catch (DHTError.invalidChecksum) {
        let errorMessage = "INVALID CHECKSUM"
//        print(errorMessage)
    }
    
    gettimeofday(&endTime,nil)
    sleep(5)
}
