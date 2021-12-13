<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:hip="http://hip-hop.obdurodon.org"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
  version="3.0">
  <xsl:output method="xml" indent="yes"/>
  <!-- ================================================================== -->
  <!-- List artists using the filesystem directory names                  -->
  <!-- Use artist identifiers to read in all songs                        -->
  <!-- TODO: Artist names should be retrieved from the file system        -->
  <!-- $x-scale increases width of bars                                   -->
  <!-- TODO: compute $x-scale instead of hard-coding                      -->
  <!-- ================================================================== -->
  <xsl:variable name="all_artists" as="xs:string+" select="
      'asap_rocky',
      'childish_gambino',
      'j_cole',
      'kanye_west',
      'kendrick_lamar',
      'kid_cudi',
      'mac_miller',
      'tyler_the_creator',
      'vince_staples'"/>
  <xsl:variable name="all_songs" as="element(hip:artists)">
    <hip:artists>
      <xsl:for-each select="$all_artists">
        <hip:artist name="{current()}">
          <xsl:sequence select="collection('../xml/' || current())/*"/>
        </hip:artist>
      </xsl:for-each>
    </hip:artists>
  </xsl:variable>
  <xsl:variable name="x-scale" as="xs:integer" select="10"/>
  <!-- ================================================================== -->
  <!-- Main                                                               -->
  <!-- ================================================================== -->
  <xsl:template name="xsl:initial-template">
    <xsl:apply-templates select="$all_songs/hip:artist"/>
  </xsl:template>
  <xsl:template match="hip:artist">
    <xsl:variable name="songs" as="element(song)+" select="current()//song"/>
    <xsl:variable name="artist-name" as="xs:string" select="@name"/>
    <xsl:variable name="years" as="xs:string+"
      select="descendant::metadata/year => distinct-values() => sort()"/>
    <xsl:variable name="topics" as="xs:string+"
      select="descendant::topic/@type => distinct-values() => sort()"/>
    <xsl:result-document href="{'graph-output/' || $artist-name || '.svg'}" indent="yes"
      omit-xml-declaration="yes" exclude-result-prefixes="#all" method="xml">
      <svg width="600" height="600">
        <g transform="translate(150, 0)">
          <xsl:for-each select="$topics">
            <xsl:variable name="early-topic-count"
              select="$songs[descendant::metadata/year eq $years[1]]//@type[. eq current()] => count()"/>
            <xsl:variable name="late-topic-count"
              select="$songs[descendant::metadata/year eq $years[2]]//@type[. eq current()] => count()"/>
            <rect x="-{$early-topic-count * $x-scale}" y="{position() * 30}" height="20" width="{$early-topic-count * $x-scale}" fill="pink"/>
            <rect x="0" y="{position() * 30}" height="20" width="{$late-topic-count* 10}" fill="lightblue"/>
            <text x="50" y="{position() * 30 + 15}"><xsl:value-of select="current()"/></text>
          </xsl:for-each>
        </g>
      </svg>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>
