	<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:stp="http://www.stpierre-bru.be" version="1.0" exclude-result-prefixes="fo">
		<!--  version: 1.0 -->
		<!--  TXT StyleSheet -->
		<!--  Author: CBO -->
		<!--  Date:2018/05/15 -->
		<!--  bForm :ssf_OphtalmoDispoSortie -->
		<xsl:import href="http://sp1051:8080/include/template2016-copietravail/xsl-txt/call-template_stp_xsltxt.xsl"></xsl:import>
		<xsl:include href="http://sp1051:8080/include/template2016-copietravail/xsl-txt/style-page_xsltxt.xsl"></xsl:include>
		<xsl:variable name="SpecialiteComposant" select="//specialitecomposant/text()"></xsl:variable>
		<xsl:variable name="ConversionTable" select="'http://sp1051:8080/include/template2016-copietravail/conversion_spelogotitres.xml'"></xsl:variable>
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
								<!--  PHRASE START : lblpsDispSortieM1 -->
								<xsl:if test="(//list/chkDispSortieEnConsulation[text()='on']) or ((//list/chkgsrDispoSortieRealisation[text()='on']) and (//list/chkphrChoixOctMac[text()='on' and @value != 6] or //txtlcChoixAutre/text() != '')) or //list/chkgsrDispoSortieDoc[text()='on'] and //txtgerDispoSortieDoc/text() != '' or (//list/chkgsrDispoInNumber[text()='on'] and //txtrDispoInNumber/text() != '' and //list/drdgerDatePeriod[text()='on']) or (//list/chkgsDispoSortieAt[text()='on'])">
									<fo:block xsl:use-attribute-sets="dossier17.pLigne">
										<!--  Le patient sera revu -->
										<xsl:value-of select="//lblpsDispSortieM1/@unformattedLabel" />
										<xsl:if test="//list/chkDispSortieEnConsulation[text()='on']">
											<!--  en consultation -->
											<xsl:text>&#x20;</xsl:text>
											<xsl:value-of select="//list/chkDispSortieEnConsulation[text()='on']/@unformattedLabel" />
										</xsl:if>
										<!--  GROUP START CHKGSRDISPOSORTIEREALISATION -->
										<xsl:if test="((//list/chkgsrDispoSortieRealisation[text()='on']) and (//list/chkphrChoixOctMac[text()='on' and @value != 6] or //txtlcChoixAutre/text() != '')) or //list/chkgsrDispoSortieDoc[text()='on'] and //txtgerDispoSortieDoc/text() != '' or (//list/chkgsrDispoInNumber[text()='on'] and //txtrDispoInNumber/text() != '' and //list/drdgerDatePeriod[text()='on']) or (//list/chkgsDispoSortieAt[text()='on'])">
											<xsl:if test="//list/chkgsrDispoSortieRealisation[text()='on']">
												<!--  pour la réalisation -->
												<xsl:text>&#x20;</xsl:text>
												<xsl:value-of select="//list/chkgsrDispoSortieRealisation[text()='on']/@unformattedLabel" />
											</xsl:if>
											<xsl:if test="//list/chkphrChoixOctMac[text()='on']">
												<xsl:text>&#x20;</xsl:text>
												<xsl:variable name="tcount" select="count(//list/chkphrChoixOctMac[text()='on' and @value != 6])"></xsl:variable>
												<xsl:variable name="appendAnd" select="count(//txtlcChoixAutre)=0 or (//txtlcChoixAutre[text()=''] and ($tcount>1))"></xsl:variable>
												<xsl:for-each select="//list/chkphrChoixOctMac[text()='on' and @value != 6]">
													<xsl:if test="(position() > 1) and $appendAnd and (position() = $tcount)"> et </xsl:if>
													<xsl:if test="(position() > 1) and (($appendAnd=false) or ($tcount != position()))">, </xsl:if>
													<xsl:value-of select="current()/@unformattedLabel" />
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="//txtlcChoixAutre/text() != ''">
												<!--  text content  -->
												<xsl:variable name="lcount" select="count(//list/chkphrChoixOctMac[text()='on' and @value != 6])"></xsl:variable>
												<xsl:if test="$lcount > 0">
													<xsl:text> et </xsl:text>
												</xsl:if>
												<xsl:text>&#x20;</xsl:text>
												<xsl:value-of select="//txtlcChoixAutre/text()" />
											</xsl:if>
											<!--  GROUP START CHKGSRDISPOSORTIEDOC -->
											<xsl:if test="//list/chkgsrDispoSortieDoc[text()='on'] and //txtgerDispoSortieDoc/text() != ''">
												<xsl:if test="//list/chkgsrDispoSortieDoc[text()='on']">
													<!--  chez le Docteur -->
													<xsl:text>&#x20;</xsl:text>
													<xsl:value-of select="//list/chkgsrDispoSortieDoc[text()='on']/@unformattedLabel" />
												</xsl:if>
												<xsl:if test="//txtgerDispoSortieDoc/text() != ''">
													<!--  text content  -->
													<xsl:text>&#x20;</xsl:text>
													<xsl:value-of select="//txtgerDispoSortieDoc/text()" />
												</xsl:if>
											</xsl:if>
											<!--  END GROUP -->
											<!--  GROUP START CHKGSRDISPOINNUMBER -->
											<xsl:if test="//list/chkgsrDispoInNumber[text()='on'] and //txtrDispoInNumber/text() != '' and //list/drdgerDatePeriod[text()='on']">
												<xsl:if test="//list/chkgsrDispoInNumber[text()='on']">
													<!--  dans -->
													<xsl:text>&#x20;</xsl:text>
													<xsl:value-of select="//list/chkgsrDispoInNumber[text()='on']/@unformattedLabel" />
												</xsl:if>
												<xsl:if test="//txtrDispoInNumber/text() != ''">
													<!--  text content  -->
													<xsl:text>&#x20;</xsl:text>
													<xsl:value-of select="//txtrDispoInNumber/text()" />
												</xsl:if>
												<xsl:if test="//list/drdgerDatePeriod[text()='on']">
													<!--  jours -->
													<xsl:text>&#x20;</xsl:text>
													<xsl:value-of select="//list/drdgerDatePeriod[text()='on']/@unformattedLabel" />
												</xsl:if>
											</xsl:if>
											<!--  END GROUP -->
											<!--  GROUP START CHKGSDISPOSORTIEAT -->
											<xsl:if test="//list/chkgsDispoSortieAt[text()='on']">
												<!--  le -->
												<xsl:text>&#x20;</xsl:text>
												<xsl:value-of select="//list/chkgsDispoSortieAt[text()='on']/@unformattedLabel" />
												<xsl:text>&#x20;</xsl:text>
												<xsl:value-of select="//dategeDispoSoriteAt/text()" />
											</xsl:if>
											<!--  END GROUP -->
										</xsl:if>
										<!--  END GROUP -->
										<xsl:text>.</xsl:text>
									</fo:block>
								</xsl:if>
								<!--  END GROUP -->
								<xsl:if test="//txtDispoSortieFree/text() != ''">
									<!--  text content  -->
									<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
										<xsl:value-of select="//txtDispoSortieFree/text()" />
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
