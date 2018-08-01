	<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:stp="http://www.stpierre-bru.be" version="1.0" exclude-result-prefixes="fo">
		<xsl:attribute-set name="dossier17.pParag"></xsl:attribute-set>
		<xsl:attribute-set name="dossier17.pLigne"></xsl:attribute-set>
		<xsl:attribute-set name="dossier17.Titre1">
			<xsl:attribute name="font-size">12pt</xsl:attribute>
			<xsl:attribute name="font-weight">bold</xsl:attribute>
			<xsl:attribute name="text-decoration">underline</xsl:attribute>
			<xsl:attribute name="padding-bottom">2pt</xsl:attribute>
		</xsl:attribute-set>
		<xsl:attribute-set name="dossier.p"></xsl:attribute-set>
		<xsl:attribute-set name="dossier17.Titre2"></xsl:attribute-set>
		<xsl:attribute-set name="dossier17.Titre3"></xsl:attribute-set>
		<xsl:attribute-set name="dossier17.Titre4"></xsl:attribute-set>
		<xsl:attribute-set name="dossier17.Titre5"></xsl:attribute-set>
		<xsl:attribute-set name="dossier17.Titre6"></xsl:attribute-set>
		<xsl:variable name="SpecialiteComposant" select="//specialitecomposant/text()"></xsl:variable>
		<xsl:variable name="ConversionTable" select="'http://sp1051:8080/include/template2016-copytravail/conversion_spelogotitres.xml'"></xsl:variable>
		<xsl:variable name="NoteDate" select="/*/@noteDate"></xsl:variable>
		<xsl:variable name="Sexe" select="/*/@patSex"></xsl:variable>
		<!--  VARIABLES NOM, PRENOM, INTRO, ETC -->
		<xsl:variable name="CourrierIntroVarM">
			<!--  TEXTE D'INTRO MASCULIN -->
		</xsl:variable>
		<xsl:variable name="CourrierIntroVarF">
			<!--  TEXTE D'INTRO FEMININ -->
		</xsl:variable>
		<xsl:template match="/">
			<fo:root>
				<fo:layout-master-set>
					<fo:simple-page-master master-name="simple" page-height="49.7cm" page-width="21cm">
						<fo:region-body></fo:region-body>
					</fo:simple-page-master>
				</fo:layout-master-set>
				<fo:page-sequence master-reference="simple">
					<fo:flow flow-name="xsl-region-body">
						<xsl:call-template name="dossier"></xsl:call-template>
					</fo:flow>
				</fo:page-sequence>
			</fo:root>
		</xsl:template>
		<xsl:template name="dossier">
			<fo:table table-layout="fixed" width="100%" font-family="Courier" font-size="7.3pt" line-height="10.5pt">
				<fo:table-column column-width="15cm"></fo:table-column>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block white-space-collapse="false" wrap-option="no-wrap">
								<xsl:text>CHU Saint-Pierre - UCM Sint-Pieter</xsl:text>
							</fo:block>
							<fo:block white-space-collapse="false" wrap-option="no-wrap">
								<xsl:text>Rue Haute, 322, Hoogstraat</xsl:text>
							</fo:block>
							<fo:block white-space-collapse="false" wrap-option="no-wrap">
								<xsl:text>1000 Brussel - Tèl.: 02 535 31 11</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block white-space-collapse="false" wrap-option="no-wrap">
								<xsl:text>&#x20;</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block white-space-collapse="false" wrap-option="no-wrap">
								<xsl:text>&#x20;</xsl:text>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block white-space-collapse="false" wrap-option="no-wrap">
								<xsl:text>&#x20;</xsl:text>
							</fo:block>
							<fo:block>
								<xsl:text>ConcerneZonePatient</xsl:text>
							</fo:block>
							<!--  ................................ -->
							<!--  DEBUT ZONE TEXT -->
							<!--  ................................ -->
							<fo:block>
								<!--   DEBUT Zone contenu  -->
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
									<xsl:value-of select="//list/chkbexe2017[text()='on']/@unformattedLabel" />
								</xsl:if>
								<!--   FIN Zone contenu  -->
							</fo:block>
							<!--  FIN ZONE TEXT -->
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:table table-layout="fixed" width="100%" font-family="Courier" font-size="7.3pt" line-height="10.5pt">
				<fo:table-column column-width="15cm"></fo:table-column>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<fo:block>ConcerneZoneCopieCourrier</fo:block>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:template>
	</xsl:stylesheet>
