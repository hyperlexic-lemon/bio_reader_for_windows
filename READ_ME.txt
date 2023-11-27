####################################################################################################
PROJECT DESCRIPTION
####################################################################################################
This PowerShell script enhances text readability for individuals with dyslexia or other reading difficulties. It applies the "bio reading" technique to a text document by bolding the initial portion of each word (default 50%, adjustable). The output is a Rich Text Format (RTF) document, named with the first five words of the text followed by a timestamp for easy identification. Windows ships with a default application named WordPad that can display RTF files if you don't have a word processing application.


####################################################################################################
SETUP AND USAGE INSTRUCTIONS
####################################################################################################
1. Downloading the Script and Sample Input File
   - Go to the GitHub Repository: https://github.com/hyperlexic-lemon/bio_reader_for_windows
   - Click the green "Code" button.
   - Choose "Download ZIP" from the pop-up menu.
   - Your browser will download a compressed copy of the project.
   - Open the folder where the project downloaded to.
   - Right-click the zipped project and choose "Extract All..." from the pop-up menu.
   - Choose the location you want the project extracted to, or accept the default location.
   - Click the "Extract" button.
   - Open the extracted project folder.
   - There may be an identically named subfolder; open that as well.
   - Now you should see bio_reader_for_windows.ps1, input.txt, and README.md.

2. Running the Script from Windows Explorer (EASY)
   - Open input.txt and replace its contents with the text you want to adjust.
   - Save your changes to input.txt and close it.
   - Right-click bio_reader_for_windows.ps1. If available, choose "Run with PowerShell" from the pop-up menu. Note: This option may not be available on all systems.
   - You may be prompted if you want to open the file. Choose "Open".
   - An RTF file starting with the first five words of your input text and ending in a current timestamp will generate.
   - Open your RTF file with WordPad or another word processing program.

3. Running the Script in PowerShell (More Control)
   - Open PowerShell:
     - Windows 10 and later: Right-click Start, select “Windows PowerShell” or “Windows Terminal”.
     - Earlier Windows versions: Search and open PowerShell in the Start menu.
   - Navigate to the folder where you extracted the project using the 'cd' command. Replace 'path_to_folder' with the actual path to your folder. Example: cd path_to_folder
   - Run the Script:
     - Default 50% bolding: Type .\bio_reader_for_windows.ps1 and press Enter.
     - Custom bold percentage (10%-90%): Type .\bio_reader_for_windows.ps1 -boldPercentage X, replacing 'X' with your desired percentage. Example: .\bio_reader_for_windows.ps1 -boldPercentage 30.

4. Accessing the Output File
   - The RTF file will be in the same folder as the script, named with the first five words of your text plus the current date and time.
   - Open with WordPad: Right-click the RTF file, select “Open with”, and choose “WordPad”.

Example:
If 'input.txt' starts with “It was a dark and stormy night”, the output file will be named “It was a dark and 2023-11-26 21_03_00.rtf”.


####################################################################################################
NOTES FOR NON-TECHNICAL USERS
####################################################################################################
- PowerShell commands are case-insensitive.
- If scripts are disabled on your system, you can enable them. Run PowerShell as an administrator and type 'Set-ExecutionPolicy RemoteSigned'.
- Always download scripts and files from trusted sources to avoid security risks. Never run scripts from unknown or untrusted sources.
