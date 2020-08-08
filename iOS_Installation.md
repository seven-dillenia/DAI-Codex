# iOS Installation

There are a lot of steps to follow 😓

## Prerequisites

* A Mac OS X 10.9 or higher with at least 14gb free storage
  * An application called Xcode will need to be installed and its size is about 14GB. You can delete Xcode after the app installation
* iPhone with iOS 13 or higher
* AppleID (apple login)
    * If you have an Apple device, you most likely have an AppleID. But, just in case: [How to create an AppleID](https://support.apple.com/en-au/HT204316)

## Steps

**While on your Mac, follow the following steps:**

### 1. Download all of the required apps

**a)** Download and install Xcode from the Mac App Store

[Link to Xcode on the Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

**b)** Download iOS App Signer

[Link to iOS App Signer Download Page](https://dantheman827.github.io/ios-app-signer)

**c)** Download the DAI Codex app file (`.ipa`)

| iOS Version        | Download File                                                                                                    |
| ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| iOS 13.0 or higher | [dai\_codex\_ios13\_v1.ipa](https://github.com/leechuyem/DAI-Codex/releases/download/v1.0/dai_codex_ios13_v1.ipa) |

### 2. Create a signing certificate and provisioning profile

We will create a **signing certificate** and **provisioning profile** by creating a **dummy project** in Xcode.

**a)** Open up `Xcode` > `Create A New Project` > `Single View App`

> If Xcode is opened for the first time, you will have to agree to its Terms and Condition pop up
  
<img src="https://imgur.com/izzlCG1.jpg" alt="new project"/>
<br>
<img src="https://imgur.com/HjGAwvF.jpg" alt="new project"/>

**b)** Fill out the project details and then click `Next`.

| Field                   | Values                                   | Example                        |
| ----------------------- | ---------------------------------------- | ------------------------------ |
| Product Name            | anything you want                        | swordandshields                |
| Organisation Name       | anything you want                        | circlemage                     |
| Organisation Identifier | com.\<organisation name> | com.circlemage |
<br>
<img src="https://imgur.com/8FUdJPK.jpg" alt="new project"/>

**c)** Xcode will ask you where to save the project. Once saved, Xcode will open up the project.

> Save the project anywhere you like. For this guide, I saved it in the Documents folder

**d)** Click on `Project Name` > `Signing & Capabilities`

> There will be an **error**. Don't worry, we'll get that fixed. 

<img src="https://imgur.com/HbXv89B.jpg" alt="new project"/>

**e)** Click on `Team` > `Add Account`

> Make sure that `Automatically manage signing` is ticked
> 
<img src="https://imgur.com/HeEJyBT.jpg" alt="new project"/>
<br>
<img src="https://imgur.com/p3OMXO5.jpg" alt="new project"/>

**f)** Sign in with your AppleID

<img src="https://imgur.com/AQBmRDI.jpg" alt="new project"/>
<br>
<img src="https://imgur.com/gpFntyv.jpg" alt="new project"/>

**g)** Once signed in, go back to Xcode.

**h)** Click on `Team`, again. This time you'll see the account you had just added. Select that account.

> Xcode is still showing errors after adding the account. That's okay, we'll sort that out soon :)

<img src="https://imgur.com/vHwR9jT.jpg" alt="new project"/>
<br>
<img src="https://imgur.com/asqZJq3.jpg" alt="new project"/>

**i)** Connect your iPhone to your Mac. Keep it connected until the DAI Codex app is installed.

**j)** Back to Xcode, select `Device` button (located at the very top). 

<img src="https://imgur.com/wNIBEXt.jpg" alt="new project"/>

**k)** You should see your iPhone listed as one of the options to select. Select your device.

> Xcode will re-configure and the error should be now all gone!

<img src="https://imgur.com/8U7oogj.jpg" alt="new project"/>
<br>
<img src="https://imgur.com/WbGzEHz.jpg" alt="new project"/>

You now have a signing certificate and provisioning profile! Hang in there, almost done.

### 3. Add signing certificate and provisioning profile to the DAI Codex App

**a)** Open up iOS App Signer
> * If opened for the first time, your mac will ask you for permission to open it
> * Signing Certificate should automatically be filled out, if not click the drop down to see if your AppleID is there

**b)** Click on `Browse` and select the dai_codex `.ipa` file that you downloaded earlier. Then click Open.

<img src="https://imgur.com/fpX3j2J.jpg" alt="new project"/>
<br>
<img src="https://imgur.com/aEsnDHN.jpg" alt="new project"/>

**c)** Click on the `Provisioning Profile` drop down and select the provisioning profile that you had created in Xcode.

<img src="https://imgur.com/5r6SDAt.jpg" alt="new project"/>

**d)** Click on `start`. The iOS App Signer will create a copy of the dai_codex `.ipa` file. It will ask you where you want to save this new `ipa` file.
> * Save it where ever you'd like. For this guide, I had saved it in my Documents folder.
> * Your mac may ask you to give the iOS App Signer permission to access the folder by entering your mac machine's login password.

<img src="https://imgur.com/C9tIJdU.jpg" alt="new project"/>
<br>
<img src="https://imgur.com/y2wPfdD.jpg" alt="new project"/>

### 4. Installing the DAI Codex to your phone

By this point, you should have new copy of the DAI Codex .ipa *(e.g. `dai_codex_os13_v1.ipa`)* file that was created by the iOS App Signer and it is saved somewhere in your machine.

**a)** Let's go back to Xcode. Click on `Window` > `Devices and Simulators`

> You should see your iPhone there

<img src="https://imgur.com/477lCc2.jpg" alt="new project"/>

**b)** Click on the `+` button and select the new DAI Codex `.ipa` file that was created by the iOS App Signer

> **DO NOT select `.ipa` file that you downloaded from this page**

<img src="https://imgur.com/MZGOQ3h.jpg" alt="new project"/>
<br>
<img src="https://imgur.com/PftD3dn.jpg" alt="new project"/>

**c)** Xcode will install the app on to your phone! Then you can disconnect your phone from the mac device.

<img src="https://imgur.com/uuSNwMR.jpg" alt="new project"/>

## Errors when opening the app

<img src="https://imgur.com/XnyTDmG.jpg" alt="new project" height="500"/>

If you get this message when opening the app on phone, then follow the fix below:

a) Go to `Settings` > `General` > `Device Management`

<img src="https://imgur.com/dmjiFNo.jpg" alt="new project" height="500"/>
<br>
<img src="https://imgur.com/O37vYUv.jpg" alt="new project" height="500"/>

b) Select the app listed

<img src="https://imgur.com/NoXSlqk.jpg" alt="new project" height="500"/>

c) Tap on `Trust "Apple Developer: <your AppleID email>"`

<img src="https://imgur.com/PO2fBbb.jpg" alt="new project" height="500"/>

d) Tap on `Trust`

<img src="https://imgur.com/x7oL9Zh.jpg" alt="new project" height="500"/>

**Dareth shiral!**
