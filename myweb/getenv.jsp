<%@page import="java.util.Map"%>
<%!
Map <String, String> map = System.getenv();
%>
<%
for (Map.Entry <String, String> entry: map.entrySet()) {
 out.println(entry.getKey() + " : " + entry.getValue() + " <BR>");
}
%>
