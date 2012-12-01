<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" indent="no"/>
  <xsl:param name="indent-increment" select="'    '" />
  
  <xsl:template match="map">
    <!-- Ignores root 'node' -->
    <xsl:apply-templates select="node/node"/>
  </xsl:template>

  <xsl:template match="node">
    <xsl:param name="indent" select="'&#xA;'"/>
    <xsl:variable name="indent0" select="$indent" />
    <xsl:variable name="indent1" select="concat($indent, $indent-increment)" />

    <xsl:if test="position()&gt;1">,</xsl:if>
    
    <xsl:text>{</xsl:text>
    <xsl:value-of select="$indent1"/>
    <xsl:text>text: "</xsl:text>
    <xsl:value-of select="@TEXT"/>
    <xsl:text>"</xsl:text>
    
    <xsl:choose>
      
      <xsl:when test="@LINK">
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$indent1"/>
        <xsl:text>url: "</xsl:text>
        <xsl:value-of select="@TEXT"/>
        <xsl:text>"</xsl:text>
      </xsl:when>
      
      <xsl:when test="node">
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$indent1"/>
        <xsl:text>items: [</xsl:text>
        
        <xsl:apply-templates select="node">
          <xsl:with-param name="indent" select="$indent1"/>
        </xsl:apply-templates>
        
        <xsl:text>]</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:value-of select="$indent0"/>
    <xsl:text>}</xsl:text>
  </xsl:template>
</xsl:stylesheet>
