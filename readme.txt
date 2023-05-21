This is the steps to run the project:

1) Download and install the latest Netbeans IDE
2) Download and install JDK 8
3) Download and install Apache Tomcat 8 (if itis included with Netbeans, then no need to install)
4) Download and install "MySQL Installer" (400~500MB size)
5) Open MySQL Workbench and create a chema called "realestate"
6) download the repo: https://github.com/mhmoodm22/AssetPlus and open the project in NetBeans
7) create a folder "jar_files" in "Downloads" directory
8) Run the following script in MySQL Workbench: \propertyManagement\web\WEB-INF\db_backup_realestate_DateTime.sql
9) Clean and Build Project in NetBeans.
10) Run the project.
11) Your project will be run in the browser. http://localhost:8088/propertyManagement/home.jsp is the homepage. (port can be different depending on the mysql port setup)

Folders and Files:
1) Images and WEB-INF folder contains all the images used. Mysql connector jar file is also there within lib folder.
2) assets folder contains js, css and additional images.
3) All the JSP pages are in the main web folder. also there are some icons and css within this folder.
4) Buyer, Seller and Agent basic pages are names such as the file name itself describe the purpose.
5) home.jsp is the main public home page. index.jsp is the main dasboard for users.
6) Login/Register pages have suffix as "Login"/"Register"
7) Validation pages have suffix "Validate"
8) All other pages serves the additional purpose which is easily recognizable. 

Thanks.

