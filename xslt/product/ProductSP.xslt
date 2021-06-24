<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <section class="zensa-san-pham-ds-3 zensa-section">
            <div class="container">
                <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
                
            </div>
        </section>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:if test="position()=3">
            <div class="background" setBackground="/Data/Sites/1/media/home/bg-1.png">  
                <div class="zensa-title text-center">
                    <h2><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h2>
                </div>
                <div class="main-item">
                    <div class="row justify-content-center">
                        <xsl:apply-templates select="Product"></xsl:apply-templates>
                        
                    </div>
                </div>
                <div class="view-product">
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
                        <xsl:value-of select="/ZoneList/ViewAllProductsText" disable-output-escaping="yes"></xsl:value-of>
                        <em class="mdi mdi-arrow-right"></em>
                    </a>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Product">
        <div class="col-md-6 col-lg-4">
            <figure>
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
                        <img class="lazyload">
                            <xsl:attribute name="data-src">
                                <xsl:value-of select="ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </div>
                </a>
                <figcaption>
                    <div class="title">
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
                            <h3><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h3>
                        </a>
                        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                        <div class="sub-title">
                            <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                        <div class="view-more"> 
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
                                <em class="mdi mdi-cart"></em>
                                <xsl:value-of select="/ZoneList/BuyNowText" disable-output-escaping="yes"></xsl:value-of>
                            </a>
                        </div></figcaption>
            </figure>
        </div>
    </xsl:template>
</xsl:stylesheet>