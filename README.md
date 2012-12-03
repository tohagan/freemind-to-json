## How to export FreeMind files to JSON ##

These [XSLT](http://www.w3schools.com/xsl/ "XSLT") scripts allow you to export [mind maps](http://en.wikipedia.org/wiki/Mind_map "mind maps") created using [FreeMind](http://freemind.sourceforge.net "FreeMind") into [JSON](http://en.wikipedia.org/wiki/JSON "JSON") format files.

Add this to your toolbox for Web & Javascript development.  
I'm using it to create menus and tree controls.

In FreeMind ...

1. Open your mind map file (MyMap.mm)
1. From the menu select:  File | Export | Using XSTL ...
1. In the popup dialog select the **Freemind2json.xsl**  file.
1. And then select your JSON output file (typically a .js or .json file type).
1. Press **Export** to export the file.

## Export a Sencha TreeStore ##

If you're creating JSON data for a [Sencha ](http://www.sencha.com) TreeStore  you can use **FreeMind2TreeStoreJSON.xsl** script.  This will save you copy/pasting 'leaf:true' ad nausium on each leaf node. You can also maintain your own attributes in FreeMind or prune the exported tree by setting attribute with leaf=true inside FreenMind  (select a node then select 'Edit Attributes' from the context menu).  Any other custom attributes you add inside FreeMind will be exported as a JSON attribute.

## Roll your own ##
You'll find these scripts a good starting point for your own custom export. 
It's fairly easy to convert any other FreeMind attributes or modify the resulting JSON content or formatting.

Enjoy :)
Tony.