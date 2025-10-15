import pyautogui
import time
import re
import os
import sys
from rich import print

# Define the path to the file on the user's desktop
desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
file_path = os.path.join(desktop_path, "phone_numbers.txt")

# --- Image File Definition ---
def find_images():
    """Find all image files in the project directory and return as list."""
    images = []
    project_dir = os.path.dirname(os.path.abspath(__file__))
    
    # First, look for images in the project directory
    for ext in ['.png', '.jpg', '.jpeg']:
        for file in os.listdir(project_dir):
            if file.lower().endswith(ext):
                images.append(os.path.join(project_dir, file))
    
    # If no images found in project directory, fall back to desktop
    if not images:
        IMAGE_FILE_NAME = "picture_to_send.png"
        images.append(os.path.join(desktop_path, IMAGE_FILE_NAME))
    
    return images

IMAGE_PATHS = find_images()
# -----------------------------

# Store unique numbers processed in this session to avoid duplicates
unique_phone_numbers = set() 
running = False
message_text = None # Global variable to store the user's message input

# --- Get Message Text from User ---
def get_user_message():
    """Gets message text from user."""
    global message_text
    print("Enter message (press Enter to continue):")
    message_text = input()
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
        
    # Check if we have any valid image paths
    valid_images = [img for img in IMAGE_PATHS if os.path.exists(img)]
    if not valid_images:
        print("\n[red]CRITICAL ERROR: No valid images found![/red]")
        print("[red]Please add images to the project folder or place 'picture_to_send.png' on your desktop.[/red]")
        return

    print(f"[yellow]Found {len(all_sanitized_numbers)} unique numbers and {len(valid_images)} images. Starting sequence.[/yellow]")
    
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
        if message_text:
            pyautogui.typewrite(message_text)
            time.sleep(1.5)
        
        # 5. Send each image for this number
        for image_path in valid_images:
            # Open attachment dialog
            print(f"[yellow]Attaching image: {os.path.basename(image_path)}[/yellow]")
            pyautogui.hotkey('ctrl', 'shift', 'a')
            time.sleep(2.0)
            
            # Type image path and send
            pyautogui.typewrite(image_path)
            time.sleep(1.0)
            pyautogui.press("enter")
            time.sleep(3.0) # Wait for image to upload/attach
        
        # 6. Send the message with all attached images
        pyautogui.press("enter")
        time.sleep(2.0) # Delay before starting the next number sequence
                
    if running:
        print("\n[magenta]All messaging sequences completed!\nPress [green]f2[/green] to run again.\nPress [red]f4[/red] to stop early.[/magenta]")


def main():
    global running
    while True:
        print("\nPhone Entry Script")
        print("1. Start sending messages")
        print("2. Exit")
        choice = input("Choose an option (1-2): ")
        
        if choice == "1":
            running = True
            try:
                if not os.path.exists(file_path):
                    print(f"File not found: {file_path}")
                    print("Creating a new file...")
                    with open(file_path, "w") as file:
                        pass
                    print("New file created. Please populate it with phone numbers.")
                    continue
                
                get_user_message()
                
                print("Focus the target application window")
                for i in range(5, 0, -1):
                    print(f"Starting in {i}...")
                    time.sleep(1)
                
                with open(file_path, "r") as file:
                    process_phone_numbers(file)
                
            except Exception as e:
                print(f"Error occurred: {str(e)}")
                time.sleep(2)
            finally:
                running = False
        
        elif choice == "2":
            print("Exiting...")
            sys.exit(0)
        
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
