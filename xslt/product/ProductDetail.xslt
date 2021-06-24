<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <section class="zensa-san-pham-ct-1 zensa-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="main-slide">
                            <div class="row">
                                <div class="col-2">
                                    <div class="main-thumbs">
                                        <div class="swiper-container gallery-thumbs">
                                            <div class="swiper-wrapper">
                                                <xsl:apply-templates select="/ProductDetail/ProductImages"></xsl:apply-templates>
                                            </div>
                                        </div>
                                        <div class="main-button">
                                            <div class="button-prev"><em class="lnr lnr-chevron-up"></em></div>
                                            <div class="button-next"><em class="lnr lnr-chevron-down"></em></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-10">
                                    <div class="swiper-container gallery-top">
                                        <div class="swiper-wrapper">
                                            <xsl:apply-templates select="/ProductDetail/ProductImages"></xsl:apply-templates>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="zensa-title-h3"> 
                            <h3><xsl:value-of select="/ProductDetail/Title" disable-output-escaping="yes"></xsl:value-of></h3><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                        <div class="main-table">
                            <xsl:value-of select="/ProductDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                        <div class="main-price-contact">
                            <div class="buy-now"><a href="tel: 1900 8054"> <em class="mdi mdi-cart"></em><xsl:value-of select="/ProductDetail/BuyNowText" disable-output-escaping="yes"></xsl:value-of></a></div>
                            <div class="contact">
                                <div id="shareProduct"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="zensa-san-pham-ct-2 zensa-section">
            <div class="container">
                <div class="main-nav">
                    <xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="ProductAttributes1"></xsl:apply-templates>
                </div>
                <div class="main-content">
                    <xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="ProductAttributes2"></xsl:apply-templates>
                </div>
            </div>
        </section>
        <section class="zensa-san-pham-ct-3 zensa-section">
            <div class="container">
                <div class="background" setBackground="/Data/Sites/1/media/sanpham/bg-4.png">
                    <div class="zensa-title text-center">
                        <h2><xsl:value-of select="/ProductDetail/ProductsOfTheSameTypeText" disable-output-escaping="yes"></xsl:value-of></h2>
                    </div>
                    <div class="main-item">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <xsl:apply-templates select="/ProductDetail/ProductOther"></xsl:apply-templates>
                                
                            </div>
                        </div>
                        <div class="main-button">
                            <div class="button-prev"><em class="lnr lnr-chevron-left"></em></div>
                            <div class="button-next"><em class="lnr lnr-chevron-right"></em></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="ProductImages">
        <div class="swiper-slide">
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
        </div>
    </xsl:template>
    <xsl:template match="ProductAttributes" mode="ProductAttributes1">
        <div class="item">
            <xsl:if test="position()=1">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">item active</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="data-tab">
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </div>
    </xsl:template>
    <xsl:template match="ProductAttributes" mode="ProductAttributes2">
        <div class="content-item">
            <xsl:if test="position()=1">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">content-item active</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="data-content">
                    <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <div class="full-content">
                <xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="ProductOther">
        <div class="swiper-slide">
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
                    </div></a>
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
                                <xsl:text disable-output-escaping="yes">tel: 1900 8054</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="target">
                                <xsl:value-of select="Target"></xsl:value-of>
                            </xsl:attribute>
                            <em class="mdi mdi-cart"></em>
                            <xsl:value-of select="/ProductDetail/BuyNowText" disable-output-escaping="yes"></xsl:value-of>
                        </a>
                    </div>
                </figcaption>
            </figure>
        </div>
    </xsl:template>
</xsl:stylesheet>