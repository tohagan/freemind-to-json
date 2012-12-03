<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- FreeMind to JSON for Sencha TreeStore
       Copyright (C) 2012   MIT Licence   Tony O'Hagan  tony@ohagan.name
  -->
  
  <xsl:output method="text" indent="no"/>
  <xsl:param name="indent-increment" select="'    '" />
  
  <xsl:template match="map">
    <!-- Ignores root 'node' -->
    <xsl:apply-templates select="node/node"/>
  </xsl:template>

  <xsl:template match="node">
    <xsl:param name="indent" select="'&#x0A;'"/>
    <xsl:variable name="indent0" select="$indent" />
    <xsl:variable name="indent1" select="concat($indent, $indent-increment)" />

    <xsl:if test="position() &gt; 1">, </xsl:if>
    
    <xsl:text>{</xsl:text>
    
    <xsl:value-of select="$indent1"/>
    <xsl:text>text: '</xsl:text>
    <xsl:call-template name="escape-javascript">
      <xsl:with-param name="string" select="@TEXT"/>
    </xsl:call-template>
    <xsl:text>'</xsl:text>
    
    <xsl:if test="@LINK">
      <xsl:text>,</xsl:text>
      <xsl:value-of select="$indent1"/>
      <xsl:text>href: "</xsl:text>
      <xsl:value-of disable-output-escaping='yes' select="@LINK"/>
      <xsl:text>"</xsl:text>
    </xsl:if>

    <xsl:if test="attribute">
      <xsl:apply-templates select="attribute">
        <xsl:with-param name="indent" select="$indent1"/>
      </xsl:apply-templates>
    </xsl:if>
    
    <xsl:choose>
      
      <!-- You can prune the tree by setting an attribute having leaf=true inside FreeMind. -->
      <xsl:when test="node and not(node/attribute[@NAME = 'leaf' and @VALUE = 'true'])">
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$indent1"/>
        <xsl:text>children: [</xsl:text>
      
        <!-- Recursion -->
        <xsl:apply-templates select="node">
          <xsl:with-param name="indent" select="$indent1"/>
        </xsl:apply-templates>
        
        <xsl:text>]</xsl:text>
      </xsl:when>

      <xsl:otherwise>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="$indent1"/>
        <xsl:text>leaf: true</xsl:text>
      </xsl:otherwise>
    
    </xsl:choose>
        
    <xsl:value-of select="$indent0"/>
    <xsl:text>}</xsl:text>
    
  </xsl:template>

  <xsl:template match="attribute">
    <xsl:param name="indent"/>
    <xsl:text>,</xsl:text>
    <xsl:value-of select="$indent"/>
    <xsl:value-of select="@NAME"/>
    <xsl:text>: "</xsl:text>
    <xsl:value-of select="@VALUE"/>
    <xsl:text>"</xsl:text>    
  </xsl:template>

  <!--
        Javascript string escape template by Jeni Tennison
        Source: http://holytshirt.blogspot.com/2008/06/xslt-javascript-escaping.html
        Author page: http://www.jenitennison.com/
    -->
  <xsl:template name="escape-javascript">
    <xsl:param name="string" />
    <xsl:choose>

      <xsl:when test='contains($string, "&apos;")'>
        <xsl:call-template name="escape-javascript">
          <xsl:with-param name="string"
              select='substring-before($string, "&apos;")' />
        </xsl:call-template>
        <xsl:text>\'</xsl:text>
        <xsl:call-template name="escape-javascript">
          <xsl:with-param name="string"
              select='substring-after($string, "&apos;")' />
        </xsl:call-template>
      </xsl:when>

      <xsl:when test="contains($string, '&#xA;')">
        <xsl:call-template name="escape-javascript">
          <xsl:with-param name="string"
              select="substring-before($string, '&#xA;')" />
        </xsl:call-template>
        <xsl:text>\n</xsl:text>
        <xsl:call-template name="escape-javascript">
          <xsl:with-param name="string"
              select="substring-after($string, '&#xA;')" />
        </xsl:call-template>
      </xsl:when>
      
      <xsl:when test="contains($string, '\')">
        <xsl:value-of select="substring-before($string, '\')" />
        <xsl:text>\\</xsl:text>
        <xsl:call-template name="escape-javascript">
          <xsl:with-param name="string"
              select="substring-after($string, '\')" />
        </xsl:call-template>
      </xsl:when>
      
      <xsl:otherwise>
        <xsl:value-of select="$string" />
      </xsl:otherwise>
    
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
