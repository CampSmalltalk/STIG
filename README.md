This is a modified version of Travis Griggs' STIG utility for VisualWorks Smalltalk to match the agreed upon structure of a [Cypress](https://github.com/CampSmalltalk/Cypress) compatible repository.

# Getting Started

1. clone this repository into your image directory, you should get a STIG subdirectory there
2. load STIG/STIG.pcl parcel into your image, you should get a STIG bundle with three packages in it. These packages should already know that their "git source" is in the STIG subdirectory thanks to their STIGRoot proprety. Consequently you should be able to start working with those immediately
3. You should have a new STIG submenu on your Packages menu now, try to Diff the packages or the whole bundle, that should compare what you loaded from parcel with whatever is in the STIG/packages directory structure. If the parcel is up to date there should be no differences. If the parcel is behind some differences should show up and you may want to do a Read to update the code in the image (note that this may go wrong sometimes as you're basically performing an engine upgrade while driving, in these cases the parcel should be updated asap to avoid unnecessary frustration).
