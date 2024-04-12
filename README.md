CSS Data URL Remover

Many wonderful CSS libraries rely on image-src data: rules, which are considered bad practice for Content Security Policy (CSP). This script aims to convert SVG blobs to PNG files.

Prerequisites for your Linux system:
- bash
- Node.js
- ImageMagick
- sed
- awk

Instructions:
1. Copy the script (you can do this by copying and pasting locally).
2. Make the script executable by using the command `chmod +x <script.sh>`, where `<script.sh>` is the filename of the script.
3. Run the script using `./<script.sh>`, or any method you prefer.

What the script does:
The script first creates a one-time backup of your file, then creates a subfolder named 'svg'. It then searches your CSS file for any `url(data:` rules and substitutes the blob path with a relative path `./svg/<file.png>`.

WARNING! This script will permanently modify your .css file.

IF YOU FIND THE SCRIPT USEFUL, please consider giving this repo a star. Thanks!
