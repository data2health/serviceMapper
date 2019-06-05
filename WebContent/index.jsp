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
</head>
<body>
	<div id="content"><jsp:include page="/header.jsp" flush="true" />
		<jsp:include page="/menu.jsp" flush="true"><jsp:param
				name="caller" value="research" /></jsp:include>
		<div id="centerCol">
			Initial deployment of an app supporting creation of a taxonomy of services provided by CTSA hubs.

			<div id="contentBlock">
				<div id="contentBlock2">
					<h2>CTSA Hubs with a Service Taxonomy</h2>
					<p>Click on a link to browse/edit</p>
                    <sql:query var="schemas" dataSource="jdbc/serviceMapper">
                        select distinct domain from web.site where domain in (select hub from ctsa_services.facet_base) order by 1;
                    </sql:query>
                    <ol class="bulletedList">
                    <c:forEach items="${schemas.rows}" var="row">
                       <li><a href="taxonomy/taxonomy.jsp?hub=${row.domain}">${row.domain}</a>
                    </c:forEach>
                    </ol>
				</div>
				<div id="contentBlock2">
					<h2>CTSA Hubs needing a Service Taxonomy</h2>
                    <p>Click on a link to create</p>
					<sql:query var="schemas" dataSource="jdbc/serviceMapper">
                        select distinct domain from web.site where domain not in (select hub from ctsa_services.facet_base) order by 1;
                    </sql:query>
                    <ol class="bulletedList">
					<c:forEach items="${schemas.rows}" var="row">
                       <li><a href="taxonomy/taxonomy.jsp?hub=${row.domain}">${row.domain}</a>
					</c:forEach>
					</ol>
				</div>
			</div>
			<jsp:include page="/footer.jsp" flush="true" />
		</div>
	</div>
</body>
</html>

