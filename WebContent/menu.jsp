<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id=leftCol>
	<br>
	<h3><a href="<util:applicationRoot/>/index.jsp">Home</a></h3>
	<h3>Taxonomy</h3>
	<ul>
		<sql:query var="taxo" dataSource="jdbc/serviceMapper">
            select taxonomy
            from ctsa_services.taxonomy
            order by 1;
        </sql:query>
		<c:forEach items="${taxo.rows}" var="row" varStatus="rowCounter">
			<li><a href="<util:applicationRoot/>/taxonomy/taxonomy.jsp?hub=${row.taxonomy}">Browse/Edit	${row.taxonomy}</a>
		</c:forEach>
        <li><a href="<util:applicationRoot/>/taxonomy/taxonomy_create.jsp">Create a new taxonomy</a>
    </ul>
	<h3>Mapping</h3>
	<ul>
		<li>coming soon...
	</ul>
</div>
