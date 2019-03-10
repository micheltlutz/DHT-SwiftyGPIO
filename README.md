# DHT-SwiftyGPIO

Using Swift to display temperature and humidity of a DHT11 module


## Requirements

Raspberry Pi 2+ or Raspberry Pi 3 Model B

Model DHT11 or DHT22

<p align="center" style="padding-bottom:50px;">
<img width="250" height="250" src="https://github.com/micheltlutz/DHT-SwiftyGPIO/raw/master/midia/DHT11.jpg"/>

<img width="250" height="250" src="https://github.com/micheltlutz/DHT-SwiftyGPIO/raw/master/midia/DHT22.jpg"/>
</p>

## Dependencies

To use the provided prebuilt binaries you'll need the install the following dependencies:

```sudo apt install clang libicu-dev libcurl4-nss-dev```


## Using 

<p align="center" style="padding-bottom:50px;">
<img src="https://github.com/uraimo/SwiftyGPIO/raw/master/logo.png"/>
</p>

[https://github.com/uraimo/SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO)

Download last version swift ARM compatible, see table:

[Build Swift On ARM prebuilt-binaries](https://github.com/uraimo/buildSwiftOnARM#prebuilt-binaries)

and Download

```wget https://github.com/uraimo/buildSwiftOnARM/releases/download/4.2.3/swift-4.2.3-RPi23-RaspbianStretch.tgz```

Unzip the files to a folder of your choice:

For example: /home/michel/swift-4.2.3/

After unzip, export path:

``` export PATH=/home/michel/swift-4.2.3/usr/bin:"${PATH}" ```

Test if everything went right run command:

``` swift --version ```

And the output should be like this:

```
Swift version 4.2.3 (swift-4.2.3-RELEASE)
Target: armv7-unknown-linux-gnueabihf
```

# Clone and run project

```$ git clone https://github.com/micheltlutz/DHT-SwiftyGPIO ```

```$ cd DHT-SwiftyGPIO```

```$ swift run ```

Waiting output should be like this:

```Temperatura: 25.0  Humidate: 41.0```


## Reference files

The DHT.swift was based on the project [dhtxx](https://github.com/pj4533/dhtxx) But with modifications

DHT class init allows you to select the sensor type and data conversion by default is used Celcius

### Enums Types

```swift 
public enum SupportedSensor {
    case dht11, dht22
}

public enum ConversionType {
    case Fahrenheit, Celsius
}

init(pin: GPIO, for sensor: SupportedSensor, conversion: ConversionType = .Celsius) { }

...


```

### Example create module DHT11 Object
```
let dht = DHT(pin: gpios[.P4]!, for: .dht11)

```

### Issues

Erros iniciais de leitura ocorrem devido a falha inicial do pulso

Usually get a good reading within the past 60s, many times more often than that

I hope this project helps start with the creation of IoT projects with Swift


[My Blog Post](https://micheltlutz.me/post/raspberry-pi-dhtswiftygpio)