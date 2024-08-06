import pyautogui
import time
import re
#import os

# Get the path to the user's desktop
#desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")

# Combine the desktop path with the filename
#file_path = os.path.join(desktop_path, "phone_numbers.txt")
time.sleep(5) #small delay before the rest of the program executes, enough time to focus the target window
# Specify the path to the text file containing phone numbers on the desktop
file_path = "C:/Users/ahmir/OneDrive/Desktop/phone entry script/phone_numbers.txt"  # Replace with your desktop path

# Initialize an empty list to store unique phone numbers
unique_phone_numbers = set()

# Read phone numbers from the text file, format them, and skip duplicates
try:
    with open(file_path, "r") as file:
        for line in file:
            # Split the line by commas and / to handle multiple numbers
            numbers = re.split(r'[,/]', line)
            
            for number in numbers:
                #Remove leading/trailing whitespace and newline characters
                phone_number = number.strip() 
                #Remove any non-digit characters
                phone_number = ''.join(filter(str.isdigit, phone_number))

                # Remove leading '1' if the number is 11 digits long and starts with '1'
                if len(phone_number) == 11 and phone_number.startswith('1'):
                    phone_number = phone_number[1:]

                #checks to make sure new number added to the array is a unique number before adding it
                #***if leading digit of area code is a 1 number will be detected as new number!!!***
                if phone_number and phone_number not in unique_phone_numbers:
                    unique_phone_numbers.add(phone_number)

                    # Use PyAutoGUI to type the phone number
                    pyautogui.typewrite(phone_number)
                    time.sleep(2) #delay between inputs
                    pyautogui.press("enter")
                    time.sleep(1) #delay between inputs
       
except FileNotFoundError:
    print(f"File not found: {file_path}")
except Exception as e:
    print(f"An error occurred: {str(e)}")