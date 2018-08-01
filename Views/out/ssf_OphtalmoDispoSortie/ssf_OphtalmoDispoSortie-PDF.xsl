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
			<!--  PHRASE START : lblpsDispSortieM1 -->
			<xsl:if test="(//list/chkDispSortieEnConsulation[text()='on']) or ((//list/chkgsrDispoSortieRealisation[text()='on']) and (//list/chkphrChoixOctMac[text()='on' and @value != 6] or //txtlcChoixAutre/text() != '')) or //list/chkgsrDispoSortieDoc[text()='on'] and //txtgerDispoSortieDoc/text() != '' or (//list/chkgsrDispoInNumber[text()='on'] and //txtrDispoInNumber/text() != '' and //list/drdgerDatePeriod[text()='on']) or (//list/chkgsDispoSortieAt[text()='on'])">
				<fo:block xsl:use-attribute-sets="dossier17.pLigne">
					<!--  Le patient sera revu -->
					<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
						<xsl:value-of select="//lblpsDispSortieM1/@unformattedLabel" />
					</fo:inline>
					<xsl:if test="//list/chkDispSortieEnConsulation[text()='on']">
						<!--  en consultation -->
						<xsl:text>&#x20;</xsl:text>
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkDispSortieEnConsulation[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<!--  GROUP START CHKGSRDISPOSORTIEREALISATION -->
					<xsl:if test="((//list/chkgsrDispoSortieRealisation[text()='on']) and (//list/chkphrChoixOctMac[text()='on' and @value != 6] or //txtlcChoixAutre/text() != '')) or //list/chkgsrDispoSortieDoc[text()='on'] and //txtgerDispoSortieDoc/text() != '' or (//list/chkgsrDispoInNumber[text()='on'] and //txtrDispoInNumber/text() != '' and //list/drdgerDatePeriod[text()='on']) or (//list/chkgsDispoSortieAt[text()='on'])">
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:if test="//list/chkgsrDispoSortieRealisation[text()='on']">
								<!--  pour la réalisation -->
								<xsl:text>&#x20;</xsl:text>
								<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
									<xsl:value-of select="//list/chkgsrDispoSortieRealisation[text()='on']/@unformattedLabel" />
								</fo:inline>
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
								<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
									<xsl:value-of select="//txtlcChoixAutre/text()" />
								</fo:inline>
							</xsl:if>
							<!--  GROUP START CHKGSRDISPOSORTIEDOC -->
							<xsl:if test="//list/chkgsrDispoSortieDoc[text()='on'] and //txtgerDispoSortieDoc/text() != ''">
								<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
									<xsl:if test="//list/chkgsrDispoSortieDoc[text()='on']">
										<!--  chez le Docteur -->
										<xsl:text>&#x20;</xsl:text>
										<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
											<xsl:value-of select="//list/chkgsrDispoSortieDoc[text()='on']/@unformattedLabel" />
										</fo:inline>
									</xsl:if>
									<xsl:if test="//txtgerDispoSortieDoc/text() != ''">
										<!--  text content  -->
										<xsl:text>&#x20;</xsl:text>
										<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
											<xsl:value-of select="//txtgerDispoSortieDoc/text()" />
										</fo:inline>
									</xsl:if>
								</fo:inline>
							</xsl:if>
							<!--  END GROUP -->
							<!--  GROUP START CHKGSRDISPOINNUMBER -->
							<xsl:if test="//list/chkgsrDispoInNumber[text()='on'] and //txtrDispoInNumber/text() != '' and //list/drdgerDatePeriod[text()='on']">
								<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
									<xsl:if test="//list/chkgsrDispoInNumber[text()='on']">
										<!--  dans -->
										<xsl:text>&#x20;</xsl:text>
										<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
											<xsl:value-of select="//list/chkgsrDispoInNumber[text()='on']/@unformattedLabel" />
										</fo:inline>
									</xsl:if>
									<xsl:if test="//txtrDispoInNumber/text() != ''">
										<!--  text content  -->
										<xsl:text>&#x20;</xsl:text>
										<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
											<xsl:value-of select="//txtrDispoInNumber/text()" />
										</fo:inline>
									</xsl:if>
									<xsl:if test="//list/drdgerDatePeriod[text()='on']">
										<!--  jours -->
										<xsl:text>&#x20;</xsl:text>
										<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
											<xsl:value-of select="//list/drdgerDatePeriod[text()='on']/@unformattedLabel" />
										</fo:inline>
									</xsl:if>
								</fo:inline>
							</xsl:if>
							<!--  END GROUP -->
							<!--  GROUP START CHKGSDISPOSORTIEAT -->
							<xsl:if test="//list/chkgsDispoSortieAt[text()='on']">
								<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
									<!--  le -->
									<xsl:text>&#x20;</xsl:text>
									<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
										<xsl:value-of select="//list/chkgsDispoSortieAt[text()='on']/@unformattedLabel" />
									</fo:inline>
									<xsl:text>&#x20;</xsl:text>
									<xsl:value-of select="//dategeDispoSoriteAt/text()" />
								</fo:inline>
							</xsl:if>
							<!--  END GROUP -->
						</fo:inline>
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
