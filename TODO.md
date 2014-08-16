###To-Do List  
***  
#####Root  
- Check for connected devices
- verify device is ***KFSOWI***
- Read **ro.build.incremental** to `var kernelVer` and strip unnecessary text 
- reboot to **Fastboot** mode
- **Fastboot flash** 11.3.1.0 kernel ***boot.img***
- **Fastboot** continue boot
- **ADB push** su, rootme.sh, and exploit to /data/local/tmp
- Chmod above files to ***755***
- Execute rootme.sh via **ADB shell**
- reboot to **Fastboot** ***(may not be necessary)***
- **Fastboot flash** original device kernel ***boot.img***
- **Fastboot continue** Root complete, recommend next steps.  
***
