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
								<!--  Le patient sera revu -->
								<fo:block xsl:use-attribute-sets="dossier17.pLigne">
									<xsl:value-of select="//lblpsDispSortieM1/@unformattedLabel" />
								</fo:block>
								<xsl:if test="//list/chkDispSortieEnConsulation[text()='on']">
									<!--  en consultation -->
									<xsl:value-of select="//list/chkDispSortieEnConsulation[text()='on']/@unformattedLabel" />
								</xsl:if>
								<xsl:if test="//list/chkDispoSortieRealisation[text()='on']">
									<!--  pour la réalisation -->
									<xsl:value-of select="//list/chkDispoSortieRealisation[text()='on']/@unformattedLabel" />
								</xsl:if>
								<xsl:if test="//list/chkphChoixOctMac[text()='on']">
									<fo:block xsl:use-attribute-sets="dossier17.pParag">
										<xsl:value-of select="//list/chkphChoixOctMac[text()='on']/@unformattedLabel" />
									</fo:block>
								</xsl:if>
								<xsl:if test="//txtChoixAutre/text() != ''">
									<!--  text content ? is array =   -->
									<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
										<xsl:value-of select="//txtChoixAutre/text()" />
									</fo:block>
								</xsl:if>
								<xsl:if test="//list/chkDispoSortieDoc[text()='on']">
									<!--  chez le Docteur -->
									<xsl:value-of select="//list/chkDispoSortieDoc[text()='on']/@unformattedLabel" />
								</xsl:if>
								<xsl:if test="//txtDispoSortieDoc/text() != ''">
									<!--  text content ? is array =   -->
									<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
										<xsl:value-of select="//txtDispoSortieDoc/text()" />
									</fo:block>
								</xsl:if>
								<xsl:if test="//list/chkDispoInNumber[text()='on']">
									<!--  dans -->
									<xsl:value-of select="//list/chkDispoInNumber[text()='on']/@unformattedLabel" />
								</xsl:if>
								<xsl:if test="//txtDispoInNumber/text() != ''">
									<!--  text content ? is array =   -->
									<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
										<xsl:value-of select="//txtDispoInNumber/text()" />
									</fo:block>
								</xsl:if>
								<xsl:if test="//list/drdDatePeriod[text()='on']">
									<fo:block xsl:use-attribute-sets="dossier17.pParag">
										<xsl:value-of select="//list/drdDatePeriod[text()='on']/@unformattedLabel" />
									</fo:block>
								</xsl:if>
								<xsl:if test="//list/chkDispoSortieAt[text()='on']">
									<!--  le -->
									<xsl:value-of select="//list/chkDispoSortieAt[text()='on']/@unformattedLabel" />
								</xsl:if>
								<xsl:call-template name="afficheDate">
									<xsl:with-param select="//dateDispoSoriteAt/text()" name="datetxt" />
								</xsl:call-template>
								<xsl:if test="//txtpeDispoSortieFree/text() != ''">
									<!--  text content ? is array =   -->
									<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
										<xsl:value-of select="//txtpeDispoSortieFree/text()" />
									</fo:block>
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
