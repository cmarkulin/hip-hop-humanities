<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <xsl:variable name="wealthCount" select="count(//wealth)"/>
        <xsl:variable name="drugsCount" select="count(//drugs)"/>
        <xsl:variable name="deathCount" select="count(//death)"/>
        <xsl:variable name="familyCount" select="count(//family)"/>
        <xsl:variable name="religionCount" select="count(//religion)"/>
        <xsl:variable name="moneyCount" select="count(//money)"/>
        <xsl:variable name="povertyCount" select="count(//poverty)"/>
        
        <svg height="375">
            <g transform="translate(80, 330)">
                <line x1="20" x2="20" y1="0" y2="-200" stroke="black" stroke-width="1"/>
                <line x1="20" x2="220" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <text x="200" y="-220" text-anchor="end">Tone Distrubution in Song</text>
                <text x="10" y="-200" text-anchor="end">100%</text>
                <text x="10" y="-100" text-anchor="end">50%</text>
                <text x="10" y="0" text-anchor="end">0%</text>
                <text x="200" y="15" text-anchor="end">(+)</text>
                <text x="78" y="15" text-anchor="end">(-)</text>
                <text x="145" y="15" text-anchor="end">(-/+)</text>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>