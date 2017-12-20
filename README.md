This is a modified version of Travis Griggs' STIG utility for VisualWorks Smalltalk to match the agreed upon structure of a [Cypress](https://github.com/CampSmalltalk/Cypress) compatible repository.

# Getting Started

(Note that this code requires VW 7.9 or later)

1. Clone this repository into your image directory, you should get a STIG subdirectory there.
2. Load STIG/STIG.pcl parcel into your image.
3. Optionally, set the root for the STIG packages, and read changes to get any updates to STIG.

# Importing a project

1. Using GIT, Subversion or your version control software of choice, clone / check-out a Cypress repository.
2. In the browser, right-click, go to the STIG menu, select "import" and choose a "*.package" directory to import it.

# Your daily workflow

1. Update / pull latest changes into your local working copy.
2. In VW, right-click on the project, "STIG" -> "Read changes". This will add/remove/update the image with whatever is in the repository.
3. Do some work.
4. Right-click on the project, "STIG" -> "Write changes". This will add/remove/update the working copy with changes from the image.
5. Check-in, push changes to master.

You could probably use "STIG" -> "diff" to see your changes. However, you can do exactly the same thing by writing changes, then using GIT or Subversion to review changes.

# Converting an existing project to Cypress

1. Right-click on the project, "STIG" -> "Set root", navigate to the directory to where you want to export the project.
2. "STIG" -> Write changes.
3. Use GIT / Subversion / other to add the resulting files to version control.

# Other

I have no idea what "diff", "commit" or "init" do. You'll have to ask the original authors. -mikevdg.

# Known Bugs

There are many bugs.

STIG currently seems to strip copywrite information. This is unintentional.

Sometimes when loading code, STIG isn't smart enough to know which package to put extensions in. VW will prompt you.

# License

No idea. I obtained this code from https://github.com/CampSmalltalk/STIG and made some fixes. -mikevdg
