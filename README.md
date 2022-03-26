
 ABOUT

The objective of the project is to develop the nurse scheduling system for 500 nurses of an agency in Montreal by June 2022.

This schedule helps to accommodate supplemental nurses to different hospitals as per nurses’ availability and preferences which matches the hospital requirements.

Technologies Used:

Programming Language Used: ASP.NET
Database: Microsoft SQL 2016
API Hosted: IIS server/Azure Web App/IIS server on Azure Virtual machine
Front-end Development: HTML, CSS, and, Bootstrap 
Tools Used: VS 2019, Microsoft SQL Server 2019.
Storage: GITHUB
CI/CD: Azure DevOps.
Other tools Used: JIRA


CI/CD:

Implementation of CI/CD pipeline using dev ops as follows:
•	Added the code base to the azure GIT repo on Azure DevOps.
•	Created a build pipeline using the GIT repo as the source.
•	Added a task in the YAML to create an artifact of the asp.net build solution. This will be used in the release pipeline to deploy the asp.net build solution to the destination. 
•	I have deployed the solution to the Azure web app. 
![image](https://user-images.githubusercontent.com/37263737/160225654-76bab88e-4199-4f6d-a3af-e29d0b3d4a95.png)
