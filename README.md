Installation Guide/User Manuel
<br>Install MATLAB +2012 with all components.
<br>Install MSSQL +2012.
<br>Download the database file which extention is .bak (includes admin account).
<br>Connect to server with Windows Authentication with your Server name.
<br>Right click to the Databases folder which in the Object Explorer, then click Restore Database...
<br>Select Device for the Source and click ...
<br>Add downloaded .bak file which name is IrisAdmin to the MSSQL.
<br>Open the MATLAB and go to the APPS button which exist top left corner.
<br>Click the Get More Apps, then write Database Toolbox to the search area and download it.
<br>After download it, you can see Database Explorer in the Apps, so open it.
<br>Click Configure Data Source and click the Configure ODBC data source.
<br>Click add, then Select SQL Server Native Client 11.0 and click end button.
<br>Opening screen fill the blank like; Name:MSSQL Description:FIRec , Server: (your MSSQL Server name which login to the MSSQL with using Windows Authentication, then click next.
<br>Click With Integrated Windows authentication (SPN (Optional) is empty), then click next.
<br>Click next.
<br>Click end.
<br>After click end you can Test Data Source to checking succeed or not, if it is successul, you will see TESTS COMPLETED SUCCESSFULLY! text at opening screen.
<br> Close every screen except the Database Explorer and again Click Configure Data Source and then click Configure ODBC data source.
<br>At opening screen, select the MSSQL and click okey., so connection is done between MSSQL and MATLAB.
<br>Create a folder named "FaceAndIris"
<br>Copy all files to FaceAndIris folder.
<br>Start GuiMain.m
<br>
<br>Firstly, Admin should add users;
<br>-Click Admin Menu
<br>-Login
<br>
<br>In AfterLoginAdmin.m
<br>
<br>**Scan Database Button**
<br>In the begining of the program, If you want to add all users.
<br>Click Scan database button
<br>Choose file path.
<br>->File Path = Path of the folder that contains training files.
<br>Then, Choose Phase path.
<br>->Phase Path = Path of the folder that contains files that are avarage phases of given files.
<br>Basicly, it is the database that program use for recognition.
<br>->Filename will be empty.
<br>->Number is number of users.
<br>
<br>**Add User Button**
<br>If you want to add a user.
<br>->File Path = Path of the folder that contains a folder that contains training files.
<br>Then, Choose Phase path.
<br>->Phase Path = Path of the folder that contains files that are avarage phases of given files.
<br>->Basicly, it is the database that program use for recognition.
<br>->Filename is the name of the folder that contains images.
<br>->Number is number of images that will be read.
<br>
<br>**Update Button**
<br>If you want to update a user. 
<br>->File Path = Path of the folder that contains a folder that contains training files. 
<br>Then, Choose Phase path. 
<br>->Phase Path = Path of the folder that contains files that are avarage phases of given files. 
<br>->Basicly, it is the database that program use for recognition. 
<br>->Filename is the name of the folder that contains images. 
<br>->Number is number of images that will be read.
<br>**Set Configuration** 
<br>Enter treshold and click set conf. button to set treshold.
<br>
<br>**Recognition Part**
<br>
<br> In GuiMain.m
<br>
<br>**Face Recognition(PCA)**
<br>Click Face Recognition(PCA) button.
<br>Select Image.
<br>**Iris Recognition(Phase)**
<br>Click Iris Recognition(Phase) button.
<br>Select Image.
<br>**Iris Recognition(DFT)**
<br>Click Iris Recognition(DFT) button.
<br>Select Image.
<br>**Iris Recognition(PCA)**
<br>Click Iris Recognition(PCA) button.
<br>Select Image.
<br>**Iris Recognition(Neural)**
<br>Click Iris Recognition(Neural) button.
<br>Select Image.
