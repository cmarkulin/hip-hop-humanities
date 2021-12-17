<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:hip="http://hip-hop.obdurodon.org"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="max-width" as="xs:double" select="100 * 130"/>
    <xsl:variable name="y-scale" as="xs:double" select="5"/>
    <xsl:variable name="max-height" as="xs:double" select="100 * $y-scale"/>
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
                    <xsl:sequence select="collection('../xml/' || current() || '?select=*.xml')/*"/>
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
        <xsl:result-document href="{'graph-output/' || $artist-name || '.svg'}" indent="yes"
            omit-xml-declaration="yes" exclude-result-prefixes="#all" method="xml">
            <svg width="1300" height="1000">
                <!--Variables to Count Earlier Album-->
                <xsl:variable name="wealthCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='wealth'] => count()"/>
                <xsl:variable name="drugsCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type= 'drugs'] => count()"/>
                <xsl:variable name="deathCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type ='death'] => count()"/>
                <xsl:variable name="familyCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='family'] => count()"/>
                <xsl:variable name="religionCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='religion'] => count()"/>
                <xsl:variable name="moneyCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='money'] => count()"/>
                <xsl:variable name="povertyCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='poverty'] => count()"/>
                <xsl:variable name="violenceCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='violence'] => count()"/>
                <xsl:variable name="socialCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='social_issues'] => count()"/>
                <xsl:variable name="gangsCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='gangs'] => count()"/>
                <xsl:variable name="ambigCount1" select="$songs[descendant::metadata/year eq $years[1]]//topic[@type='ambiguous'] => count()"/>

               <!--Variables to Count Later Album-->
                <xsl:variable name="wealthCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='wealth'] => count()"/>
                <xsl:variable name="drugsCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type= 'drugs'] => count()"/>
                <xsl:variable name="deathCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type ='death'] => count()"/>
                <xsl:variable name="familyCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='family'] => count()"/>
                <xsl:variable name="religionCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='religion'] => count()"/>
                <xsl:variable name="moneyCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='money'] => count()"/>
                <xsl:variable name="povertyCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='poverty'] => count()"/>
                <xsl:variable name="violenceCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='violence'] => count()"/>
                <xsl:variable name="socialCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='social_issues'] => count()"/>
                <xsl:variable name="gangsCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='gangs'] => count()"/>
                <xsl:variable name="ambigCount2" select="$songs[descendant::metadata/year eq $years[2]]//topic[@type='ambiguous'] => count()"/>
                
                <g transform="translate(200, {$max-height + 100})">
                    <xsl:variable name="years" as="xs:string+"
                        select="descendant::metadata/year => distinct-values() => sort()"/>
                    <xsl:for-each select="$artist-name">
                        <xsl:variable name="early-year"
                            select="$songs[descendant::metadata/year eq $years[1]]"/>
                        <xsl:variable name="late-year"
                            select="$songs[descendant::metadata/year eq $years[2]]"/>
                        
                                <!--Newer Album-->
                                <polyline
                                    fill="none"
                                    stroke="#aeb8b0"
                                    stroke-width="5"
                                    opacity="0.5"
                                    points="
                                    30, {$drugsCount1 *-10}
                                    110, {$deathCount1 *-10}
                                    190,{$familyCount1 *-10}
                                    270,{$religionCount1 *-10}
                                    350,{$moneyCount1 *-10}
                                    430,{$povertyCount1 *-10}
                                    510,{$wealthCount1 *-10}
                                    590,{$violenceCount1 *-10}
                                    695,{$socialCount1 *-10}
                                    790,{$gangsCount1 *-10}
                                    880,{$ambigCount1 *-10}"/>

                                <!--Older Album-->
                                <polyline
                                    fill="none"
                                    stroke="#61D088"
                                    stroke-width="5"
                                    opacity="0.5"
                                    points="
                                    30, {$drugsCount2 *-10}
                                    110, {$deathCount2 *-10}
                                    190,{$familyCount2 *-10}
                                    270,{$religionCount2 *-10}
                                    350,{$moneyCount2 *-10}
                                    430,{$povertyCount2 *-10}
                                    510,{$wealthCount2 *-10}
                                    590,{$violenceCount2 *-10}
                                    695,{$socialCount2 *-10}
                                    790,{$gangsCount2 *-10}
                                    880,{$ambigCount2 * -10}"/>
                        
                    </xsl:for-each>
                    
                    <!--X and Y axis-->
                    <line x1="0" x2="{$max-width div 15}" y1="0" y2="0" stroke="black"/>
                    <line x1="0" x2="0" y1="0" y2="-{$max-height -170}" stroke="black"/>
                    
                    <!--Graph Labels-->
                    <text x="450" y="-530" text-anchor="middle" text-decoration="underline"><xsl:value-of select="upper-case(@name)"/>'s Topic Progression Overtime</text>
                    <text x="450" y="80" text-anchor="middle">Topics</text>
                    <text x="200" y="50" transform=" translate(-120,10) rotate(270)"># Of
                        Mentions</text>
                    
                    <!--X Axis Labels-->
                    <text x="30" y="30" text-anchor="middle">Drugs</text>
                    <text x="110" y="30" text-anchor="middle">Death</text>
                    <text x="190" y="30" text-anchor="middle">Family</text>
                    <text x="270" y="30" text-anchor="middle">Religion</text>
                    <text x="350" y="30" text-anchor="middle">Money</text>
                    <text x="430" y="30" text-anchor="middle">Poverty</text>
                    <text x="510" y="30" text-anchor="middle">Wealth</text>
                    <text x="590" y="30" text-anchor="middle">Violence</text>
                    <text x="695" y="30" text-anchor="middle">Social Issues</text>
                    <text x="790" y="30" text-anchor="middle">Gangs</text>
                    <text x="880" y="30" text-anchor="middle">Ambiguous</text>
                    
                    <!--Y Axis #'s-->
                    <text x="-15" y="5" text-anchor="middle">0</text>
                    <text x="-15" y="-50" text-anchor="middle">5</text>
                    <text x="-15" y="-100" text-anchor="middle">10</text>
                    <text x="-15" y="-150" text-anchor="middle">15</text>
                    <text x="-15" y="-200" text-anchor="middle">20</text>
                    <text x="-15" y="-250" text-anchor="middle">25</text>
                    <text x="-15" y="-300" text-anchor="middle">30</text>
                    
                    <!--Key-->
                    <text x="970" y="-355" text-anchor="middle" font-size="12">Later Album
                        -</text>
                    <text x="970" y="-300" text-anchor="middle" font-size="12">Newer Album
                        -</text>
                    
                    <circle cx="1030" cy="-359" r="4" fill="#61D088" opacity="0.5"/>
                    <circle cx="1030" cy="-303" r="4" fill="#aeb8b0" opacity="0.5"/>
                </g>
            </svg>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>