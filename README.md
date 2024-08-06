# Phone-Entry-Script
using python to read phone numbers from a text file, and use pyAuto to paste them into a desired window one by one with a time delay between each pasting. The intended use of this applciation is to use this application for mass text messages using google messages web client. However there are some quirks that need to be accounted for.

#Google Messages for Web
Due to a limitation of google messages, there is a "downtime" before you are allowed to input another phone number. For this reason we implement timers to add a delay between each listed item getting pasted\
if google messages sees you post the same number (that includes a number and then the same number with the leading 1 for the area code) it will remove that number from the list so the program checks for repeats that also have leading 1 for area code\
be sure to swap message setting to MASS text message rather than GROUP text message. this is done on the phone (this essentially functions like BCC on emails)\
set your new chat in google messages to a group chat before starting to paste numbers\
sending images over mass text is not supported (yet?) \
Apple will be adopting RCS in 2024, so there might be some tweaks and upgrades to google messages, personally hoping for image support\

### details
"/" and "," for phone numbers on the same line will be pasted as indivisual numbers\
numbers on seperate lines will be pasted\
duplicates of EXACTLY the same number will not be pasted\
area code parenthesis and all letters and special characters will be ignored\
area code leading 1 will be ignored as it will be counted as the same number \
target phone numbers MUST be in text file \
text file MUST be called phone_numbers.txt\
text file MUST be on the DESKTOP (unless you change the file path)\
if no text file exists, the program will create one for you, it then needs to be populated with phone numbers\
there will be an aproximately 5 second delay before the program starts pasting entries\
in case of needing to stop the program, press f4 OR move mouse to top corner of screen (emergency stop)\
there is a 5 second delay before the numbers start getting pasted, focus your cursor on the window you want to output the numbers right after starting the program\
there is a 2 second delay between pasting numbers\
