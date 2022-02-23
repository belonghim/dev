<%
java.util.Enumeration en = request.getHeaderNames();
while(en.hasMoreElements()){
  String name = (String)en.nextElement();
  out.println("Header " + name+" : "+request.getHeader(name)+" <br>");
}
out.println("<b>HostName</b> : "+System.getenv("HOSTNAME")+" <BR>");
out.println("<b>"+application.getSessionCookieConfig().getName()+"</b> : "+session.getId() + " <BR>");
en = session.getAttributeNames();
while( en.hasMoreElements() ) {
  String att0 = (String)en.nextElement();
  out.println("Session Attribute : " + att0 + " - " + session.getAttribute(att0)+" <br>");
}
/*en = application.getAttributeNames();
while( en.hasMoreElements() ) {
  String att0 = (String)en.nextElement();
  out.println("Context Attribute : " + att0 + " - " + application.getAttribute(att0)+" <br>");
}*/
%>
