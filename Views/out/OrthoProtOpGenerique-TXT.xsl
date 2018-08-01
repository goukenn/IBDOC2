	<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:stp="http://www.stpierre-bru.be" version="1.0" exclude-result-prefixes="fo">
		<xsl:import href="http://sp1051:8080/include/template2016-copytravail/xsl-txt/call-template_stp_xsltxt.xsl"></xsl:import>
		<xsl:include href="http://sp1051:8080/include/template2016-copytravail/template2016/xsl-txt/style-page_xsltxt.xsl"></xsl:include>
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
								<xsl:call-template name="ConcernezoneInfopatient"></xsl:call-template>
							</fo:block>
							<!--  ................................ -->
							<!--  DEBUT ZONE TEXT -->
							<!--  ................................ -->
							<fo:block>
								<!--   DEBUT Zone contenu  -->
								<!--  Codes INAMI -->
								<xsl:value-of select="//lblParametresINAMI/@unformattedLabel" />
								<xsl:if test="//txtParametresINAMI/text() != ''">
									<!--  text content ? 1 -->
									<xsl:variable name="tcount" select="count(//txtParametresINAMI[text() != ''])"></xsl:variable>
									<xsl:for-each select="//txtParametresINAMI[text() != '']">
										<xsl:if test="(position()>1 ) and (($tcount ) >position())">
											<xsl:text> , </xsl:text>
										</xsl:if>
										<xsl:if test="(position()>1 ) and (($tcount ) = position())">
											<xsl:text> et </xsl:text>
										</xsl:if>
										<xsl:value-of select="current()/text()" />
									</xsl:for-each>
								</xsl:if>
								<!--   -->
								<xsl:value-of select="//lblConc/@unformattedLabel" />
								<xsl:if test="//txtConc/text() != ''">
									<!--  text content ? 1 -->
									<xsl:variable name="tcount" select="count(//txtConc[text() != ''])"></xsl:variable>
									<xsl:for-each select="//txtConc[text() != '']">
										<xsl:if test="(position()>1 ) and (($tcount ) >position())">
											<xsl:text> , </xsl:text>
										</xsl:if>
										<xsl:if test="(position()>1 ) and (($tcount ) = position())">
											<xsl:text> et </xsl:text>
										</xsl:if>
										<xsl:value-of select="current()/text()" />
									</xsl:for-each>
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
								<fo:block>
									<xsl:call-template name="copie_courrier"></xsl:call-template>
								</fo:block>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:template>
	</xsl:stylesheet>
