<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:choose>
	<c:when test="${empty param.slot0 and empty param.slot1 and empty param.slot2}">
		<sql:query var="slot0s" dataSource="jdbc/serviceMapper">
			select fid,path,slot0
			from ctsa_services.facet
			where hub = ? and slot0 is not null and slot1 is null
			order by 3;
			<sql:param>${param.hub}</sql:param>
		</sql:query>
		<ol class="bulletedList">
		<c:forEach items="${slot0s.rows}" var="row" varStatus="rowCounter">
				<li><a href="taxonomy_bind_step2.jsp?fid=${row.fid}&hub=${param.hub}">${row.slot0}</a>
				<jsp:include page="node_step1.jsp" flush="true">
					<jsp:param name="hub" value="${param.hub}" />
                    <jsp:param name="slot0" value="${row.slot0}" />
				</jsp:include>
				</li>
		</c:forEach>
		</ol>
	</c:when>
	<c:when test="${not empty param.slot0 and empty param.slot1}">
		<sql:query var="slot1s" dataSource="jdbc/serviceMapper">
			select fid,path,slot1
			from ctsa_services.facet
			where hub = ? and slot0=? and slot1 is not null and slot2 is null
			order by 3;
            <sql:param>${param.hub}</sql:param>
			<sql:param>${param.slot0}</sql:param>
		</sql:query>
		<ol class="bulletedList">
		<c:forEach items="${slot1s.rows}" var="row" varStatus="rowCounter">
				<li><a href="taxonomy_bind_step2.jsp?fid=${row.fid}&hub=${param.hub}">${row.slot1}</a>
 				<jsp:include page="node_step1.jsp" flush="true">
                    <jsp:param name="hub" value="${param.hub}" />
					<jsp:param name="slot0" value="${param.slot0}" />
					<jsp:param name="slot1" value="${row.slot1}" />
				</jsp:include>
				</li>
		</c:forEach>
		</ol>
	</c:when>
	<c:when test="${not empty param.slot0 and not empty param.slot1 and empty param.slot2}">
		<sql:query var="slot2s" dataSource="jdbc/serviceMapper">
			select fid,path,slot2
			from ctsa_services.facet
			where hub = ? and slot0=? and slot1=? and slot2 is not null and slot3 is null
			order by 3;
            <sql:param>${param.hub}</sql:param>
			<sql:param>${param.slot0}</sql:param>
			<sql:param>${param.slot1}</sql:param>
		</sql:query>
		<ol class="bulletedList">
		<c:forEach items="${slot2s.rows}" var="row" varStatus="rowCounter">
				<li><a href="taxonomy_bind_step2.jsp?fid=${row.fid}&hub=${param.hub}">${row.slot2}</a>
                 <jsp:include page="node_step1.jsp" flush="true">
                    <jsp:param name="hub" value="${param.hub}" />
                    <jsp:param name="slot0" value="${param.slot0}" />
                    <jsp:param name="slot1" value="${param.slot1}" />
                    <jsp:param name="slot2" value="${row.slot2}" />
                </jsp:include>
				</li>
		</c:forEach>
		</ol>
	</c:when>
    <c:when test="${not empty param.slot0 and not empty param.slot1 and not empty param.slot2 and empty param.slot3}">
        <sql:query var="slot3s" dataSource="jdbc/serviceMapper">
            select fid,path,slot3
            from ctsa_services.facet
            where hub = ? and slot0=? and slot1=? and slot2=? and slot3 is not null and slot4 is null
            order by 3;
            <sql:param>${param.hub}</sql:param>
            <sql:param>${param.slot0}</sql:param>
            <sql:param>${param.slot1}</sql:param>
            <sql:param>${param.slot2}</sql:param>
        </sql:query>
        <ol class="bulletedList">
        <c:forEach items="${slot3s.rows}" var="row" varStatus="rowCounter">
                <li><a href="taxonomy_bind_step2.jsp?fid=${row.fid}&hub=${param.hub}">${row.slot3}</a>
                <jsp:include page="node_step1.jsp" flush="true">
                    <jsp:param name="hub" value="${param.hub}" />
                    <jsp:param name="slot0" value="${param.slot0}" />
                    <jsp:param name="slot1" value="${param.slot1}" />
                    <jsp:param name="slot2" value="${param.slot2}" />
                    <jsp:param name="slot3" value="${row.slot3}" />
                </jsp:include>
                </li>
        </c:forEach>
        </ol>
    </c:when>
    <c:when test="${not empty param.slot0 and not empty param.slot1 and not empty param.slot2 and not empty param.slot3 and empty param.slot4}">
        <sql:query var="slot4s" dataSource="jdbc/serviceMapper">
            select fid,path,slot4
            from ctsa_services.facet
            where hub = ? and slot0=? and slot1=? and slot2=? and slot3=? and slot4 is not null and slot5 is null
            order by 3;
            <sql:param>${param.hub}</sql:param>
            <sql:param>${param.slot0}</sql:param>
            <sql:param>${param.slot1}</sql:param>
            <sql:param>${param.slot2}</sql:param>
            <sql:param>${param.slot3}</sql:param>
        </sql:query>
        <ol class="bulletedList">
        <c:forEach items="${slot4s.rows}" var="row" varStatus="rowCounter">
                <li><a href="taxonomy_bind_step2.jsp?fid=${row.fid}&hub=${param.hub}">${row.slot4}</a>
                <jsp:include page="node_step1.jsp" flush="true">
                    <jsp:param name="hub" value="${param.hub}" />
                    <jsp:param name="slot0" value="${param.slot0}" />
                    <jsp:param name="slot1" value="${param.slot1}" />
                    <jsp:param name="slot2" value="${param.slot2}" />
                    <jsp:param name="slot3" value="${param.slot3}" />
                    <jsp:param name="slot4" value="${row.slot4}" />
                </jsp:include>
                </li>
        </c:forEach>
        </ol>
    </c:when>
    <c:when test="${not empty param.slot0 and not empty param.slot1 and not empty param.slot2 and not empty param.slot3 and not empty param.slot4 and empty param.slot5}">
        <sql:query var="slot5s" dataSource="jdbc/serviceMapper">
            select fid,path,slot5
            from ctsa_services.facet
            where hub = ? and slot0=? and slot1=? and slot2=? and slot3=? and slot4=? and slot5 is not null
            order by 3;
            <sql:param>${param.hub}</sql:param>
            <sql:param>${param.slot0}</sql:param>
            <sql:param>${param.slot1}</sql:param>
            <sql:param>${param.slot2}</sql:param>
            <sql:param>${param.slot3}</sql:param>
            <sql:param>${param.slot4}</sql:param>
        </sql:query>
        <ol class="bulletedList">
        <c:forEach items="${slot5s.rows}" var="row" varStatus="rowCounter">
                <li><a href="taxonomy_bind_step2.jsp?fid=${row.fid}&hub=${param.hub}">${row.slot5}</a>
                </li>
        </c:forEach>
        </ol>
    </c:when>
</c:choose>
