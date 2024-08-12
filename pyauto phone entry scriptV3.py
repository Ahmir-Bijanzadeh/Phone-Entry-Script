import pyautogui
import time
import re
import os
import keyboard
import sys
from rich import print

desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
file_path = os.path.join(desktop_path, "phone_numbers.txt")

print("\n[yellow]Program is ready, please press[/yellow][green] f2[/green][yellow] to begin.\nTo stop the program early press[/yellow][red] f4")
unique_phone_numbers = set()
running = False

def start_printing():
    global running
    if not running:
        if not os.path.exists(file_path):
            print(f"[red]File not found! {file_path}")
            time.sleep(1)
            print("[cyan]Creating a new file...")
            print("[cyan]New File Created, Please go populate it with phone numbers\n\n[/cyan][yellow]press[/yellow][green] f2[/green][yellow] to restart the program")
            with open(file_path, "w") as file:
                pass
        else:
            print("\n[green]Program started, will begin pasting in 5 seconds.\nPlease make sure the correct window is focused!")
            time.sleep(5)
            print("\n[yellow]currently pasting all provided phone numbers") 
            running = True


def emergency_stop():
    global running
    if running:
        print("\n[red]Program terminated.")
        running = False
        time.sleep(2)
        print("[yellow]\nTo restart the program please press[/yellow][green] f2[/green][yellow].")


keyboard.add_hotkey('f4', emergency_stop)
keyboard.add_hotkey('f2', start_printing)


def process_phone_numbers(file):
    for line in file:
        numbers = re.split(r'[,/]', line)
        
        for number in numbers:
            if not running:
                break
            phone_number = number.strip()
            phone_number = ''.join(filter(str.isdigit, phone_number))
            if len(phone_number) == 11 and phone_number.startswith('1'):
                phone_number = phone_number[1:]

            if phone_number and phone_number not in unique_phone_numbers:
                unique_phone_numbers.add(phone_number)

                pyautogui.typewrite(phone_number)
                time.sleep(2) 
                pyautogui.press("enter")
                time.sleep(1)
                
    if running:
        print("\n[magenta]All phone numbers copied!\nProgram will automatically close in 5 seconds")
        time.sleep(5)
        sys.exit()


while True:
    if running:
        try:
            with open(file_path, "r") as file:
                process_phone_numbers(file)
        except Exception as e:
            print(f"fatal error occurred: {str(e)}\nprogram will close in 2 seconds")
            time.sleep(2)
            sys.exit()
        running = False