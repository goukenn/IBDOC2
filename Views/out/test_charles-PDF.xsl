<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:stp="http://www.stpierre-bru.be" version="1.0" exclude-result-prefixes="fo">
	<xsl:import href="http://sp1051:8080/include/template2016-copytravail/master-page.xsl"></xsl:import>
	<!--  Variables -->
	<xsl:variable name="CourrierIntroVarM">
		<!--  TEXTE D'INTRO MASCULIN -->
	</xsl:variable>
	<xsl:variable name="CourrierIntroVarF">
		<!--  TEXTE D'INTRO FEMININ -->
	</xsl:variable>
	<!--  FIN VARIABLES POUR LA PHRASE D'INTRO -->
	<xsl:template match="/">
		<xsl:call-template name="callRootTemplateCourrierNoteStandard"></xsl:call-template>
	</xsl:template>
	<xsl:template name="dossier">
		<fo:block xsl:use-attribute-sets="dossier.body">
			<xsl:choose>
				<xsl:when test="//chkIsCourrier[text()='on']">
					<xsl:call-template name="TextIntroCourrier"></xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<fo:block xsl:use-attribute-sets="dossier17.pLigne">
						<xsl:choose>
							<xsl:when test="$Sexe='f'">
								<xsl:value-of select="$CourrierIntroVarF" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$CourrierIntroVarM" />
							</xsl:otherwise>
						</xsl:choose>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
			<!--  Main Content -->
			<fo:block xsl:use-attribute-sets="dossier.p">
				<xsl:choose>
					<xsl:when test="$Sexe='f'">
						<xsl:text>Mme. </xsl:text>
						<xsl:value-of select="/*/@patLastName" />
						<xsl:text>&#x20;</xsl:text>
						<xsl:value-of select="/*/@patFirstName" />
						<xsl:text>&#x20;</xsl:text>
						<xsl:text>, née le </xsl:text>
						<xsl:call-template name="afficheDate">
							<xsl:with-param select="/*/@patBirthDate" name="datetxt" />
						</xsl:call-template>
						<xsl:text>&#x20;</xsl:text>
						<xsl:text>a été hospitalisée en Opthamologie du </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>M. </xsl:text>
						<xsl:value-of select="/*/@patLastName" />
						<xsl:text>&#x20;</xsl:text>
						<xsl:value-of select="/*/@patFirstName" />
						<xsl:text>&#x20;</xsl:text>
						<xsl:text>, né le </xsl:text>
						<xsl:call-template name="afficheDate">
							<xsl:with-param select="/*/@patBirthDate" name="datetxt" />
						</xsl:call-template>
						<xsl:text>&#x20;</xsl:text>
						<xsl:text>a été hospitalisé en Opthamologie du </xsl:text>
						<xsl:value-of select="//dateFrom/text()" />
						<xsl:text> au </xsl:text>
						<xsl:value-of select="//dateTo/text()" />
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<!--   Start generate content  -->
			<!--  Titres N1 à 6 -->
			<fo:block xsl:use-attribute-sets="dossier17.pLigne">
				<xsl:value-of select="//lblbTitresStyles/@unformattedLabel" />
			</fo:block>
			<!--  Titre niveau 1 -->
			<fo:block xsl:use-attribute-sets="dossier17.pLigne dossier17.Titre1">
				<xsl:value-of select="//lblTitreN1/@unformattedLabel" />
			</fo:block>
			<xsl:if test="//txtTitreN1/text() != ''">
				<!--  text content ? is array =   -->
				<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
					<xsl:value-of select="//txtTitreN1/text()" />
				</fo:block>
			</xsl:if>
			<!--  Titre niveau 2 -->
			<fo:block xsl:use-attribute-sets="dossier17.pLigne dossier17.Titre2">
				<xsl:value-of select="//lblTitreN2/@unformattedLabel" />
			</fo:block>
			<xsl:if test="//txtTitreN2/text() != ''">
				<!--  text content ? is array =   -->
				<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
					<xsl:value-of select="//txtTitreN2/text()" />
				</fo:block>
			</xsl:if>
			<!--  Titre niveau 3 -->
			<fo:block xsl:use-attribute-sets="dossier17.pLigne dossier17.Titre3">
				<xsl:value-of select="//lblTitreN3/@unformattedLabel" />
			</fo:block>
			<xsl:if test="//txtTitreN3/text() != ''">
				<!--  text content ? is array =   -->
				<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
					<xsl:value-of select="//txtTitreN3/text()" />
				</fo:block>
			</xsl:if>
			<!--  Titre niveau 4 -->
			<fo:block xsl:use-attribute-sets="dossier17.pLigne dossier17.Titre4">
				<xsl:value-of select="//lblTitreN4/@unformattedLabel" />
			</fo:block>
			<xsl:if test="//txtTitreN4/text() != ''">
				<!--  text content ? is array =   -->
				<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
					<xsl:value-of select="//txtTitreN4/text()" />
				</fo:block>
			</xsl:if>
			<!--  Titre niveau 5 -->
			<fo:block xsl:use-attribute-sets="dossier17.pLigne">
				<xsl:value-of select="//lblTitreN5/@unformattedLabel" />
			</fo:block>
			<xsl:if test="//txtTitreN5/text() != ''">
				<!--  text content ? is array =   -->
				<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
					<xsl:value-of select="//txtTitreN5/text()" />
				</fo:block>
			</xsl:if>
			<!--  Titre niveau 6 -->
			<fo:block xsl:use-attribute-sets="dossier17.pLigne dossier17.Titre6">
				<xsl:value-of select="//lblTitreN6/@unformattedLabel" />
			</fo:block>
			<xsl:if test="//txtTitreN6/text() != ''">
				<!--  text content ? is array =   -->
				<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
					<xsl:value-of select="//txtTitreN6/text()" />
				</fo:block>
			</xsl:if>
			<xsl:if test="//list/chkbexe2017[text()='on']">
				<!--  Exemple contenu titres -->
				<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
					<xsl:value-of select="//list/chkbexe2017[text()='on']/@unformattedLabel" />
				</fo:inline>
			</xsl:if>
			<!--   End generate content  -->
			<!--  START Politesse -->
			<xsl:if test="//chkIsCourrier[text()='on']">
				<xsl:call-template name="PolitesseCourrierFin"></xsl:call-template>
				<xsl:call-template name="SignGradeGeneriqueInitialise"></xsl:call-template>
			</xsl:if>
			<!--  END Politesse -->
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
