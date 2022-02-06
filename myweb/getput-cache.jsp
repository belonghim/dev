<%@ page contentType="text/html; charset=KSC5601" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="org.infinispan.client.hotrod.configuration.ConfigurationBuilder"%>
<%@page import="org.infinispan.client.hotrod.RemoteCacheManager"%>
<%@page import="org.infinispan.client.hotrod.RemoteCache"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%!
  ConfigurationBuilder clientBuilder;
  RemoteCacheManager remoteCacheManager;
  RemoteCache remoteCache;
%>
<%

  SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss:SSS");
  String TEST_CACHE = "mycache";
  String SERVER_HOST = System.getProperty("datagrid_host","jboss-datagrid.datagrid-test");
  String current_time = dateFormat.format(new Date(System.currentTimeMillis()));
  out.println("<b>HostName</b> : " + System.getenv("HOSTNAME") + "<BR>");
  out.println("sessionID : " + session.getId()+"<BR>");
  out.println("current_time : " + current_time+"<BR>");

if ( remoteCacheManager == null ) {
  clientBuilder = new ConfigurationBuilder();
  clientBuilder.addServer().host(SERVER_HOST);
  remoteCacheManager = new RemoteCacheManager(clientBuilder.build());
}
if (remoteCache == null) {
	remoteCache = remoteCacheManager.getCache(TEST_CACHE);
}

  out.println("<br> "+TEST_CACHE+" Get Value : " + (String)remoteCache.get(session.getId()));
  remoteCache.put(session.getId(), current_time);
  out.println("<br> "+TEST_CACHE+" Put Value : " + current_time);
%>

