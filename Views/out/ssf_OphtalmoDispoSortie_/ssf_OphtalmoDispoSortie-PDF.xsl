<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:stp="http://www.stpierre-bru.be" version="1.0" exclude-result-prefixes="fo">
	<!--  version: 1.0 -->
	<!--  TXT StyleSheet -->
	<!--  Author: CBO -->
	<!--  Date:2018/05/15 -->
	<!--  bForm :ssf_OphtalmoDispoSortie -->
	<xsl:import href="http://sp1051:8080/include/template2016-copietravail/master-page.xsl"></xsl:import>
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
			<!--  START GENERATE CONTENT -->
			<!--  Phrase startlblpsDispSortieM1 -->
			<xsl:if test="(//txtgerDispoSortieDoc/text() != '') and (//list/chkgsrDispoSortieDoc[text()='on']) or (//list/chkgsDispoInNumber[text()='on'] or //txtDispoInNumber/text() != '' or //list/drdgeDatePeriod[text()='on']) or (//list/chkgsDispoSortieAt[text()='on']) or (//list/chkgsrDispoSortieRealisation[text()='on'] or //list/chkphrChoixOctMac[text()='on'] or //txtpeDispoSortieFree/text() != '') or (//list/chkDispSortieEnConsulation[text()='on'])">
				<fo:block xsl:use-attribute-sets="dossier17.pLigne">
					<!--  Le patient sera revu -->
					<fo:block xsl:use-attribute-sets="dossier17.pLigne">
						<xsl:value-of select="//lblpsDispSortieM1/@unformattedLabel" />
					</fo:block>
					<xsl:text>&#x20;</xsl:text>
					<xsl:if test="//list/chkDispSortieEnConsulation[text()='on']">
						<xsl:variable name="tcount" select="count(//list/chkDispSortieEnConsulation[text()='on'])"></xsl:variable>
						<xsl:for-each select="//list/chkDispSortieEnConsulation[text()='on']">
							<xsl:if test="(position() > 1) and (position() = $tcount)"> et </xsl:if>
							<xsl:if test="(position() > 1) and ($tcount > 1) and ($tcount > position() )">, </xsl:if>
							<xsl:value-of select="current()/@unformattedLabel" />
						</xsl:for-each>
					</xsl:if>
					<!--  GROUP START CHKGSRDISPOSORTIEREALISATION -->
					<xsl:if test="(//txtgerDispoSortieDoc/text() != '') and (//list/chkgsrDispoSortieDoc[text()='on']) or (//list/chkgsDispoInNumber[text()='on'] or //txtDispoInNumber/text() != '' or //list/drdgeDatePeriod[text()='on']) or (//list/chkgsDispoSortieAt[text()='on']) or (//list/chkgsrDispoSortieRealisation[text()='on'] or //list/chkphrChoixOctMac[text()='on'] or //txtpeDispoSortieFree/text() != '')">
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:if test="//list/chkgsrDispoSortieRealisation[text()='on']">
								<xsl:variable name="tcount" select="count(//list/chkgsrDispoSortieRealisation[text()='on'])"></xsl:variable>
								<xsl:for-each select="//list/chkgsrDispoSortieRealisation[text()='on']">
									<xsl:if test="(position() > 1) and (position() = $tcount)"> et </xsl:if>
									<xsl:if test="(position() > 1) and ($tcount > 1) and ($tcount > position() )">, </xsl:if>
									<xsl:value-of select="current()/@unformattedLabel" />
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="//list/chkphrChoixOctMac[text()='on']">
								<fo:block xsl:use-attribute-sets="dossier17.pParag">
									<xsl:value-of select="//list/chkphrChoixOctMac[text()='on']/@unformattedLabel" />
								</fo:block>
							</xsl:if>
							<!--  GROUP START CHKGSRDISPOSORTIEDOC -->
							<xsl:if test="(//txtgerDispoSortieDoc/text() != '') and (//list/chkgsrDispoSortieDoc[text()='on'])">
								<fo:block xsl:use-attribute-sets="dossier17.pParag">
									<xsl:if test="//list/chkgsrDispoSortieDoc[text()='on']">
										<!--  chez le Docteur -->
										<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
											<xsl:value-of select="//list/chkgsrDispoSortieDoc[text()='on']/@unformattedLabel" />
										</fo:inline>
									</xsl:if>
									<xsl:if test="//txtgerDispoSortieDoc/text() != ''">
										<!--  text content  -->
										<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
											<xsl:value-of select="//txtgerDispoSortieDoc/text()" />
										</fo:block>
									</xsl:if>
								</fo:block>
							</xsl:if>
							<!--  END GROUP -->
							<!--  GROUP START CHKGSDISPOINNUMBER -->
							<xsl:if test="//list/chkgsDispoInNumber[text()='on'] or //txtDispoInNumber/text() != '' or //list/drdgeDatePeriod[text()='on']">
								<fo:block xsl:use-attribute-sets="dossier17.pParag">
									<xsl:if test="//list/chkgsDispoInNumber[text()='on']">
										<!--  dans -->
										<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
											<xsl:value-of select="//list/chkgsDispoInNumber[text()='on']/@unformattedLabel" />
										</fo:inline>
									</xsl:if>
									<xsl:if test="//txtDispoInNumber/text() != ''">
										<!--  text content  -->
										<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
											<xsl:value-of select="//txtDispoInNumber/text()" />
										</fo:block>
									</xsl:if>
									<xsl:if test="//list/drdgeDatePeriod[text()='on']">
										<fo:block xsl:use-attribute-sets="dossier17.pParag">
											<xsl:value-of select="//list/drdgeDatePeriod[text()='on']/@unformattedLabel" />
										</fo:block>
									</xsl:if>
								</fo:block>
							</xsl:if>
							<!--  END GROUP -->
							<!--  GROUP START CHKGSDISPOSORTIEAT -->
							<xsl:if test="//list/chkgsDispoSortieAt[text()='on']">
								<fo:block xsl:use-attribute-sets="dossier17.pParag">
									<!--  le -->
									<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
										<xsl:value-of select="//list/chkgsDispoSortieAt[text()='on']/@unformattedLabel" />
									</fo:inline>
									<xsl:value-of select="//dategeDispoSoriteAt/text()" />
								</fo:block>
							</xsl:if>
							<!--  END GROUP -->
							<xsl:if test="//txtpeDispoSortieFree/text() != ''">
								<!--  text content  -->
								<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
									<xsl:value-of select="//txtpeDispoSortieFree/text()" />
								</fo:block>
							</xsl:if>
						</fo:inline>
					</xsl:if>
					<!--  END GROUP -->
				</fo:block>
			</xsl:if>
			<!--  END GROUP -->
			<!--  END GENERATE CONTENT -->
			<!--  START Politesse -->
			<xsl:if test="//chkIsCourrier[text()='on']">
				<xsl:call-template name="PolitesseCourrierFin"></xsl:call-template>
				<xsl:call-template name="SignGradeGeneriqueInitialise"></xsl:call-template>
			</xsl:if>
			<!--  END Politesse -->
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
