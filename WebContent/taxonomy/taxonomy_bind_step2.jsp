<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>serviceMapper 1.0</title>
<style type="text/css" media="all">
@import "<util:applicationRoot/>/resources/style.css";
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div id="content"><jsp:include page="/header.jsp" flush="true" />
		<jsp:include page="/menu.jsp" flush="true"><jsp:param
				name="caller" value="research" /></jsp:include><div id="centerCol">
        <sql:query var="source" dataSource="jdbc/serviceMapper">
            select hub, path
            from ctsa_services.facet
            where fid = ?::int
            <sql:param>${param.fid}</sql:param>
        </sql:query>
        <c:forEach items="${source.rows}" var="row" varStatus="rowCounter">
             <h3>Select service node to bind to  ${row.hub}: ${row.path}.</h3>
       </c:forEach>

    <form action="taxonomy_bind.jsp">
        <input type="hidden" id="cfid" name="cfid" value="${param.fid}">
        <sql:query var="target" dataSource="jdbc/serviceMapper">
            select hub from ctsa_services.facet
            where not exists (select hub_fid from ctsa_services.binding,ctsa_services.facet as foo where foo.hub=facet.hub and cd2h_fid=?::int and foo.fid=binding.hub_fid and foo.hub = ?)
            and not exists (select hub from ctsa_services.binding_suppression where cd2h_fid=?::int and facet.hub=binding_suppression.hub)
            and not exists (select taxonomy from ctsa_services.taxonomy where taxonomy.taxonomy =  facet.hub)
            limit 1
            <sql:param>${param.fid}</sql:param>
            <sql:param>${param.hub}</sql:param>
            <sql:param>${param.fid}</sql:param>
        </sql:query>
        <c:forEach items="${target.rows}" var="row" varStatus="rowCounter">
             <h3>CTSA Hub: ${row.hub}. <a href="taxonomy_suppress.jsp?hub=${row.hub}&fid=${param.fid}"><i class="fa fa-times" style="font-size:15px;color:red"></i></a> <input type="submit" value="Bind" /></h3>
            <jsp:include page="node_step2.jsp" flush="true">
             <jsp:param value="${param.hub}" name="cd2h_hub"/>
             <jsp:param value="${param.fid}" name="fid"/>
             <jsp:param value="${row.hub}" name="hub"/>
            </jsp:include>
       </c:forEach>
    </form>
			<jsp:include page="/footer.jsp" flush="true" /></div>
	</div>
</body>
</html>

