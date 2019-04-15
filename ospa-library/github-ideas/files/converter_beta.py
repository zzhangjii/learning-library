### DOCX-to-MD Converter
### Script create by Alejandro Casas <alejandro.casas@oracle.com>
### Oracle Sales and Partner Academy
### For internal use only
### Beta 1

import os
import subprocess
import platform
from Tkinter import *
import tkMessageBox
import fileinput
from urlparse import urlparse



# Verify Local repository exists. Create target directory if doesn't

def assure_path_exists():

    git_repo = entry1.get().rsplit('/', 1)[0]

    flag = 0
    if platform.system() == "Linux" or platform.system() == "Linux2" or platform.system() == "Darwin":
        if not os.path.exists(entry1.get()):
            MsgBox = tkMessageBox.askquestion("Error", "Directory structure does not exist. Do you want to create the directory structure?")
            if MsgBox == 'yes':
                os.makedirs(git_repo)
                tkMessageBox.showinfo("Information", "Directory structure created. You must clone your dev repository")
                flag = 1

    elif platform.system() == "win32" or platform.system() == "win64" or platform.system() == "Windows":
        if not os.path.exists(entry1.get()):
            MsgBox = tkMessageBox.askquestion("Error","Directory structure does not exist. Do you want to create the directory structure?")
            print MsgBox
            if MsgBox == 'yes':
                os.makedirs(git_repo)
                tkMessageBox.showinfo("Information", "Directory structure created. You must initiate your dev repository")
                flag = 1

    return flag


def convertDocx():
    """
    Convert Docx2MD def. Calls path verification def and convert the document. If checkbox is selected, call def to
    push code to github

    """
    repo_name = entry1.get().rsplit('/', 1)[-1]
    doc_input = entry2.get()
    doc_output = entry3.get()

    status_init = assure_path_exists()

    if status_init != 1:

        if doc_output == " ":
            file_path = doc_input.rsplit('/', 1)[-1]
            doc = file_path.rsplit('.', 1)[0] + '.md'
        else:
            doc = doc_output + '.md'

        if platform.system() == "Linux" or platform.system() == "Linux2" or platform.system() == "Darwin":
            try:
                os.chdir(entry1.get())
            except:
                tkMessageBox.showinfo("Error", "Invalid path or repository")

        elif platform.system() == "win32" or platform.system() == "win64" or platform.system() == "Windows":
            try:
                os.chdir(entry1.get())
            except:
                tkMessageBox.showinfo("Error", "Invalid path or repository")

        cmd = 'pandoc --extract-media . ' + doc_input + ' -t gfm -o ' + doc
        os.system(cmd)

        if checkBoxA.get() == True:
            tkMessageBox.showinfo("Information", "Convertion complete. Uploading content")
        else:
            tkMessageBox.showinfo("Information", "Convertion complete.")

        if checkBoxA.get() == True:
            if platform.system() == "Linux" or platform.system() == "Linux2" or platform.system() == "Darwin":
                try:
                    os.chdir(entry1.get())
                except:
                    tkMessageBox.showinfo("Error", "Invalid path or repository")

            elif platform.system() == "win32" or platform.system() == "win64" or platform.system() == "Windows":
                try:
                    os.chdir(entry1.get())
                except:
                    tkMessageBox.showinfo("Error", "Invalid path or repository")

            if platform.system() == "Darwin":
                exists = os.path.isfile(git_home_x + '/' + repo_name + '/' + '.DS_Store')
                if exists:
                    cmd = 'rm .DS_Store'
                    os.system(cmd)
                else:
                    pass

            cmd = 'git pull && git add . && git commit -m "Update MD content" && git push origin master'
            os.system(cmd)

            tkMessageBox.showinfo("Information", "Content updated")

        else:
            pass
    else:
        pass


def ospa_help():
    tkMessageBox.showinfo("Information - Author: Alejandro Casas <alejandro.casas@oracle.com>", "Oracle Sales and Partner Academy \
        Docx-To-MD converter. You must provide repository and documents absolute path. \
        If your folder structure is not set up, the script will set it up for you. You will need to clone your respository once the directory structure is created.")


def patchGitConfig(url, path, user):

    folder = url.rsplit('/', 1)[-1].split('.', 1)[0]

    for line in fileinput.FileInput(path + "/" + folder + "/.git/config", inplace=1):
        line = line.replace("github.com", user + "@github.com")
        print line


# Def for clone repo shell command

def cloneRepo(url, path, user):
    try:
        os.chdir(path)
        cmd = 'git clone ' + url
        subprocess.call(cmd, shell=True)
        patchGitConfig(url, path, user)
        tkMessageBox.showinfo("Information", "Github repository has been cloned")
    except OSError:
        tkMessageBox.showinfo("Error", "Invalid path or repository")


# Init repo def. Initiate Tk and calls cloneRepo def.

