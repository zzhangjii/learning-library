### Three-Level Rationale  -- [RETURN](README.md)

* In GitHub (and Git) a "clone" or "fork" is of the entire repository; so, an OSPA clone of the Oracle learning-library contains everything in the 'master' repository
  * If someone makes changes to the clone or fork; those changes are made to the master when repositories are merged
  * If someone in OSPA inadvertently changes something in another team's folder it might be months before the mistake is noticed (probably not a good thing for OSPA)
* One of the reasons for adopting GitHub is to promote the free and rapid collaboration that Git is famous for
* So we are suggesting a three-level repository scheme that will require some manual (or scripted) steps by the admins
  * The oracle/learning-library repository will be our "Production Repository"; only accessible to Admins
  * The "Staging Repository" will be managed by the Admins; it will be a clone of oracle/learning-library 
<br/>(currently using jjking2019/learning-library)
  * Developers will use one (or more) "Developer Repository" 
    * Each "Developer Repository" contains a single folder e.g. ospa-appint contains the appint folder's contents
    * Developers will have full rights to add, modify, delete "Developer Repository" contents
    * Developers may include anyone they like (as long as they are GitHub users) to contribute and collaborate
    * Developers (and their teams) will perform all necessary CE and QA of the content
    * There is currently no mechanism (that we know of) to automatically deal with a single folder in Git or GitHub, though SVN offers some functionality that we can leverage on the download side
  * Current plan is for Admins to copy (manually now, script later) "Developer Repo" contents into the "Staging Repo"
   * While a manual step may be tedious and error-prone; the errors won't impact other teams
  * Using a "Staging Repo" allows us to verify that the content is correctly posted
  * Admins can ensure that only OSPA content is modified before updating the oracle/learning-library
