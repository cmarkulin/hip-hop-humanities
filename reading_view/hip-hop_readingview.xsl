<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="hip-hop.css"/>
                <title>Hip-Hop Songs</title>
            </head>
            <body>
                <section>
                    <xsl:apply-templates select="//song/*[not(self::metadata)]"/>
                </section>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="intro | chorus | verse | outro">
        <h2>
            <xsl:text>Mood: </xsl:text>
            <xsl:apply-templates select="./upper-case(@mood)"/>
        </h2>
        <div class="{@tone}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="topic">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="line">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>
