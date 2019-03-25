# Lab 6 : Import Using Data Pump

In this lab you will use SQL Developer’s ‘Data Pump Import Wizard’ to
import data using a .dmp file coming from Oracle Object Storage. Oracle
Data Pump may be used to import: entire database, schemas, tablespaces,
or tables.

You will need the input file’s ‘URL Path’ to modify, along with the name
of the Object Storage bucket as created in Lab 3 (see page 21) to import
the file.

First, be sure to connect to the ATP instance from SQL Developer (see
Lab 4 on page 26).

![](media/image57.png)

Scroll the connection navigator and open the list of ‘Other Users’ in
this exercise you will import a schema named ‘MYJJ’ make sure that the
schema does not currently exist by checking your display.

![](media/image73.png)

Next, open SQL Developer’s ‘DBA View’ to get things ready to use Data
Pump (unless already open).

![](media/image74.png)

Create a connection in the DBA View by selecting your already-open SQL
Developer connection.

![](media/image75.png) ![](media/image76.png)

![](media/image77.png)

Under ‘Data Pump’ find ‘Import Jobs’ – right-click on ‘Import Jobs’ and
select ‘Data Pump Import Wizard’ to start.

![](media/image78.png)

Step 1 of the ‘Data Pump Import Wizard’ provides a place to enter a job
name, choose type of import, and name the file(s) to be imported. You
will need the name of the credential created earlier and the Object
Storage file’s URL Path modified to fit SQL Developer’s needs.

![](media/image79.tiff)

Reopen your browser and navigate to the Object Storage Bucket details
display for the bucket where the desired data file may be found; open
the Object Details display for the desired file.

![](media/image80.png)

Select the URL Path for the file to be imported and copy it to your
clipboard.

![](media/image81.png)

Paste the URL Path into an editor and make edits necessary for it to
work in SQL Developer’s wizard.

![](media/image82.png)

1.  Change 'objectstorage' to 'swiftobjectstorage'

2.  Change '/n/' to '/v1/' (lower-case 'v')

3.  Remove '/b'

4.  Remove '/o'

Then, copy the modified URL Path to your clipboard.

Use the ‘Credentials or Directories’ pull-down under ‘Choose Input
Files’ to select the Credential object. Paste the modified URL path
into the ‘File Names or URI’ location. Choose ‘Add Row’ if you need to
add more files to the import and provide the appropriate Credentials and
URL Path for each one.

Click the ‘Next’ button to go to the next step in the wizard.

![](media/image83.png)

Step 2 of the Data Pump Import Wizard shows the schema(s) present in the
input .dmp file (‘JJ’ in this example); this may take a while to
populate.

![](media/image84.png)

Select a schema name and click the arrow key to ‘shuttle’ add the name
into Selected source schemas. Click the ‘Next’ button to move to Step 3
when ready.

![](media/image85.tiff)

Step 3 of the Import Wizard allow names to be changed (‘remapped’) for
Schemas and/or Tablespaces.

1.  Click ‘Add Row’ to begin

2.  Add the Source name in the left column (‘Source’)

3.  Add the desired new name into the right column (‘Destination’)

Click the ‘Next’ button to continue to Step 4.

![](media/image86.png)

Step 4 of the Import Wizard allow control over logging and other
potential issues. In our lab there is nothing to do so just click ‘Next’
to move on to Step 5.

![](media/image87.png)

If desired, change Job Name and enter a Job Description. Job Schedule
might also be modified here (not in our lab). Click ‘Next’ to advance to
the final stage in the wizard.

![](media/image88.png)

Step 6 provides a summary of the Import Job about to be scheduled. As in
the example below you may expand the display’s nodes to see more
details. Click ‘Finish’ to start the import.

![](media/image89.png)

You may also open the PL/SQL tab to see the actual PL/SQL to be
executed.  
(Code may be saved for later reuse)

![](media/image90.png)

The status of the running job(s) will appear in SQL Developer

![](media/image91.png)

The job(s) will show as ‘NOT RUNNING’ when complete.

![](media/image92.png)

Refresh ![](media/image93.tiff)the ‘Other User’s list in SQL Developer;
note that the ‘MYJJ’ user now appears.

![](media/image94.png)

Look to see that the schema objects have been imported properly.

![](media/image95.png)

Congratulations\! You have loaded a schema into your ATP instance using
a .dmp file from Object Storage.
