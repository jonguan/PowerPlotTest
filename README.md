PowerPlotTest
=============

Updates to http://powerplot.nua-schroers.de/

1. Uses a Workspace approach to keeping the app and PowerPlot library separate
2. Uses a separate static library target for PowerPlot files (PowerPlot does not use ARC)
	This allows for the app to use ARC, while keeping PowerPlot isolated
3. Cleans up some deprecations in PowerPlot for iOS 7 (work in progress).

