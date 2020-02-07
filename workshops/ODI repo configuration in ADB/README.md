Before start, create a REPO user inside your ADW,
Login ADW using “admin”, create user “ODI_SCHEMA” using the following SQL commands:
create user ODI_SCHEMA identified by WELcome__12345;
grant DWROLE to ODI_SCHEMA;
grant unlimited tablespace to ODI_SCHEMA;
grant PDB_DBA to ODI_SCHEMA;


Open your ODI using MySQL-Repo login:

default name is ODISA_MYSQL, 
default username is SUPERVISOR, 
default password can be found using this script: /home/opc/oracle/odi/common/scripts/getPassword.sh




Once login, open the top-left “File” button, click “New”, the following dialog will pop up, select “ODI” on the left, click “Create a New Master Repository” ;



Fill in the ADW connection information following example image:
Note: select “Use Credential File”, find your ADW wallet file; if you see errors when selecting the “Connection Detail”, ignore it, unzip your wallet file, open the tnsnames.ora file, copy one of the connection details:
For example:
adb_medium = (description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=zull66qishvkzsv_adb_medium.adwc.oraclecloud.com))(security=(ssl_server_cert_dn="CN=adwc.uscom-east-1.oraclecloud.com,OU=Oracle BMCS US,O=Oracle Corporation,L=Redwood City,ST=California,C=US")))

Replace the front part “adb_medium = ” with “jdbc:oracle:thin:@” and format this JDBC URL:
jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-ashburn-1.oraclecloud.com))(connect_data=(service_name=zull66qishvkzsv_adb_medium.adwc.oraclecloud.com))(security=(ssl_server_cert_dn="CN=adwc.uscom-east-1.oraclecloud.com,OU=Oracle BMCS US,O=Oracle Corporation,L=Redwood City,ST=California,C=US")))

Paste this JDBC URL into the ‘JDBC URL’ box;
Put ODI_SCHEMA credential into User section;
Put ADMIN (Capitalize!!) credential into DBA user section;



Test the connection:




Following the dialog guidance, create the Master repo in ADW:
You will also need to create a login credential for SUPERVISOR here;
Will take 3-5 minutes, once done, u can see success msg





Log out ODI, and re-login, at start connection, click that green “+” button
 And create an ODI-login using ADW-repo;



ODI connection:
Login name: anything u like;
User: SUPERVISOR
Password: this password u created in step 4;
Database Connection:
User: ODI_SCHEMA;
Password: ODI_SCHEMA’s password
Driver list: select Oracle JDBC driver


Select “Use Credential File”; 
find your wallet file, u may experience the same problem with the “Connection Details” as Step 3, if so, copy the same JDBC URL here into that “URL” box;
Select “Master Repository Only” and test connection




Once succeed, login ODI using this new ODI_ADW_REPO connection




Create a work repository
Go to Topology => Repositories => Work Repositories => New Work Repositories

Fill in the information, remember to use that JDBC URL





Once succeed, logout ODI, edit that ODI_ADW_REPO connection:
Find and add this workrepo;


Job Done
Congrats, now you have the repo inside ADW, it’s ready to use.

here’s the latest online doc about ODI market place image
https://docs.oracle.com/en/middleware/fusion-middleware/data-integrator/12.2.1.4/odi-marketplace/getting-started-oracle-cloud-marketplace.html#GUID-1793F6A6-8581-465D-BBE3-8F0C8ADD6536

also, you can read this article on Media:
https://medium.com/@zzhangjii/configure-autonomous-database-adb-as-repo-for-oracle-data-integrator-odi-3d1a3dba412e














