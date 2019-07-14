<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:query var="binding" dataSource="jdbc/serviceMapper">
    select facet.hub, facet.path
    from ctsa_services.facet,ctsa_services.binding,ctsa_services.facet as foo
    where binding.cd2h_fid = ?::int
      and foo.fid = binding.cd2h_fid
      and hub_fid = facet.fid
    order by 1,2
    <sql:param>${param.fid}</sql:param>
</sql:query>
<ul style="list-style-type: square; margin-left: 15px;">
	<c:forEach items="${binding.rows}" var="rw" varStatus="rowCounter">
		<li>${rw.hub}: <i>${rw.path}</i>
	</c:forEach>
</ul>
