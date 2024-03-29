<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) 2016-2023 Zerocracy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to read
the Software only. Permissions is hereby NOT GRANTED to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
  <xsl:include href="../templates.xsl"/>
  <xsl:template match="/">
    <html lang="en">
      <body>
        <section>
          <h1>People</h1>
          <xsl:apply-templates select="people"/>
        </section>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="people">
    <p>
      <xsl:text>The full list of </xsl:text>
      <xsl:value-of select="count(person)"/>
      <xsl:text> people we know:</xsl:text>
    </p>
    <table data-sortable="true">
      <thead>
        <tr>
          <th>
            <xsl:text>ID</xsl:text>
          </th>
          <th>
            <xsl:text>Rate</xsl:text>
          </th>
          <th>
            <xsl:text>Mentor</xsl:text>
          </th>
          <th>
            <xsl:text>Details</xsl:text>
          </th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="person"/>
      </tbody>
    </table>
  </xsl:template>
  <xsl:template match="person">
    <tr>
      <xsl:attribute name="style">
        <xsl:if test="vacation/text() = 'true'">
          <xsl:text>opacity:0.5;</xsl:text>
        </xsl:if>
      </xsl:attribute>
      <td>
        <xsl:call-template name="user">
          <xsl:with-param name="id" select="@id"/>
        </xsl:call-template>
      </td>
      <td>
        <xsl:value-of select="rate"/>
      </td>
      <td>
        <xsl:call-template name="user">
          <xsl:with-param name="id" select="mentor"/>
        </xsl:call-template>
      </td>
      <td>
        <xsl:text>Wallet: </xsl:text>
        <xsl:choose>
          <xsl:when test="wallet">
            <xsl:value-of select="wallet/@bank"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="wallet"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>—</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>; Identity: </xsl:text>
        <xsl:apply-templates select="details"/>
        <xsl:text>; Links: </xsl:text>
        <xsl:apply-templates select="links"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="links">
    <xsl:for-each select="link">
      <xsl:if test="position() &gt; 1">
        <xsl:text>, </xsl:text>
      </xsl:if>
      <code>
        <xsl:value-of select="@rel"/>
      </code>
      <xsl:text>:</xsl:text>
      <code>
        <xsl:value-of select="@href"/>
      </code>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
