<main xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:stp="http://www.stpierre-bru.be" exclude-result-prefixes="fo" version="1.0">
	<xsl:variable name="ssf_OphtalmoDispoSortie" select="//subreport[@name='ssf_OphtalmoDispoSortie'])"></xsl:variable>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblIntro_1/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//dateFrom/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblTo_1/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//dateTo/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblMotifAdmission/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtAdminission/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtAdminission/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblAntecedents/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblProblemesMedicaux/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtProblemesMedicaux/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtProblemesMedicaux/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblAntecedFamil/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtAntecedFamil/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtAntecedFamil/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblVaccins/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtVaccins/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtVaccins/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtAntecedents/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtAntecedents/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblTraitement/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtTraitementDom2/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtTraitementDom2/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblAllergies/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtAllergies/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtAllergies/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblModeVie/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblExamOph/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lbleoAcVisuel/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblright/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtavright/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtavright/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblinfright/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblleft/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtavleft/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtavleft/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lbleoLF/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblright_1/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtright/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtright/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblleft_1/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtlfleft/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtlfleft/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lbleoFo/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblright_2/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtforight/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtforight/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblleft_2/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtfoleft/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtfoleft/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lbleoTi/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblright_3/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtnum_2_1/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtnum_2_1/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblsep_2_1/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtNumDiv_2_1/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtNumDiv_2_1/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblmess_2_1/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblleft_3/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtnum_2/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtnum_2/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblsep_2/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtNumDiv_2/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtNumDiv_2/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblmess_2/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblEneuro/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtExamNeuro/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtExamNeuro/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtEophOther/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtEophOther/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtEoOtherValue/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtEoOtherValue/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtExamOph/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtExamOph/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtTitre1/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtTitre1/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtOtherLib_1/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtOtherLib_1/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtExamComF/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtExamComF/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblInterventionTitle/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblIm1/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//dateInterventionStart/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblIm2/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtInterventionMsg/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtInterventionMsg/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtInterventionFreeText/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtInterventionFreeText/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblEvotionEnSalle/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtEvolutionEnSalle/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtEvolutionEnSalle/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblTrait/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtTraitement_1/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtTraitement_1/text()" />
		</fo:block>
	</xsl:if>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblDispoSortieTitle/@unformattedLabel" />
	</fo:block>
	<fo:block xsl:use-attribute-sets="dossier.p">
		<xsl:value-of select="//lblDispSortieM1/@unformattedLabel" />
	</fo:block>
	<xsl:if test="//txtDispoSortieFree/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtDispoSortieFree/text()" />
		</fo:block>
	</xsl:if>
	<xsl:if test="//txtDispoSortieText/text() != ''">
		<fo:block xsl:use-attribute-sets="dossier.p" linefeed-treatment="preserve">
			<xsl:value-of select="//txtDispoSortieText/text()" />
		</fo:block>
	</xsl:if>
</main>