def initRepo():
    initTK = Tk()
    initTK.title("Init Repository")
    repo_url = StringVar()
    repo = StringVar()
    usrname = StringVar()

    label_user = Label(initTK, text="GitHub User")
    label_url = Label(initTK, text="GitHub URL")
    label_repo = Label(initTK, text="Local Repository Absolute path (Git container directory)")

    userid = Entry(initTK, textvariable=usrname)
    url = Entry(initTK, textvariable=repo_url)
    path = Entry(initTK, textvariable=repo)

    label_user.grid(row=0)
    label_url.grid(row=1)
    label_repo.grid(row=2)

    userid.grid(row=0,column=1)
    url.grid(row=1, column=1)
    path.grid(row=2, column=1)

    """(cloneRepo(url.get(), path.get()) sends entry content to clonerepo def."""

    button1 = Button(initTK, text="Enter", command=lambda: (cloneRepo(url.get(), path.get(), userid.get())))
    button2 = Button(initTK, text="Cancel", command=initTK.destroy)

    button1.grid(row=3)
    button2.grid(row=3, column=1)

    initTK.mainloop()


# Def for push repo shell command

def push(path):
    try:
        os.chdir(path)
        cmd = 'git pull && git add . && git commit -m "Update to repository" && git push origin master'
        subprocess.call(cmd, shell=True)
        tkMessageBox.showinfo("Information", "Github repository has been updated")

    except OSError:
        tkMessageBox.showinfo("Error", "Invalid path or repository")


# PushToGit repo def. Initiate Tk and calls push def.

def pushToGit():
    gitTk = Tk()
    gitTk.title("Update Remote Repository")
    repo = StringVar()
    path = Entry(gitTk, textvariable=repo)

    label_repo = Label(gitTk, text="Local Repository Absolute path (Project directory included)")
    label_repo.grid(row=0)

    path.grid(row=0, column=1)

    button1 = Button(gitTk, text="Enter", command=lambda: (push(path.get())))
    button2 = Button(gitTk, text="Cancel", command=gitTk.destroy)

    button1.grid(row=1)
    button2.grid(row=1, column=1)


# Def for pull repo shell command

def pull(path):
    try:
        os.chdir(path)
        cmd = 'git pull'
        subprocess.call(cmd, shell=True)
        tkMessageBox.showinfo("Information", "Local repository has been updated")

    except OSError:
        tkMessageBox.showinfo("Error", "Invalid path or repository")


# PullFromGit repo def. Initiate Tk and calls pull def.

def pullFromGit():
    gitTk = Tk()
    gitTk.title("Update Local Repository")
    repo = StringVar()
    path = Entry(gitTk, textvariable=repo)

    label_repo = Label(gitTk, text="Local Repository Absolute path (Project directory included)")
    label_repo.grid(row=0)

    path.grid(row=0, column=1)

    button1 = Button(gitTk, text="Enter", command=lambda: (pull(path.get())))
    button2 = Button(gitTk, text="Cancel", command=gitTk.destroy)

    button1.grid(row=1)
    button2.grid(row=1, column=1)





##### Root TK #####

root = Tk()
root.title("OSPA DOCX-to-MD Converter")
menu = Menu(root)
root.config(menu=menu)
subMenu1 = Menu(menu)
subMenu2 = Menu(menu)
subMenu3 = Menu(menu)

menu.add_cascade(label="File", menu=subMenu1)
subMenu1.add_command(label="Init Repo", command=initRepo)

menu.add_cascade(label="Git", menu=subMenu2)
subMenu2.add_command(label="Push", command=pushToGit)
subMenu2.add_command(label="Pull", command=pullFromGit)

menu.add_cascade(label="Help", menu=subMenu3)
subMenu3.add_command(label="Help", command=ospa_help)

repo = StringVar()
doc_input = StringVar()
doc_output = StringVar()
checkBoxA = BooleanVar()

label_repo = Label(root, text="Local Repository Absolute path (Project directory included)")
label_docx = Label(root, text="Local Document Absolute path")
label_ouput = Label(root, text="Name of MD document (Optional)")
Checkbutton(root, text="Do you want to push changes to your respository", variable=checkBoxA).grid(row=4)

entry1 = Entry(root, textvariable=doc_input)
entry2 = Entry(root, textvariable=repo)
entry3 = Entry(root, textvariable=doc_output)

label_docx.grid(row=0)
label_repo.grid(row=1)
label_ouput.grid(row=2)


entry1.grid(row=0, column=1)
entry2.grid(row=1, column=1)
entry3.grid(row=2, column=1)

button1 = Button(root, text="Enter", command=convertDocx)
button2 = Button(root, text="Cancel", command=root.destroy)

button1.grid(row=4, column=1)
button2.grid(row=4, column=2)

root.mainloop()

##### Root TK #####
