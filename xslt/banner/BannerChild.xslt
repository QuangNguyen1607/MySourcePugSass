<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <section class="zensa-banner-child">
            <div class="container">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
                        
                    </div>
                </div>
                <xsl:if test="count(Banner) > 1">
                    <div class="main-pagination">
                        <div class="swiper-pagination"></div>
                    </div>
                </xsl:if>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="Banner">
        <div class="swiper-slide">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <div class="image">
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                    </img>
                </div>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>