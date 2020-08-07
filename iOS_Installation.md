# iOS Installation

There are a lot of steps to follow :(

## Prerequisites

* A Mac OS X 10.9 or higher with at least 14gb free storage
    * An application called Xcode will need to be installed and its size is about 14GB, you can delete the application after the app installation
* AppleID (apple login
    * If you have an Apple device, you most likely have an AppleID, but just in case: [Here is how to create an AppleID](https://support.apple.com/en-au/HT204316)

## Steps

**While on your Mac, follow the following steps:**

### 1\. Download all of the required apps
<br>
a) Download and install Xcode from the Mac App Store
    [Link to Xcode on the Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
b) Download iOS App Signer
    [Link to iOS App Signer Download Page](https://dantheman827.github.io/ios-app-signer)
c) Download the DAI Codex app file (.ipa)

| iOS Version | Download File |
| ----------- | ------------- |
| x13.0 or higher | [dai\_codex\_os13\_v1.ipa](https://github.com/leechuyem/DAI-Codex/releases/download/v1.0/dai_codex_ios13_v1.ipa) |

### 2\. Create a signing certificate and provisioning profile
<br>
a) Open up Xcode > Create A New Project > Single View App
    -    If opened for the first time, you will be asked to agree to terms and conditions
b) Fill out the app details and then click Next

* Product Name: anything you want
    * e.g. swordandshields
* Organisation Name: anything you want
    * e.g. circlemage
* Organisation Identifier: com.\<organisation name>.\<product name>
    * e.g. com.circlemage.swordandshields

c) Xcode will ask you where to save the project. Once saved, Xcode will open up the project

* Save the project anywhere you like. For this tutorial, I saved it in the Documents folder

d) Click on Project Name > Signing & Capabilities
   There will be error. Don't worry, this will be fixed in the later steps.
e) Click on Team > Add Account
f) A sign in pop up will appear. Sign in with your AppleID
g) Once signed in, go back to Xcode.
h) Click on Team, again. This time you see the account that you had just added. Select that account.
    Xcode is still showing errors after adding the account. That's okay, we'll sort that out soon :)
i) Connect your iPhone your Mac
j) Back to Xcode, select Device button at the top. You should see your iPhone listed as one of the options to select. Select your device.
    Xcode will re-configure and the error should be now all gone!

Woo hoo, you now have a signing cerficate and provisioning profile! Hang in there, almost done.

### 3\. Add signing certificate and provisioning profile to the DAI Codex App

a) Open up iOS App Signer
    - If opened for the first time, your mac will ask you for permission to open it
    - Signing Certificate automatically filled down, if not click the drop down to see if your AppleID is there
b) Click on browse and select the dai\_codex .ipa file that you downloaded earlier. Then click Open.
c) Click on the Provisioning Profile drop down and select the provisining profile that you had created in Xcode.
d) Click on Start. The iOS App Signer will asks you where you want to save the new output .ipa file
    - Save it where ever you'd like. For this exampe, I had saved it in my Documents folder.
    - Your mac may ask you to give the iOS App Signer permission to access the folder by entering your mac machine's login password.

### 4\. Installing the DAI Codex to your phone

By this point, you should have new copy of the DAI Codex .ipa (e.g. dai\_codex\_os13\_v1.ipa) file that was created by the iOS App Signer and it is saved somwhere in your machine.

a) Let's go back to Xcode. Click on Window > Devices and Simulators
    You should see your iPhone there
b) Click on the + button and select the new DAI Codex .ipa file that was created by the iOS App Signer
    - DO NOT select .ipa file that you downloaded from this page
c) Xcode will install the app on to your phone!

**Dareth shiral! May the dreadwolf guides you, friend!**

<br>
<br>
