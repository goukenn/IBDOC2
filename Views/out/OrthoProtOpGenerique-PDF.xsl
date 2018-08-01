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
			<!--  Codes INAMI -->
			<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
				<xsl:value-of select="//lblParametresINAMI/@unformattedLabel" />
			</fo:inline>
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
			<fo:inline xsl:use-attribute-sets="dossier17.pLigne">
				<xsl:value-of select="//lblConc/@unformattedLabel" />
			</fo:inline>
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
