# FireBaseVersionBreakdown

A CLI tool that outputs the precentage of users per OS version (iOS/Android) from a Firebase CSV file.


# Usage
```
firebase-os-breakdown -h
OVERVIEW: Swift command line tool that outputs mobile OS versions break down from exported Firebase CSV file

USAGE: firebase-os-breakdown <input-file> <os>

ARGUMENTS:
  <input-file>
  <os>

OPTIONS:
  -h, --help              Show help information.
  
````

## Manual installation
* Download/clone the project.

* Open terminal and run the command ```$ ./build.sh```, it will build the tool and set its location in `/usr/local/bin/FirebaseOSBreakdown`

## Install using [Mint](https://github.com/yonaskolb/mint)
```$ mint install MaratIbragimov/FireBaseVersionBreakdown ```

## Examples
* Download the CSV file from **firebase console -> Analytics -> Dashboard**   

* ```$ firebase-os-breakdown <input-file> <os> ```

    example:
    ```bash 
      $ firebase-os-breakdown data-export.csv android
      Android 10 65.723%
      Android 9 17.699%
      Android 8 10.655%
      Android 7 3.398%
      Android 11 1.104%
      Android 6 1.050%
      Android 5 0.331%
    ```



