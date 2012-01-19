Feature: bsmart-to-magento

  In order to keep the website stock up to date with the shop stock
  As a bsmart user
  I want to update the website with the latest stock adjustments

  Scenario: load a catalog from an xml file that contains only one product
    Given a file named "catalog.xml" with:
    """
<?xml version="1.0" encoding="UTF-8"?>
<!-- Created by AcuXML(tm) version 8.1.3.1 on 2012/01/19 -->
<CATALOG>
 <ITEM>
   <ATTR>A</ATTR>
   <STKNO>5502016</STKNO>
   <MENU>55</MENU>
   <SUBMENU>2</SUBMENU>
   <SUPPLCODE>452</SUPPLCODE>
   <SUPPLSHORT>G JENSEN</SUPPLSHORT>
   <SUPPLREF>SEE NOTES</SUPPLREF>
   <DESC>Rose Q+Gar Carnival+chain</DESC>
   <QTY>1</QTY>
   <PRICE>0000235.00</PRICE>
   <REASON>D</REASON>
   <CATEGORY>4</CATEGORY>
   <WEBDESC>Carnival Rose Quartz &amp; Garnet Necklace</WEBDESC>
   <NOTEPAD><![CDATA[Georg Jensen 18inch silver curb chain with double curved garnet and rose quartz stone set silver drops. ]]> </NOTEPAD>
   <ATTRIBUTE>
     <ATT-TYPE>C7</ATT-TYPE>
     <ATT-DESC>Stone</ATT-DESC>
     <ATT-FORMAT>T</ATT-FORMAT>
     <ATT-CODE></ATT-CODE>
     <ATT-VALUE>Quartz</ATT-VALUE>
   </ATTRIBUTE>
   <ATTRIBUTE>
     <ATT-TYPE>GJ</ATT-TYPE>
     <ATT-DESC>Jensen Collection</ATT-DESC>
     <ATT-FORMAT>L</ATT-FORMAT>
     <ATT-CODE>17</ATT-CODE>
     <ATT-VALUE>Carnival</ATT-VALUE>
   </ATTRIBUTE>
   <ATTRIBUTE>
     <ATT-TYPE>NT</ATT-TYPE>
     <ATT-DESC>Neckwear Type</ATT-DESC>
     <ATT-FORMAT>L</ATT-FORMAT>
     <ATT-CODE></ATT-CODE>
     <ATT-VALUE></ATT-VALUE>
   </ATTRIBUTE>
   <ATTRIBUTE>
     <ATT-TYPE>S2</ATT-TYPE>
     <ATT-DESC>2nd Stone</ATT-DESC>
     <ATT-FORMAT>T</ATT-FORMAT>
     <ATT-CODE></ATT-CODE>
     <ATT-VALUE>Garnet</ATT-VALUE>
   </ATTRIBUTE>
 </ITEM>
    """
    When I run `bsmart2magento`
    Then the file "update.csv" should contain exactly:
    """
"stone","jensen_collection","neckwear_type","brand","stone_cut","stone_setting","gender","material","ring_type","total_weight","dial_colour","movement","water_resistance","strap_style","product_collection","special_price","height","length","width","wristwear_type","diameter_cm","condition","_store","qty","is_in_stock","status","tax_class_id","_type","_attribute_set","_product_websites","visibility","sku","price","description","image","small_image","thumbnail","_media_image","_media_attribute_id","_media_label","_media_position","_media_is_disabled","suppl_ref","name","meta_title","type","*_category","packaging","warranty","nomination_category"
"Quartz,Garnet","Carnival","","Georg Jensen","","","Ladies","Silver","","","","","","","","235.00","","","","","","new","admin","1","1","1","2","simple","Default","base","4","5502016","235.00","Georg Jensen 18inch silver curb chain with double curved garnet and rose quartz stone set silver drops.","/5/5/55-02-016.jpg","/5/5/55-02-016.jpg","/5/5/55-02-016.jpg","","73","","","","SEE NOTES","Georg Jensen Carnival Rose Quartz & Garnet Necklace","Georg Jensen Carnival Rose Quartz & Garnet Necklace SEE NOTES","Neckwear","Neckwear,Brands/Georg Jensen","","",""
    """
