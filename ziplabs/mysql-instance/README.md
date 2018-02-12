---
layout: ziplab
description: Learn how to create an Oracle MySQL Cloud Service instance.
tags: ziplab, oracle cloud, Oracle MySQL Cloud Service
permalink: /ziplabs/mysql-instance/index.html
---
# Creating an Instance of Oracle MySQL Cloud Service #

## Before You Begin ##
This Oracle By Example (OBE) lab shows you how to create an Instance of Oracle MySQL Cloud Service.
                            
### Background ###
With Oracle MySQL Cloud Service, you can deploy MySQL servers to the cloud, with each deployment containing a single MySQL server. You have full access to the features and operations available with a MySQL server. To simplify maintenance and management operations, Oracle provides the computing power, physical storage, and tooling.

When you create an instance of Oracle MySQL Cloud Service, you must associate a Secure Shell (SSH) public key with the compute infrastructure supporting the deployment. When you use an SSH client to connect to the instance, you must provide the private key that matches the public key.

### What Do You Need? ###
- An Oracle Cloud account
- [Git](https://git-scm.com/downloads) (Git Bash shell)

## Create an SSH Key Pair ##

<ol>
<li>Open a Git bash command-line window (or terminal in Linux).</li>
<li>Generate the SSH key pair: 

<pre><code>ssh-keygen -t rsa -N "<i>passphrase</i>" -b "<i>2048</i>" -C "<i>key comment</i>" -f <i>path/root_name</i></code></pre>
<table><thead><tr>
<th>Argument</th><th>Description</th>
</tr></thead>
<tbody>
<tr><td><code>-t rsa</code> </td><td> Use the RSA algorithm</td></tr>
<tr><td><code>-N "<i>passphrase</i>"</code> </td><td> Passphrase to protect the use of the key (like a password). If you don't want to set a passphrase, don't enter anything between the quotation marks. <strong>Note</strong>: Although a passphrase isn't required, you should specify one as a security measure to protect the private key from unauthorized use.</td></tr>
<tr><td><code>-b "<i>2048</i>"</code> </td><td> Generate a 2048-bit key (default). A minimum of 2048 bits is recommended for SSH-2 RSA.</td></tr>
<tr><td><code>-C "<i>key commment</i>"</code> </td><td> A name to identify the key.</td></tr>
<tr><td><code>-f <i>path/root_name</i></code> </td><td> The location where the key pair is saved and the root name for the files. For example, if you make <code>id_rsa</code> the root name, then the name of the private key is <code>id_rsa</code>, and the name of the public is <code>id_rsa.pub</code>.</td></tr>
</tbody>
</table>
</li></ol>

## Create an Instance of Oracle MySQL Cloud Service ##
1. In a web browser, go to [https://cloud.oracle.com/home](https://cloud.oracle.com/home) and click **Sign In**.
2. From the **Cloud Account** drop-down menu, select **Cloud Account with Identity Cloud Service**.
3. Enter your Cloud Account Name and click **My Services**.
4. Enter your cloud account credentials and click **Sign In**.
5. Click **Customize Dashboard**.
6. Select **Show** for **MySQL Cloud Service**.
7. Close the **Customize Dashboard** window.
8. On the **MySQL Cloud Service** tile, click the **Action Menu Action Menu** and select **Open Service Console**.
9. If there are no existing services, click the **Instances** tab.
10. Click **Create Instance**.
11. Enter or select the following information, and then click **Next**:
     * **Instance Name**: `TestDB`
     * **Description**: (optional)
     * **Notification Email**: (default)
     * **Region:**: No Preference

    ![mysql04.png](img/mysql04.png)

    [Description of the illustration mysql04.png](files/mysql04.txt)
12. Enter or select the following information, and then click **Next**:
     * **Compute Shape: OC3-1.0 OCPU, 7.5GB RAM**
     *  **SSH Public Key** (Click Edit and browse to the location of your public key.)
     * **Usable Database Storage(GB)**: 25
     * **Administration User**: root
     * **Administration Password** (Be sure to use a password with at least 8 characters, one upper case character, one number and one special character.)
     * **Confirm Administration Password**
     * **Database Schema Name**: `mydatabase`
     * **Server Character Set**: `utf8mb4 - UTF-8 Unicode`
     * **Configure MySQL Enterprise Monitor**: `No`
     * **Backup Destination**: None
     * **Create Instance from Existing Backup**: No

    ![mysql05.png](img/mysql05.png)

    [Description of the illustration mysql05.png](files/mysql05.txt)  
13. Review the details of your instance and then click **Create**.

    ![mysql06.png](img/mysql06.png)

    [Description of the illustration mysql06.png](files/mysql06.txt) 
14. Wait until the instance is created.

    ![mysql07.png](img/mysql07.png)

    [Description of the illustration mysql06.png](files/mysql07.txt) 

## Want to Learn More? ##

   * [Using Oracle MySQL Cloud Service](http://docs.oracle.com/cloud/latest/mysql-cloud/UOMCS/toc.htm) in the Oracle Help Center
   * [Deploying a PHP Application to Oracle Application Container Cloud Service](https://apexapps.oracle.com/pls/apex/f?p=44785:112:0::::P112_CONTENT_ID:19923) OBE
