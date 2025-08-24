<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Import all modular stylesheets -->
    <xsl:import href="xsl/layout.xsl"/>
    <xsl:import href="xsl/pages/post-index.xsl"/>
    <xsl:import href="xsl/pages/post.xsl"/>
    <xsl:import href="xsl/pages/about.xsl"/>
    <xsl:import href="xsl/components/post-components.xsl"/>
    <xsl:import href="xsl/components/data-table.xsl"/>
    <xsl:import href="xsl/components/taxonomy.xsl"/>
    <xsl:import href="xsl/components/mixed-content.xsl"/>
    <xsl:import href="xsl/components/about-components.xsl"/>

    <!--
    The main rendering logic. This template will override the
    generic <xsl:apply-templates select="mainContent"/> in layout.xsl
    due to import precedence.
    -->
    <xsl:template match="mainContent">
        <xsl:choose>
            <xsl:when test="/page/@type='post-index'">
                <xsl:apply-templates select="." mode="post-index"/>
            </xsl:when>
            <xsl:when test="/page/@type='post'">
                <xsl:apply-templates select="." mode="post"/>
            </xsl:when>
            <xsl:when test="/page/@type='about'">
                <xsl:apply-templates select="." mode="about"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="node()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>