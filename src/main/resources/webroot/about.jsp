<%@include file="/includes/defaultHeader.jsp" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.application.ApplicationTool" %>
<%@ page import="org.optimizationBenchmarking.evaluator.Evaluator" %>
<jsp:useBean id="controller" scope="session" class="org.optimizationBenchmarking.evaluator.gui.controller.Controller" />
<h1>About</h1>
<p>
This is the graphical user interface (<a href="https://github.com/optimizationBenchmarking/evaluator-gui">GUI</a>) of
the <a href="https://github.com/optimizationBenchmarking/evaluator-evaluator">evaluator</a> core project.
</p>
<table class="invisibleL">
<tr class="invisibleL"><td colspan="2" class="invisibleL"><h2>Server Information</h2></td></tr>
<tr class="invisibleL"><th class="invisibleL">Server&nbsp;Name:</th><td class="invisibleL"><code><%=request.getLocalName()%></code></td></tr>
<tr class="invisibleL"><th class="invisibleL">Server&nbsp;Address:</th><td class="invisibleL"><code><%=request.getLocalAddr()%></code></td></tr>
<tr class="invisibleL"><th class="invisibleL">Server&nbsp;Port:</th><td class="invisibleL"><code><%=request.getLocalPort()%></code></td></tr>
<tr class="invisibleL"><th class="invisibleL">Your&nbsp;Computer's&nbsp;Name:</th><td class="invisibleL"><code><%=request.getRemoteHost()%></code></td></tr>
<tr class="invisibleL"><th class="invisibleL">Your&nbsp;Computer's&nbsp;Address:</th><td class="invisibleL"><code><%=request.getRemoteAddr()%></code></td></tr>
<tr class="invisibleL"><th class="invisibleL">Your&nbsp;Computer's&nbsp;Port:</th><td class="invisibleL"><code><%=request.getRemotePort()%></code></td></tr>
<tr class="invisibleL"><td colspan="2" class="invisibleL"><h2>Version</h2></td></tr>
<tr class="invisibleL"><td colspan="2" class="invisibleL">This software has the following components:</td></tr>
<tr class="invisibleL"><td colspan="2" class="invisibleL"><h3>GUI</h3></td></tr>
<% ApplicationTool app = ApplicationTool.getInstance(); %>
<tr class="invisibleL"><th class="invisibleL">name:&nbsp;</th><td class="invisibleL"><%= app.getProjectName()%></td></tr>
<tr class="invisibleL"><th class="invisibleL">version:&nbsp;</th><td class="invisibleL"><%= app.getProjectVersion()%></td></tr>
<tr class="invisibleL"><th class="invisibleL">required JDK:&nbsp;</th><td class="invisibleL"><%= app.getProjectJDK()%></td></tr>
<tr class="invisibleL"><th class="invisibleL">url:&nbsp;</th><td class="invisibleL"><a href="<%= app.getProjectURL()%>"><%= app.getProjectURL()%></a></td></tr>
<tr class="invisibleL"><th class="invisibleL">contact&nbsp;name:&nbsp;</th><td class="invisibleL"><%= app.getContactName()%></a></td></tr>
<tr class="invisibleL"><th class="invisibleL">contact&nbsp;url:&nbsp;</th><td class="invisibleL"><a href="<%= app.getContactURL()%>"><%= app.getContactURL()%></a></td></tr>
<tr class="invisibleL"><th class="invisibleL">contact&nbsp;email:&nbsp;</th><td class="invisibleL"><a href="mailto:<%= app.getContactEmail()%>"><%= app.getContactEmail()%></a></td></tr>
<tr class="invisibleL"><td colspan="2" class="invisibleL"><h3>Evaluator Core</h3></td></tr>
<% Evaluator ev = Evaluator.getInstance(); %>
<tr class="invisibleL"><th class="invisibleL">name:&nbsp;</th><td class="invisibleL"><%= ev.getProjectName()%></td></tr>
<tr class="invisibleL"><th class="invisibleL">version:&nbsp;</th><td class="invisibleL"><%= ev.getProjectVersion()%></td></tr>
<tr class="invisibleL"><th class="invisibleL">required JDK:&nbsp;</th><td class="invisibleL"><%= ev.getProjectJDK()%></td></tr>
<tr class="invisibleL"><th class="invisibleL">url:&nbsp;</th><td class="invisibleL"><a href="<%= ev.getProjectURL()%>"><%= ev.getProjectURL()%></a></td></tr>
<tr class="invisibleL"><th class="invisibleL">contact&nbsp;name:&nbsp;</th><td class="invisibleL"><%= ev.getContactName()%></a></td></tr>
<tr class="invisibleL"><th class="invisibleL">contact&nbsp;url:&nbsp;</th><td class="invisibleL"><a href="<%= ev.getContactURL()%>"><%= ev.getContactURL()%></a></td></tr>
<tr class="invisibleL"><th class="invisibleL">contact&nbsp;email:&nbsp;</th><td class="invisibleL"><a href="mailto:<%= ev.getContactEmail()%>"><%= ev.getContactEmail()%></a></td></tr>
</table>
<p><a href="/this">Here</a> you can download a copy of the <code>jar</code> of
this software you are using right now, but it is recommended to
download the most recent <a href="https://github.com/optimizationBenchmarking/evaluator-gui/releases">release</a>.</p>
<h2>Web</h2>
<p>This project is developed by the <a href="http://www.optimizationbenchmarking.org">optimizationBenchmarking</a>
initiative. Our website can be found at <a href="http://www.optimizationbenchmarking.org">http://www.optimizationbenchmarking.org</a>
and <a href="http://www.github.com/optimizationBenchmarking">http://www.github.com/optimizationBenchmarking</a>.
</p><p>The specific website for this software project is <a href="http://optimizationbenchmarking.github.io/">http://optimizationbenchmarking.github.io/</a>.</p>
<p>Our software is GPL-licensed open source, and can be found at <a href="http://www.github.com">GitHub</a> under the following projects:</p>
<ul>
<li><a href="https://github.com/optimizationBenchmarking/evaluator-evaluator">core command-line argument</a></li>
<li><a href="https://github.com/optimizationBenchmarking/evaluator-gui">this GUI</a></li>
<li><a href="https://optimizationBenchmarking.github.io/documentation-examples/">documentation</a></li>
<li>predecessor project: <a href="https://github.com/optimizationBenchmarking/tspSuite">tspSuite</a></li>
</ul>
<h2>Support and Funding</h2>
<p>The main work in this project is conducted by Prof. Dr. Thomas Weise at the
Institute of Applied Optimization (IAO) of the Hefei University
with support from
NSFC Project 61673359 and the Fundamental Research Funds for the Central Universities.
Further
support is provided by the Faculty Strategic Initiatives Research Fund (SIRF) of the
University of Newcastle and Dr. Raymond Chiong.</p>
<h2 id="contact">Contact</h2>
<table class="invisibleL">
<tr class="invisibleL"><th class="invisibleL" colspan="2">Prof. Dr. Thomas Weise</th></tr>
<tr class="invisibleL"><td class="invisibleL" colspan="2">Institute of Applied Optimization (<a href="http://iao.hfuu.edu.cn/">IAO</a>)</td></tr>
<tr class="invisibleL"><td class="invisibleL" colspan="2">Faculty of Computer Science and Technology</td></tr>
<tr class="invisibleL"><td class="invisibleL" colspan="2"><a href="http://www.hfuu.edu.cn">Hefei University</a></td></tr>
<tr class="invisibleL"><td class="invisibleL" colspan="2">South Campus 2, Building 36, Office 324, Jinxiu Dadao 99</td></tr>
<tr class="invisibleL"><td class="invisibleL" colspan="2">Hefei Economic and Technological Development Area</td></tr>
<tr class="invisibleL"><td class="invisibleL" colspan="2">Hefei 230601, Anhui, China</td></tr>
<tr class="invisibleL"><td class="invisibleL">Web:</td><td class="invisibleL">&nbsp;<a href="http://iao.hfuu.edu.cn/">http://iao.hfuu.edu.cn/</a></td></tr>
<tr class="invisibleL"><td class="invisibleL">Email:</td><td class="invisibleL">&nbsp;<a href="mailto:tweise@gmx.de">tweise@gmx.de</a>, <a href="mailto:tweise@hfuu.edu.cn">tweise@hfuu.edu.cn</a></td></tr>
</table>
<%@include file="/includes/defaultFooter.jsp" %>