<%@ page import="org.optimizationBenchmarking.utils.text.ESimpleDateFormat" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.application.ApplicationTool" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.utils.Menu" %>
<p class="footerInfo">
Version&nbsp;<%=ApplicationTool.getInstance().getProjectVersion()%>. Server&nbsp;time:&nbsp;<%= ESimpleDateFormat.DATE_TIME.formatNow() %>.
</p>
<p class="footerLinks"> 
[<a href="http://optimizationBenchmarking.github.io/">group page</a>] &bull;
[<a href="https://github.com/optimizationBenchmarking/">GitHub page</a>] &bull;
[<a href="http://optimizationbenchmarking.github.io/atom.xml">atom feed</a>] &bull;
[<a href="http://optimizationbenchmarking.github.io/rss.xml">RSS feed</a>]
</p></section>
<aside id="sidebar">
<% Menu.renderMenu(request, out); %>
<div class="asideBottom">
<div class="logo"><a href="http://iao.hfuu.edu.cn"><img src="/images/iaoLogo.png" style="width:140px;height:122px;" /></a></div>
<div class="logo"><a href="http://www.hfuu.edu.cn"><img src="/images/hfuuLogo.png" style="width:140px;height:140px;" /></a></div>
<div class="logo"><a href="http://www.ustc.edu.cn"><img src="/images/ustcLogo.png" style="width:140px;height:140px;" /></a></div>
<div class="support">
Developed at the <a href="http://iao.hfuu.edu.cn">Institute of Applied Optimization</a> of
the Faculty of Computer Science and Technology of
the <a href="http://www.hfuu.edu.cn">Hefei University</a>
and
the University of Science and Technology of China (<a href="http://www.ustc.edu.cn/">USTC</a>).
Supported by NSFC Project 61673359 and the Fundamental Research Funds for the Central Universities.
</div></div>
</aside>
</div></div></body></html>