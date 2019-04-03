# Create local repository to work with Developer Repository

If you want to work on the repo using Git and Github from a local copy on your machine; you will need a folder to represent your clone/fork of the repository 
<br/>(these instructions assume you have successfully downloaded and installed git on the local machine)

Steps to get a current copy of repo (ospa-github-ideas in this example)
<br/>(steps will be the same for other repos, just change the name)

1. Open Terminal window on Mac; Command window on Windows (__"cmd" command__ NOT "command")

1. I created a folder for local repositories called 'gitrepos'

    __mkdir gitrepos__

1. I created a folder for the ospa-github-ideas repo; and made it the current directory

    __mkdir ospa-github-ideas__

    __cd ospa-github-ideas__

1. Initialize the folder for git

    __git init__

1. Clone current folder 

     1. Get current repo url from github 
     1. Open ospa-github-ideas in github
     1. Click "Clone or Download" Button (you may download a .zip if that's all you want)- URI will look something like this: https://github.com/jjking2019/ospa-github-ideas.git
     1. Copy url provided to clipboard

  1. Issue following command using url from clipboard to "clone" the dev repo from the cloud and make a local copy on your machine

     __git clone https://github.com/jjking2019/ospa-github-ideas.git__

    (should see messages something like this: 
       Cloning into 'ospa-github-ideas'...
       /* more messages here */ 
       ... done.)

1. Repository is cloned and may be worked on locally then 'committed' and 'pushed' to cloud
