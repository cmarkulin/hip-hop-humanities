<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:variable name="max-width" as="xs:double" select="count(//line) * 200"/>
    <xsl:variable name="y-scale" as="xs:double" select="5"/>
    <xsl:variable name="max-height" as="xs:double" select="100 * $y-scale"/>
    <xsl:template match="/">
        <svg width="1300" height="1000">
            <g transform="translate(200, {$max-height + 100})">
                <!--X and Y axis-->
                <line x1="0" x2="{$max-width div 15}" y1="0" y2="0" stroke="black"/>
                <line x1="0" x2="0" y1="0" y2="-{$max-height}" stroke="black"/>
                
                <!--Graph Labels-->
                <text x="450" y="-530" text-anchor="middle" text-decoration="underline"><xsl:apply-templates select="//artist"/>'s Topic Progression Overtime</text>
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
                <text x="-15" y="-350" text-anchor="middle">35</text>
                <text x="-15" y="-400" text-anchor="middle">40</text>
                <text x="-15" y="-450" text-anchor="middle">45</text>
                <text x="-15" y="-498" text-anchor="middle">50</text>
                
                <!--Key-->
                <text x="970" y="-355" text-anchor="middle" font-size="12">Oldest/Older Album
                    -</text>
                <text x="970" y="-300" text-anchor="middle" font-size="12">Most Recent Album
                    -</text>
                
                <circle cx="1030" cy="-359" r="4" fill="#61D088"/>
                <circle cx="1030" cy="-303" r="4" fill="#aeb8b0"/>
                
                <xsl:apply-templates select="//song"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="song">
        <!--Older Album-->
        <xsl:variable name="wealthCount" select="count((intro | verse | chorus | outro)/topic[@type='wealth'])"/>
        <xsl:variable name="drugsCount" select="count((intro | verse | chorus | outro)/topic[@type='drugs'])"/>
        <xsl:variable name="deathCount" select="count((intro | verse | chorus | outro)/topic[@type='death'])"/>
        <xsl:variable name="familyCount" select="count((intro | verse | chorus | outro)/topic[@type='family'])"/>
        <xsl:variable name="religionCount" select="count((intro | verse | chorus | outro)/topic[@type='religion'])"/>
        <xsl:variable name="moneyCount" select="count((intro | verse | chorus | outro)/topic[@type='money'])"/>
        <xsl:variable name="povertyCount" select="count((intro | verse | chorus | outro)/topic[@type='poverty'])"/>
        <xsl:variable name="violenceCount" select="count((intro | verse | chorus | outro)/topic[@type='violence'])"/>
        <xsl:variable name="socialCount" select="count((intro | verse | chorus | outro)/topic[@type='social_issues'])"/>
        <xsl:variable name="gangsCount" select="count((intro | verse | chorus | outro)/topic[@type='gangs'])"/>
        <xsl:variable name="ambigCount" select="count((intro | verse | chorus | outro)/topic[@type='ambiguous'])"/>
        <xsl:if test="//metadata/year &lt;= 2014">        
            <polyline
            fill="none"
            stroke="#61D088"
            stroke-width="3"
            points="
            30, {$drugsCount *-10}
            110, {$deathCount *-10}
            190,{$familyCount *-10}
            270,{$religionCount *-10}
            350,{$moneyCount *-10}
            430,{$povertyCount *-10}
            510,{$wealthCount *-10}
            590,{$violenceCount *-10}
            695,{$socialCount *-10}
            790,{$gangsCount *-10}
            880,{$ambigCount *-10}"/>
        </xsl:if>
        
        <xsl:if test="//metadata/year &gt;= 2017">
        <!--Newer Album-->
        <polyline
            fill="none"
            stroke="#aeb8b0"
            stroke-width="3"
            points="
            30, {$drugsCount *-10}
            110, {$deathCount *-10}
            190,{$familyCount *-10}
            270,{$religionCount *-10}
            350,{$moneyCount *-10}
            430,{$povertyCount *-10}
            510,{$wealthCount *-10}
            590,{$violenceCount *-10}
            695,{$socialCount *-10}
            790,{$gangsCount *-10}
            880,{$ambigCount *-10}"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
