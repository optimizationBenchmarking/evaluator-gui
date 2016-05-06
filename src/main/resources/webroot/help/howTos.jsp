<%@include file="/includes/defaultHeader.jsp" %>
<%@ page import="org.optimizationBenchmarking.documentation.examples.ExampleJobBuilderBase" %>
<%@ page import="org.optimizationBenchmarking.evaluator.Evaluator" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.utils.files.EFSElementType" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.utils.Encoder" %>
<%@ page import="org.optimizationBenchmarking.utils.text.textOutput.ITextOutput" %>
<%@ page import="org.optimizationBenchmarking.evaluator.gui.controller.ControllerUtils" %>
<jsp:useBean id="controller" scope="session" class="org.optimizationBenchmarking.evaluator.gui.controller.Controller" />
<h1>How-Tos</h1>
<% final ITextOutput encoded = Encoder.htmlEncode(out); %>

<p>Here we provide a set of basic How-To guides.</p>
<ul>
<li><a href="#example">How do I download an example (and evaluate its data)?</a></li>
<li><a href="#upload">How do I load my experiment data into the program?</a></li>
</ul>

<h2 id="example">How do I download an example (and evaluate its data)?</h2>
<p>Here we discuss how you can download and example from the online
<a href="<%=ExampleJobBuilderBase.DEFAULT_BASE_URI%>">example repository</a>
and to run the corresponding evaluation procedure.</p>

<div style="text-align:center">
<a href="../images/example_1.png"><img src="../images/example_1.png" width="31%" /></a>
<a href="../images/example_2.png"><img src="../images/example_2.png" width="31%" /></a>
<a href="../images/example_3.png"><img src="../images/example_3.png" width="31%" /></a>
<a href="../images/example_4.png"><img src="../images/example_4.png" width="31%" /></a>
<a href="../images/example_5.png"><img src="../images/example_5.png" width="31%" /></a>
</div>

<ol>
<li>Click the <a href="../demo.jsp">examples</a> menu button.</li>

<li>This takes you to the list of examples available in the 
<a href="<%=ExampleJobBuilderBase.DEFAULT_BASE_URI%>">example repository</a>
that are suitable for version (<%=Evaluator.getInstance().getProjectVersion()%>)
of the evaluator component in this GUI. This list is automatically loaded from
the internet whenever you open the <a href="../demo.jsp">examples menu</a>
and therefore <em>a)</em>&nbsp;requires an internet collection and 
<em>b)</em>&nbsp;may change often.</li>

<li>Choose an example and click the corresponding <code>OK</code> button. This will
download and install the example into a corresponding folder inside the current
directory. In order to keep your stuff tidy, you may thus consider to first
create/change into a new directory in the <a href="../controller.jsp">control center</a>.
</li> 

<li>Anyway, after clicking <code>OK</code>, the example download will automatically begin.
You are taken to the <a href="../controller.jsp">control center</a> and will be
informed about the download progress (according to the <a href="../logLevel.jsp">log level</a>
you have chosen).</li>

<li>Eventually, the download will complete and the <a href="../controller.jsp">controll center</a>
shows you a list of files and folders that were installed. Usually, there will be
<ul>
<li>a new <% EFSElementType.FOLDER.putIcon(out, encoded); %>&nbsp;<code>results</code> folder with the experimental data (and meta-data),</li>
<li>one or multiple <% EFSElementType.CONFIGURATION.putIcon(out, encoded); %>&nbsp;configuration files,
which can be used to execute an evaluation process, and</li>
<li>one or multiple <% EFSElementType.EVALUATION.putIcon(out, encoded); %>&nbsp;evaluation files,
which define how the experimental data should be evaluated, i.e., which modules should be applied.</li>
</ul></li>

<li>You can now select (check the box at the right-hand side of) one (or multiple) of the
<% EFSElementType.CONFIGURATION.putIcon(out, encoded); %>&nbsp;configuration file(s) in the file list.</li>

