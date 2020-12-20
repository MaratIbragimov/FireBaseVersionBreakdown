# FireBaseVersionBreakdown

A CLI tool that outputs the precentage of users per OS version (iOS/Android) from a Firebase CSV file.


# Usage
* Download/clone the project.

* Open terminal and run the coomand ```$ ./build.sh``` it will build the tool and set its location in `/usr/local/bin/FirebaseOSBreakdown`

* Download the CSV file in **firebase console -> Analytics -> Dashboard**   
![GitHub Logo](/Firebase.png)

* ```$ FirebaseOSBreakdown <path to csv export> <os (iOS or android)> ```

    * example:
    ```bash 
      $ FirebaseOSBreakdown data-export.csv android
      Android 10 65.723%
      Android 9 17.699%
      Android 8 10.655%
      Android 7 3.398%
      Android 11 1.104%
      Android 6 1.050%
      Android 5 0.331%
      ```



