<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:stp="http://www.stpierre-bru.be" version="1.0" exclude-result-prefixes="fo">
	<xsl:import href="http://sp1051:8080/include/template2016/master-page.xsl"></xsl:import>
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
			<!--  Group start lblgsMotifAdmission -->
			<xsl:if test="//txtgerAdminission/text() != '' and (//list/radAffichAtcdFam[text()='on'])">
				<fo:block xsl:use-attribute-sets="dossier17.pParag">
					<!--  Motif d&apos;adminission -->
					<fo:inline xsl:use-attribute-sets="dossier17.pLigne dossier17.Titre1">
						<xsl:value-of select="//lblgsMotifAdmission/@unformattedLabel" />
					</fo:inline>
					<xsl:if test="//list/radAffichAtcdFam[text()='on']">
						<fo:block xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/radAffichAtcdFam[text()='on']/@unformattedLabel" />
						</fo:block>
					</xsl:if>
					<xsl:if test="//txtgerAdminission/text() != ''">
						<!--  text content -->
						<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
							<xsl:value-of select="//txtgerAdminission/text()" />
						</fo:block>
					</xsl:if>
				</fo:block>
			</xsl:if>
			<!--  End GROUP -->
			<!--  Group start lblgsDispSortieM1 -->
			<xsl:if test="//list/chkDispSortieEnConsulation[text()='on'] or //list/chkDispoSortieRealisation[text()='on'] or //list/chkChoixOctMac[text()='on'] or //list/chkChoixOctPap[text()='on'] or //list/chkChoixChampsVisuel[text()='on'] or //list/chklpChoixOctMac[text()='on'] or //list/chkChoixFluoAngioraphie[text()='on'] or //list/chkChoixICG[text()='on'] or //txtChoixAutre/text() != '' or //list/chkDispoSortieDoc[text()='on'] or //txtDispoSortieDoc/text() != '' or //list/chkDispoSortieAt[text()='on'] or //txtgeDispoSortieFree/text() != ''">
				<fo:block xsl:use-attribute-sets="dossier17.pParag">
					<!--  Le patient sera revu -->
					<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
						<xsl:value-of select="//lblgsDispSortieM1/@unformattedLabel" />
					</fo:inline>
					<xsl:if test="//list/chkDispSortieEnConsulation[text()='on']">
						<!--  en consultation -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkDispSortieEnConsulation[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:if test="//list/chkDispoSortieRealisation[text()='on']">
						<!--  pour la réalisation -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkDispoSortieRealisation[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:if test="//list/chkChoixOctMac[text()='on']">
						<!--  d'un OCT maculaire -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkChoixOctMac[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:if test="//list/chkChoixOctPap[text()='on']">
						<!--  d'un OCT papillaire -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkChoixOctPap[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:if test="//list/chkChoixChampsVisuel[text()='on']">
						<!--  de champs visuels -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkChoixChampsVisuel[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:if test="//list/chklpChoixOctMac[text()='on']">
						<xsl:variable name="tcount" select="count(//list/chklpChoixOctMac[text()='on'])"></xsl:variable>
						<xsl:for-each select="//list/chklpChoixOctMac[text()='on']">
							<xsl:if test="($tcount > 1) and (position() = $tcount)"> et </xsl:if>
							<xsl:if test="($tcount > 1) and ($tcount > position() )"> , </xsl:if>
							<xsl:value-of select="current/@unformattedLabel" />
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="//list/chkChoixFluoAngioraphie[text()='on']">
						<!--  d'une fluo-angiographie -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkChoixFluoAngioraphie[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:if test="//list/chkChoixICG[text()='on']">
						<!--  d'un ICG -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkChoixICG[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:if test="//txtChoixAutre/text() != ''">
						<!--  text content -->
						<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
							<xsl:value-of select="//txtChoixAutre/text()" />
						</fo:block>
					</xsl:if>
					<xsl:if test="//list/chkDispoSortieDoc[text()='on']">
						<!--  chez le Docteur -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkDispoSortieDoc[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:if test="//txtDispoSortieDoc/text() != ''">
						<!--  text content -->
						<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
							<xsl:value-of select="//txtDispoSortieDoc/text()" />
						</fo:block>
					</xsl:if>
					<!--  Group start chkgsiDispoInNumber -->
					<xsl:if test="//txtirDispoInNumber/text() != '' and (//list/chkgsiDispoInNumber[text()='on'] or //list/drdgeiDatePeriod[text()='on'])">
						<fo:block xsl:use-attribute-sets="dossier17.pParag">
							<xsl:if test="//list/chkgsiDispoInNumber[text()='on']">
								<!--  dans -->
								<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
									<xsl:value-of select="//list/chkgsiDispoInNumber[text()='on']/@unformattedLabel" />
								</fo:inline>
							</xsl:if>
							<xsl:if test="//txtirDispoInNumber/text() != ''">
								<!--  text content -->
								<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
									<xsl:value-of select="//txtirDispoInNumber/text()" />
								</fo:inline>
							</xsl:if>
							<xsl:if test="//list/drdgeiDatePeriod[text()='on']">
								<!--  jours -->
								<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
									<xsl:value-of select="//list/drdgeiDatePeriod[text()='on']/@unformattedLabel" />
								</fo:inline>
							</xsl:if>
						</fo:block>
					</xsl:if>
					<!--  End GROUP -->
					<xsl:if test="//list/chkDispoSortieAt[text()='on']">
						<!--  le -->
						<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
							<xsl:value-of select="//list/chkDispoSortieAt[text()='on']/@unformattedLabel" />
						</fo:inline>
					</xsl:if>
					<xsl:call-template name="afficheDate">
						<xsl:with-param select="//dateDispoSoriteAt/text()" name="datetxt" />
					</xsl:call-template>
					<xsl:if test="//txtgeDispoSortieFree/text() != ''">
						<!--  text content -->
						<fo:block xsl:use-attribute-sets="dossier17.pParag" linefeed-treatment="preserve">
							<xsl:value-of select="//txtgeDispoSortieFree/text()" />
						</fo:block>
					</xsl:if>
				</fo:block>
			</xsl:if>
			<!--  End GROUP -->
			<!--   End generate content  -->
			<!--  START Politesse -->
			<xsl:if test="//chkIsCourrier[text()='on']">
				<xsl:call-template name="PolitesseCourrierFin"></xsl:call-template>
				<xsl:call-template name="Ophtalmo3BlockSignature"></xsl:call-template>
			</xsl:if>
			<!--  END Politesse -->
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
