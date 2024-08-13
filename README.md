# Phone Entry Script
The Phone Entry Script is a Python-based tool designed to automate the entry of phone numbers into a target application, such as Google Messages for Web. By reading phone numbers from a text file, the script uses the PyAutoGUI library to paste them into the desired window, one by one, with a specified time delay between each entry. This tool is particularly useful for sending mass text messages via the Google Messages web client.

## Features:
Automated Phone Number Entry: Reads phone numbers from a text file and pastes them into the target window with a delay between entries.\
Duplicate Detection: Duplicate numbers (including those with a leading '1' for the area code) will be ignored, so each unique number will be processed only once.\
Emergency Stop: Provides options for halting the script immediately in case of errors or user intervention.\
File Management: Automatically creates a text file if none exists and checks for valid file structure.\
Data Cleansing: Sanitizes each entry, removing all non-number characters including special characters.

## Installation:
download python\
download the various packages used for this app:\
-pyautogui\
-rich\
-keyboard\
-os\
-time\
-re

## Prerequisites:
Create a text file called "phone_numbers.txt" on your desktop. Or alternatively run the program once to have it create the file for you. It will be created on the users desktop by default with the name "phone_numbers.txt"\
Populate the file with phone numbers, separated by commas (,), slashes (/), or new lines.

## Prepare Google Messages:
Open google messages for web through the web portal or through the PWA.\
Set your message settings to "MASS text message" rather than "GROUP text message" *ON YOUR PHONE* (there is currently no way of changing this setting on the web client. Mass text message functions similarly to BCC in emails.\
Click on the "Start Chat" button, then under the input box for the contact info select "Start group conversation" in Google Messages.\
Google Messages for web is now prepped for mass number entry, proceed to running the app.\
*Note: Sending images over mass text is not currently supported.

## Running the Script:
Start the script. There will be instructions written on the console to follow.\
Press f2 to begin the pasting process, the application will read the phone numbers saved to the phone_numbers.txt file and paste them one by one into the desired text field, (in this case the contact field for google messages).\
If no phone_numbers.txt is found at the expected location a new phone_numbers.txt will be generated. \
There will be a 5-second delay before the script begins pasting numbers, allowing you to focus the cursor on the target window if not already focused there.\
Emergency Stop: Press 'F4' or move the mouse to the top corner of the screen to stop the program immediately.

## Future Updates
Image Support: Possible future updates may include support for sending images in mass texts, depending on upcoming changes in Google Messages and other platforms.\
RCS Compatibility: Further tweaks and enhancements may be necessary to account for IOS RCS support. Mostly only if google messages decides to change something though.\
Imessage support, imessage does not currently support mass messaging afaik, the only way to do so is to disable imessage AND group messaging, so its possible* but you need to disable the key features of imessage to do so. There is also very little info online about how the mac messages app interacts with your iphone, further research required!