<li>In the drop-down box below the file list, choose <code><%=ControllerUtils.COMMAND_EXECUTE_EVALUATOR%></code> and
press the <code>OK</code>-button. This will start the evaluation process, i.e., a process where the
evaluator is applied to the experiment data and a report is produced. This may take some time.
According to the <a href="../logLevel.jsp">log level</a> you have chosen, you may receive more or less
progress information during that time.</li>

<li>Eventually, this process completes and will be presented with a list of produced files. Depending
on what kind of configuration you have chosen, this list may include a <% EFSElementType.PDF.putIcon(out, encoded); %>&nbsp;<code>report.pdf</code>
or <% EFSElementType.XHTML.putIcon(out, encoded); %>&nbsp;<code>report.xhtml</code> file.
You can directly click these files to view them.</li>

</ol>

<h2 id="upload">How do I load my experiment data into the program?</h2>
<p>There are two ways in which you can load your experiment data into this program.</p>
<h3>Direct Copying of Data</h3>
<p>This program is a client-server application accessed via a web browser. The root data folder
used is <code><%encoded.append(controller.getRootDir());%></code> and the
application runs at <code><%=request.getLocalName()%>:<%=request.getLocalPort()%></code>. In other words, if
your current computer is <code><%=request.getLocalName()%></code> and you have write access to folder
<code><%encoded.append(controller.getRootDir());%></code> (or you have remote write access to that folder on
<code><%=request.getLocalName()%></code>), you can just copy data directly to there.</p>
<h3>Uploading Data</h3>
<p>If you do not have write access to the data folder, you can also upload the data via the
<a href="../controller.jsp">control center</a>.</p>

<div style="text-align:center">
<a href="../images/upload_1.png"><img src="../images/upload_1.png" width="31%" /></a>
<a href="../images/upload_2.png"><img src="../images/upload_2.png" width="31%" /></a>
<a href="../images/upload_3.png"><img src="../images/upload_3.png" width="31%" /></a>
<a href="../images/upload_4.png"><img src="../images/upload_4.png" width="31%" /></a>
<a href="../images/upload_5.png"><img src="../images/upload_5.png" width="31%" /></a>
<a href="../images/upload_6.png"><img src="../images/upload_6.png" width="31%" /></a>
<a href="../images/upload_7.png"><img src="../images/upload_7.png" width="31%" /></a>
</div>

<ol>
<li>Go into the <a href="../controller.jsp">control center</a></li>
<li>Choose a name for your example data's root directory and create this directory by <code>cd</code>-ing into it. The corresponding controls are in the "Path" section of the control center.</li>
<li>In order to upload files, you first need to click the <code>Browse&hellip;</code> button under the <code>cd</code> controls in the control center.</li>
<li>A dialog will pop up which allows you to select one or multiple files for upload. If you select a <code>zip</code> archive, it will automatically be unpacked during the upload. Anyway, choose your files and press <code>Open</code>.</li>
<li>You will automatically return the control center. Next to the <code>Browse&hellip;</code> button, you will now either see the name of the selected file or the number of selected files.</li>
<li>Click the <code>Upload</code>-button. Your files will be uploaded into the application (into your new folder inside <code><%encoded.append(controller.getRootDir());%></code> on <%=request.getLocalName()%>), and <code>zip</code> archives will automatically be unpacked</code>.
<li>A word of advice: It may be a good idea to structure your data into folders:
<ul>
<li>Usually, I would recommend to put all the experimental results into a folder named <code>results</code>.</li>
<li>This folder should contain one folder for each algorithm setup, i.e., for each experiment that you have run, named accordingly.</li>
<li>These folders, in turn, should contain one folder for each benchmark instance (again named accordingly).</li>
<li>Finally, inside of these folders, there should be one log file per experimental run of the algorithm setup on the benchmark instance.</li>
</ul>
This way, you have your data sorted nicely and then can provide meta-information in a way that our system can read.</li>
</ol>

<%@include file="/includes/defaultFooter.jsp" %>