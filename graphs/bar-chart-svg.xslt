<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
        exclude-result-prefixes="xs"
        version="2.0">
        <xsl:output method="xml" indent="yes"/>
        <xsl:template match="/">
            <svg width="300" height="300">
                <g transform="translate(50, 50)">
                    <line x1="0" y1="100" x2="0" y2="0" stroke="black"/>
                    <line x1="0" y1="100" x2="200" y2="100" stroke="black"/>
                    <line x1="200" y1="50" x2="0" y2="50" stroke="black" opacity="0.5" stroke-dasharray="5"/>
                    <text x="-15" y="100" text-anchor="middle">0</text>
                    <text x="-15" y="50" text-anchor="middle">5</text>
                    <text x="-15" y="0" text-anchor="middle">10</text>
                    <text x="35" y="120" test-size="smaller" text-anchor="middle">Positive</text>
                    <text x="103" y="120" text-anchor="middle" font-size="smaller">Negative</text>
                    <text x="170" y="120" text-anchor="middle" font-size="smaller">Neutral</text>
                    <text x="100" y="145" text-anchor="middle" font-size="smaller">
                        <xsl:apply-templates select="//title"/>
                    </text>
                    <text x="100" y="165" text-anchor="middle" font-size="smaller">
                        <xsl:apply-templates select="//artist"/>
                    </text>
                    <xsl:apply-templates select="song"/>
                </g>
            </svg>
        </xsl:template>
        <xsl:template match="song">
            <xsl:variable name="inPos" select="count(intro[@tone='positive'])"/>
            <xsl:variable name="pos" select="count(verse[@tone='positive'])"/>
            <xsl:variable name="chPos" select="count(chorus[@tone='positive'])"/>
            <xsl:variable name="brPos" select="count(bridge[@tone='positive'])"/>
            <xsl:variable name="outPos" select="count(outro[@tone='positive'])"/>
            <xsl:variable name="neg" select="count(verse[@tone='negative'])"/>
            <xsl:variable name="inNeg" select="count(intro[@tone='negative'])"/>
            <xsl:variable name="chNeg" select="count(chorus[@tone='negative'])"/>
            <xsl:variable name="brNeg" select="count(bridge[@tone='negative'])"/>
            <xsl:variable name="outNeg" select="count(outro[@tone='negative'])"/>
            <xsl:variable name="inNeut" select="count(intro[@tone='neutral'])"/>
            <xsl:variable name="neut" select="count(verse[@tone='neutral'])"/>
            <xsl:variable name="chNeut" select="count(chorus[@tone='neutral'])"/>
            <xsl:variable name="brNeut" select="count(bridge[@tone='neutral'])"/>
            <xsl:variable name="outNeut" select="count(outro[@tone='neutral'])"/>
            <rect x="12" y="{100 - ($pos + $chPos + $brPos + $inPos + $outPos)*10}" width="40" height="{($pos + $chPos + $brPos + $inPos + $outPos) * 10}" fill="#61D088" stroke="black"/>
            <rect x="75" y="{100 - ($neg + $chNeg + $brNeg + $inNeg + $outNeg)*10}" width="40" height="{($neg + $chNeg + $brNeg + $inNeg + $outNeg) * 10}" fill="#aeb8b0" stroke="black"/>
            <rect x="145" y="{100 - ($neut + $chNeut + $brNeut + $inNeut + $outNeut)*10}" width="40" height="{($neut + $chNeut + $brNeut + $inNeut + $outNeut) * 10}" fill="#457E59" stroke="black"/>
        </xsl:template>
    </xsl:stylesheet>
