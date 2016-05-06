<%@ page import="org.optimizationBenchmarking.evaluator.gui.controller.Handle" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.utils.Encoder" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.controller.ControllerUtils" %>
<%@ page import="org.optimizationBenchmarking.utils.collections.lists.ArrayListView" %>
<%@ page import="org.optimizationBenchmarking.documentation.examples.Example" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.modules.Demo" %>
<%@ page import="org.optimizationBenchmarking.evaluator.Evaluator" %>
<jsp:useBean id="controller" scope="session" class="org.optimizationBenchmarking.evaluator.gui.controller.Controller" />
<%@include file="/includes/defaultHeader.jsp" %>
<h1>Example Data</h1>
<p>In order to get started with out tool suite, you may consider downloading
some example data and running some example evaluation processes. We host a
couple of examples in our <a href="">GitHub Example Repository</a>. We will
now check which of these examples are supported by the evaluator component
(version <%= Evaluator.getInstance().getProjectVersion() %>) of this GUI.</p>
<%
ArrayListView<Example> examples = null;
try(final Handle handle = controller.createJspHandle(pageContext)) {  
  examples = Demo.getExamples(handle);
}
if(examples != null) {
final String currentDir = Encoder.htmlEncode(controller.getRootDir().relativize(controller.getCurrentDir()).toString());
final String printDir   = ('/' + currentDir);  %>
<p>If you want, you can now pick any of the <%= examples.size() %> examples and download them into the current folder (<code><%=printDir%></code>).
After the download, this folder will contain a new folder named after the example. If this folder already exists,
the result may be unpredictable, so be careful. Also, sometimes there may be sporadic network errors
when downloading an example, say HTTP 503 error codes. In such a case, just try downloading the example again
a few minutes later.</p>
<% for(Example example : examples) { %>
<h2><%= example.getName()%></h2> 
<%= example.getDescription() %>
<p>Downloading the example will create a folder named <code><%= example.getId() %></code> inside <code><%=printDir%></code>.</p>
<form method="get" action="/controller.jsp">
<input type="hidden" name="<%=ControllerUtils.PARAMETER_DEMO%>" value="<%= example.getId() %>" />
<input type="hidden" name="<%=ControllerUtils.INPUT_CURRENT_DIR%>" value="<%=currentDir%>" />
<input type="hidden" name="<%=ControllerUtils.PARAMETER_WITH_SELECTED%>" value="<%=ControllerUtils.COMMAND_INSTALL_DEMO%>" />
Download the example data into folder <code><%=printDir%><% if(printDir.charAt(printDir.length()-1)!='/'){%>/<%}%><%=example.getId()%></code>:&nbsp;<input type="submit" name="<%=ControllerUtils.INPUT_SUBMIT%>" value="<%=ControllerUtils.BUTTON_OK%>" />
</form>
<% } } %>
<%@include file="/includes/defaultFooter.jsp" %>