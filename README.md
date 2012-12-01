## How to export FreeMind files to JSON ##

This [XSLT](http://www.w3schools.com/xsl/ "XSLT") script will allow you to export [mind maps](http://en.wikipedia.org/wiki/Mind_map "mind maps") created using [FreeMind](http://freemind.sourceforge.net "FreeMind") into [JSON](http://en.wikipedia.org/wiki/JSON "JSON") format files.

Add this to your toolbox for Web & Javascript development.  I'm using it to create menus and tree controls. 

In FreeMind ...

1. Open your mind map file (MyMap.mm)
1. From the menu select:  File | Export | Using XSTL ...
1. In the popup dialog select the **Freemind2json.xsl** file.
1. And then select your JSON output file (typically a .js or .json file type).
1. Press **Export** to export the file.

The XSLT code supports indenting and FreeMind LINK attributes. You might find this script a good starting point for your own custom export. It's fairly easy to add additional FreeMind attributes or modify the resulting layout.

Enjoy :) 


			