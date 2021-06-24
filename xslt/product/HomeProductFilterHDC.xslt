<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <section class="zensa-home-4">
            <div class="container">
                <div class="background" setBackground="/Data/Sites/1/media/home/bg-4.png">
                    <div class="zensa-title text-center">
                        <h2><xsl:value-of select="/ProductFilter/ModuleTitle" disable-output-escaping="yes"></xsl:value-of></h2>
                    </div>
                    <div class="main-item">
                        <div class="row">
                            <div class="col-md-7 col-lg-6 col-xl-5">
                                <div class="main-filter">
                                    <xsl:apply-templates select='/ProductFilter/Group'></xsl:apply-templates>
                                    <div class="form-group frm-submit"><a href="#"><xsl:value-of select="/ProductFilter/FindProductsText" disable-output-escaping="yes"></xsl:value-of><em class="mdi mdi-arrow-right"></em></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="Group">
        <div class="form-group">
            <label><xsl:value-of select="Title"></xsl:value-of></label>
            <select>
                <xsl:choose>
                    <xsl:when test="GroupId = '6'">
                        <xsl:apply-templates select='Option'></xsl:apply-templates>  
                    </xsl:when>
                    <xsl:when test="GroupId = '7'">
                        <xsl:apply-templates select='Option'></xsl:apply-templates>  
                    </xsl:when>
                    <xsl:when test="GroupId = '11'">
                        <option value ="0"><xsl:value-of select="/ProductFilter/PleaseChooseText" disable-output-escaping="yes"></xsl:value-of></option>
                        <xsl:apply-templates select='Option'></xsl:apply-templates>  
                    </xsl:when>
                    <xsl:when test="GroupId = '9'">
                        <option value ="0"><xsl:value-of select="/ProductFilter/PleaseChooseText" disable-output-escaping="yes"></xsl:value-of></option>
                        <xsl:apply-templates select='Option'></xsl:apply-templates>  
                    </xsl:when>
                    <xsl:when test="GroupId = '10'">
                        <option value ="0"><xsl:value-of select="/ProductFilter/PleaseChooseText" disable-output-escaping="yes"></xsl:value-of></option>
                        <xsl:apply-templates select='Option'></xsl:apply-templates>  
                    </xsl:when>
                </xsl:choose>
            </select>
        </div>
    </xsl:template>
    <xsl:template match="Option">
        <option>
            <xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
            <xsl:attribute name="value">
                <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="Title"></xsl:value-of>
        </option>
    </xsl:template>
</xsl:stylesheet>