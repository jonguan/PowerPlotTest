PowerPlotTest
=============

Updates to http://powerplot.nua-schroers.de/
Because PowerPlot is under GNU Public License v3, I have kept the same license agreement for this project.

1. Uses a Workspace approach to keeping the app and PowerPlot library separate
2. Uses a separate static library target for PowerPlot files (PowerPlot does not use ARC)
	This allows for the app to use ARC, while keeping PowerPlot isolated
3. Cleans up some deprecations in PowerPlot for iOS 7 (work in progress).

