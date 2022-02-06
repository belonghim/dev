<%@page contentType="text/html; charset=UTF-8" import="java.util.Random,java.security.SecureRandom"%>
<%!
Random m_rnd;
public String generateAlphanumeric(int length) throws Exception {
  if ( m_rnd == null ) {
    m_rnd = new SecureRandom();
  }
  char[] ach = new char[length];
  int CCH_SRC = 75;
  for (int i = 0; i < length; i++) {
    char ch;
    do {
      ch = (char)(m_rnd.nextInt() % 75 + 48);
    } while (!Character.isLetterOrDigit(ch));
    ach[i] = ch;
  } 
  return new String(ach);
}
%>
<%
String KB = (String)request.getParameter("KB");
int a = 250;
if(KB != null && ! KB.equals("") ){
	try {
		a = Integer.parseInt(KB);
	} catch(NumberFormatException e) {
		System.err.println("Argument " + KB + " must be an integer. The KB's default value is " + a + ".");
	}
}
long startT = System.currentTimeMillis();
String dummy = generateAlphanumeric(a*1024);
out.println("generateAlpha("+a+"KB) Duration : "+(System.currentTimeMillis()-startT)+" ms<BR>");
startT = System.currentTimeMillis();
session.setAttribute("alphanumeric", dummy);
out.println("Session.setAttr("+a+"KB) Duration : "+(System.currentTimeMillis()-startT)+" ms<BR>");
%>