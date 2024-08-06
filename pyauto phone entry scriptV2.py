import pyautogui
import time
import re
#import os

# Get the path to the user's desktop
#desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")

# Combine the desktop path with the filename
#file_path = os.path.join(desktop_path, "phone_numbers.txt")

# small delay before the rest of the program executes, enough time to focus the target window
time.sleep(5) 

# Specify the path to the text file containing phone numbers on the desktop
file_path = "C:/Users/ahmir/OneDrive/Desktop/phone entry script/phone_numbers.txt"  # Replace with your desired path

# Initialize an empty set to store unique phone numbers
unique_phone_numbers = set()

# process phone numbers
def process_phone_numbers(file):
    for line in file:
        # Split the line by commas and / to handle multiple numbers
        numbers = re.split(r'[,/]', line)
        
        for number in numbers:
            # Remove leading/trailing whitespace and newline characters
            phone_number = number.strip()
            # Remove any non-digit characters
            phone_number = ''.join(filter(str.isdigit, phone_number))

            # Remove leading '1' if the number is 11 digits long and starts with '1'
            if len(phone_number) == 11 and phone_number.startswith('1'):
                phone_number = phone_number[1:]

            # Check to make sure the new number added to the array is unique before adding it
            if phone_number and phone_number not in unique_phone_numbers:
                unique_phone_numbers.add(phone_number)

                # Use PyAutoGUI to type the phone number
                pyautogui.typewrite(phone_number)
                time.sleep(2) # delay between inputs
                pyautogui.press("enter")
                time.sleep(1) # delay between inputs

# Read phone numbers from the text file, format them, and skip duplicates
try:
    with open(file_path, "r") as file:
        process_phone_numbers(file)

except FileNotFoundError:
    print(f"File not found: {file_path}")
    print("Creating a new file...")
    print("New File Created, Please go populate it with phone numbers")
    # Create an empty file at the specified path
    with open(file_path, "w") as file:
        pass  # This will create an empty file

except Exception as e:
    print(f"An error occurred: {str(e)}")


#todo list: 
# color the text for fun
# update the readme
# remove comments for personal copy
# uploaded version uses desktop path instead of a direct filepath
# make a distributable version again