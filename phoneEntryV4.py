import pyautogui
import time
import re
import os
import keyboard
import sys
from rich import print

# Define the path to the file on the user's desktop
desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
file_path = os.path.join(desktop_path, "phone_numbers.txt")

# --- Image File Definition ---
IMAGE_FILE_NAME = "picture_to_send.png"
IMAGE_PATH = os.path.join(desktop_path, IMAGE_FILE_NAME) 
# Note: For this to work, you must place an image named "picture_to_send.png" on your desktop.
# -----------------------------

print("\n[yellow]Program is ready, please press[/yellow][green] f2[/green][yellow] to begin.\nTo stop the program early press[/yellow][red] f4")

# Store unique numbers processed in this session to avoid duplicates
unique_phone_numbers = set() 
running = False
message_text = None # Global variable to store the user's message input

# --- NEW FUNCTION: Get Message Text from User ---
def get_user_message():
    """Prompts the user to input the message text."""
    global message_text
    print("\n[cyan]----------------------------------------[/cyan]")
    print("[cyan]STEP 1: MESSAGE CONTENT[/cyan]")
    print("[yellow]Please enter the message you want to send:[/yellow]")
    
    # Capture the message text
    message_text = input(">> ")
    
    if not message_text:
         print("[red]Message cannot be empty. Program terminated.[/red]")
         sys.exit()
# -----------------------------------------------

def start_printing():
    """Initializes the program run, prompts for message text, and starts countdown."""
    global running
    if not running:
        if not os.path.exists(file_path):
            # File creation logic remains the same
            print(f"[red]File not found! {file_path}")
            time.sleep(1)
            print("[cyan]Creating a new file...")
            print("[cyan]New File Created, Please go populate it with phone numbers\n\n[/cyan][yellow]press[/yellow][green] f2[/green][yellow] to restart the program")
            with open(file_path, "w") as file:
                pass
        else:
            # Step 1: Get the message text from the user
            get_user_message() 

            # Step 2: Start countdown
            countdown_time = 5
            print(f"\n[green]Program is ready. Please focus the target application (e.g., messaging window) now![/green]")
            
            for i in range(countdown_time, 0, -1):
                print(f"[green]Automation begins in... {i} seconds[/green]")
                time.sleep(1)
            
            print("\n[yellow]Starting automated messaging sequence...[/yellow]") 
            running = True


def emergency_stop():
    """Stops the running automation loop."""
    global running
    if running:
        print("\n[red]Program terminated.[/red]")
        running = False
        time.sleep(2)
        print("[yellow]\nTo restart the program please press[/yellow][green] f2[/green][yellow].")

def kill():
    """Cleanly exits the entire application."""
    sys.exit()

# Set up hotkeys for control
keyboard.add_hotkey('f4', emergency_stop)
keyboard.add_hotkey('f2', start_printing)
keyboard.add_hotkey('f5', kill)
# f6 hotkey is removed as image paste is now part of the main loop

def process_phone_numbers(file):
    """
    Reads, sanitizes, and executes the full automation loop for each unique number.
    """
    global message_text

    # 1. Read and sanitize all numbers into a list first
    all_sanitized_numbers = []
    
    for line in file:
        numbers = re.split(r'[,/]', line)
        for number_segment in numbers:
            phone_number = number_segment.strip()
            # Remove ALL non-digit characters (spaces, dashes, etc.)
            phone_number = re.sub(r'\D', '', phone_number) 
            
            # Strip leading '1' if it's an 11-digit number
            if len(phone_number) == 11 and phone_number.startswith('1'):
                phone_number = phone_number[1:]

            if phone_number and phone_number not in unique_phone_numbers:
                unique_phone_numbers.add(phone_number)
                all_sanitized_numbers.append(phone_number)

    if not all_sanitized_numbers:
        print("[yellow]No new or unique phone numbers found to process.[/yellow]")
        return
        
    if not os.path.exists(IMAGE_PATH):
        print(f"\n[red]CRITICAL ERROR: Image file not found at: {IMAGE_PATH}[/red]")
        print("[red]Please place 'picture_to_send.png' on your desktop and restart.[/red]")
        return

    print(f"[yellow]Found {len(all_sanitized_numbers)} unique numbers. Starting sequence.[/yellow]")
    
    # 2. Start the automation loop
    for phone_number in all_sanitized_numbers:
        if not running:
            break
            
        print(f"[cyan]Processing number: {phone_number}[/cyan]")
        
        # 1. ctr + k (New message/search hotkey)
        pyautogui.hotkey('ctrl', 'k')
        time.sleep(1.0) 
        
        # 2. Paste next number from list
        pyautogui.typewrite(phone_number)
        time.sleep(1.5) 
        
        # 3. enter (Select recipient/open chat)
        pyautogui.press("enter")
        time.sleep(2.0) # Wait for the message field to load/focus
        
        # 4. Paste text from user input
        pyautogui.typewrite(message_text)
        time.sleep(1.5) 
        
        # 5. Open attachment dialog
        print("[yellow]Simulating 'Attach File' dialog opening...[/yellow]")
        # NOTE: You may need to change 'ctrl', 'shift', 'a' to the correct hotkey for your app.
        pyautogui.hotkey('ctrl', 'shift', 'a') 
        time.sleep(2.0) # Wait for file dialog to appear
        
        # 6. Paste predetermined image file (by typing file path)
        pyautogui.typewrite(IMAGE_PATH)
        time.sleep(1.0)
        pyautogui.press("enter")
        time.sleep(3.0) # Wait for image to upload/attach
        
        # 7. enter (to send the message/image)
        pyautogui.press("enter")
        time.sleep(2.0) # Delay before starting the next number sequence
                
    if running:
        print("\n[magenta]All messaging sequences completed!\nPress [green]f2[/green] to run again.\nPress [red]f4[/red] to stop early.[/magenta]")


while True:
    if running:
        try:
            with open(file_path, "r") as file:
                process_phone_numbers(file)
        except Exception as e:
            # Catch file reading errors or other exceptions
            print(f"fatal error occurred: {str(e)}\nprogram will close in 2 seconds")
            time.sleep(2)
            sys.exit()
        running = False # Stop the pasting loop after file is processed

    # Small pause to prevent excessive CPU usage while waiting for hotkey
    time.sleep(0.1)
