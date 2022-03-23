<%@ page import="java.lang.Thread" %>
hi~~ i am cpu_overload.jsp
<%
long sum = 0L;
for(int i=0; i<100000; i++)
{
 for(int j=0; j<10000000; j++) sum += j;
 try{
  Thread.sleep(10);
 }
 catch(Exception e){
  e.printStackTrace();
 }
}
out.println(sum);
System.out.println(sum);
%>
