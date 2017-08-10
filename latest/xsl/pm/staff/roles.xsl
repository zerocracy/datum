<?xml version="1.0" encoding="UTF-8"?>
<!--
 * Copyright (c) 2016-2017 Zerocracy
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to read
 * the Software only. Permissions is hereby NOT GRANTED to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml" version="1.0">
  <xsl:template match="/roles">
    <html lang="en">
      <body>
        <section>
          <h1>Roles and Members</h1>
          <p>
            This is a full list of people and their roles in the
            project. The Architect (ARC) or the Product Owner (PO) are
            allowed to assign roles and resign them. By convention
            we use these role names: ARC (architect), PO (product owner), DEV (developer),
            TST (tester), QA (quality assurance).
            See <a href="http://datum.zerocracy.com/pages/policy.html#13">par.13</a>.
          </p>
          <table>
            <thead>
              <tr>
                <th>
                  <xsl:text>Login</xsl:text>
                </th>
                <th>
                  <xsl:text>Roles</xsl:text>
                </th>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="person"/>
            </tbody>
          </table>
        </section>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="person">
    <tr>
      <td>
        <a href="https://github.com/{@id}">
          <xsl:text>@</xsl:text>
          <xsl:value-of select="@id"/>
        </a>
      </td>
      <td>
        <xsl:for-each select="role">
          <xsl:if test="position() &gt; 1">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:value-of select="text()"/>
        </xsl:for-each>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
