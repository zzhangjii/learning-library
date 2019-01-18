# Auto Scale ADWC Demo


The purpose of this document is to help setting up the Autonomous data warehouse Auto scaling demo on your tenancy. This document covers systematic approach to install the demo into any tenancy on oracle cloud.

you should follow the instructions available here: [Auto_Scale_ADW_Demo_Setup.md](Auto_Scale_ADW_Demo_Setup.md)

## Demo folder structure

### apexdemoscript
- Adwc_Schema.sql (ADW Script)
- Dbaas_Pdbuser.sql (pdbuser Database script)
- Apex_Demo_Application.sql(Apex Demo application script)
- Apex_Demo_Workspace.sql(Apex Demo Workspace script)

### shellscripts
- scripts(Contain Shell Scripts which run as background daemon to update load data in Dbaas Database)

### images
- Contain all screen shot

### Auto_Scale_Demo_Setup.md
- ADWCS Scale Demo deployment steps
