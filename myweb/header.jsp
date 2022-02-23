<%
java.util.Enumeration en = request.getHeaderNames();
while(en.hasMoreElements()){
  String name = (String)en.nextElement();
  out.println("Header " + name+" : "+request.getHeader(name)+" <br>");
}
out.println(application.getSessionCookieConfig().getName());
%>
