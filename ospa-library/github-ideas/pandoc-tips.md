# Pandoc 

### Someone (I think Dan) found the "pandoc" tool online [http://pandoc.org](http://pandoc.org) and suggested it.


### I found was able to convert .docx files to .md with limited fuss in a short time.

### Here's a process that worked for me.
* I use a Mac so only the command-line is an option
* Dan and Eugenio have tried the MS Word plug-in "writage" [http://writage.com](http://writage.com/)
* Remember this is open source and you get what you pay for... - issues we've seen so far
  * Images get converted to .tiff and .png (not sure what criteria is used)
  * "Stray" characters sometimes appear (usually on lines by themselves)
  * I found case where the CASE of some words was altered, usually in headings and titles
  * We've heard reports that tables take lots of additional work after conversion


1. Download/install Pandoc
1. Obtain copy of .docx file
1. Execute pandoc command making sure to extract-media and specify github format

    __pandoc --extract-media  .  -s ShowItBuildIt_MoveImproveDatabase_Standardized_LAB_guide_2_13.docx -t gfm -o MoveImproveDatabase.md__

    Creates file name MoveImproveDatabase.md
    Creates media folder with combination of .tiff and .png images

1. Open .md file in editor to verify that it did most of what you wanted

1. Use a tool to convert the .tiff images to .png (on Mac I use Preview; a number of bulk converters are available for Windows); put .png files into /media folder

1. Open .md file in editor and REPLACE .tiff with .png - save

1. I broke the single file into multiple files:
   README.md  -  Intro and links to labs
   Lab1.md
   Lab2.md
   Lab3.md
   Lab4.md
   Lab5.md
   Lab6.md

1. Open github for developer repository (jjking2019/appdev in my case)

1. Create new folder for course, this requires creating a file in the folder (github does not allow empty folders, delete the file(s) and the folder disappears)
   * Create new file. newclass/README.md
      (note "newclass" folder being added)
   * Commit

1. In github click on new folder

1. "Drag and Drop" (or use Browse) to copy /images folder and all .md files into folder

1. Commit and Push

1. Test
