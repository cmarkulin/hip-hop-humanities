<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:hip="http://hip-hop.obdurodon.org" exclude-result-prefixes="#all" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- Gather all artists from directory name -->
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
    <!-- Drill from artists to individual song files -->
    <xsl:variable name="all_songs" as="element(hip:artists)">
        <hip:artists>
            <xsl:for-each select="$all_artists">
                <hip:artist name="{current()}">
                    <xsl:sequence select="collection('../xml/' || current() || '?select=*.xml')/*"/>
                </hip:artist>
            </xsl:for-each>
        </hip:artists>
    </xsl:variable>
    <xsl:variable name="bar-width" as="xs:double" select="50"/>
    <xsl:variable name="spacing" as="xs:double" select="$bar-width div 2"/>
    <xsl:template name="xsl:initial-template">
        <xsl:apply-templates select="$all_songs/hip:artist"/>
    </xsl:template>
    <xsl:template match="hip:artist">
        <xsl:variable name="artist-name" as="xs:string" select="@name"/>
        <xsl:variable name="songs" as="element(song)+" select="current()//song"/>
        <xsl:variable name="years" as="xs:string+"
            select="descendant::metadata/year => distinct-values() => sort()"/>

        <!-- TO DO: Fix variables that output album names -->
        <!--<xsl:variable name="early-album" as="xs:string" select="$songs[descendant::metadata/year eq $years[1]]/following-sibling::album"/>-->
        <!--<xsl:variable name="late-album" as="xs:string" select="$songs[descendant::metadata/year eq $years[2]]/following-sibling::album"/>-->

        <xsl:variable name="verse-total" as="xs:double"
            select="count(descendant::verse | chorus | bridge)"/>
        <xsl:variable name="tones" as="xs:string+" select="'positive', 'negative', 'neutral'"/>
        <xsl:variable name="max-width" as="xs:double"
            select="(($bar-width + $spacing) * count($tones)) * 2"/>
        <xsl:result-document href="{'bar-chart-output/' || $artist-name || '.svg'}" indent="yes"
            omit-xml-declaration="yes" exclude-result-prefixes="#all" method="xml">
            <svg width="500" height="500">
                <g transform="translate(50, 200)">
                    <xsl:for-each select="0 to 2">
                        <line x1="0" x2="{$max-width}" y1="-{100 * .5 * .}" y2="-{100 * .5 * .}"
                            stroke="black" stroke-dasharray="5"/>
                        <text x="-10" y="-{100 * .5 * .}" text-anchor="end" font-size="smaller">
                            <xsl:value-of select="100 * .5 * ."/>% </text>

                    </xsl:for-each>
                    <text x="{$max-width div 2}" y="100" font-size="20" text-anchor="middle">
                        <xsl:value-of select="upper-case(translate($artist-name, '_', ' '))"/>
                    </text>
                    <text x="{$max-width div 4}" y="50" text-anchor="middle">Early</text>
                    <text x="{$max-width * .75}" y="50" text-anchor="middle">Late</text>
                    <xsl:for-each select="$tones">
                        <xsl:variable name="early-tones" as="xs:double"
                            select="($songs[descendant::metadata/year eq $years[1]]//@tone[. eq current()] => count()) div $verse-total"/>
                        <xsl:variable name="late-tones" as="xs:double"
                            select="($songs[descendant::metadata/year eq $years[2]]//@tone[. eq current()] => count()) div $verse-total"/>
                        <xsl:variable name="color" as="xs:string" select="
                                if (current() = 'positive') then
                                    '#61D088'
                                else
                                    if (current() = 'negative') then
                                        '#aeb8b0'
                                    else
                                        '#457E59'"/>
                        <rect x="{(position() - 1) * ($bar-width + $spacing)}" width="{$bar-width}"
                            y="-{$early-tones * 100}" height="{$early-tones * 100}" fill="{$color}"/>
                        <text x="{(position() - 1) * ($bar-width + $spacing) + $spacing}" y="20"
                            font-size="smaller" text-anchor="middle">
                            <xsl:value-of select="."/>
                        </text>
                        <rect
                            x="{(position() * ($bar-width + $spacing) + ($bar-width + $spacing * 4))}"
                            width="{$bar-width}" y="-{$late-tones * 100}"
                            height="{$late-tones * 100}" fill="{$color}"/>
                        <text
                            x="{(position() * ($bar-width + $spacing) + $spacing) + ($bar-width + $spacing * 4)}"
                            y="20" font-size="smaller" text-anchor="middle">
                            <xsl:value-of select="."/>
                        </text>
                    </xsl:for-each>
                    <line x1="0" x2="{$max-width}" y1="0" y2="0" stroke="black"/>
                    <line x1="0" x2="0" y1="0" y2="-100" stroke="black"/>
                    <line x1="{$max-width div 2}" x2="{$max-width div 2}" y1="0" y2="-100"
                        stroke="black"/>
                </g>
            </svg>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
