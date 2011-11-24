<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes" />

    <xsl:strip-space elements="*" />

    <xsl:key 
        name="Stock" 
        match="StockSalesRec[@Type='  ']" 
        use="(preceding-sibling::StockSalesRec[@Type='SH'])[last()]/Reference" />

    <xsl:template match="/StockSalesRpt">
        <catalog>
            <xsl:apply-templates select="StockSalesRec[@Type='SH']" />
        </catalog>
    </xsl:template>

    <xsl:template match="StockSalesRec[@Type='SH']">
        <supplier name="{Reference}">
            <xsl:apply-templates select="key('Stock', Reference)" />
        </supplier>
    </xsl:template>

    <xsl:template match="StockSalesRec[@Type='  ']">
        <product>
            <xsl:apply-templates />
        </product>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
