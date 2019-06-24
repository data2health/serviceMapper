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
				<li>${row.slot0}
				<a href="node_delete.jsp?hub=${param.hub}&slot0=${row.slot0}"><i class="fa fa-times" style="font-size:15px;color:red"></i></a>
				<jsp:include page="node_edit.jsp" flush="true">
					<jsp:param name="hub" value="${param.hub}" />
                    <jsp:param name="slot0" value="${row.slot0}" />
				</jsp:include>
				</li>
		</c:forEach>
		<li>
				<form action="node_submit.jsp">
                    <input type="hidden" id="hub" name="hub" value="${param.hub}">
					<input type="text" id="slot0" name="slot0" size="25" value="">
				</form>
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
				<li>${row.slot1}
                <a href="node_delete.jsp?hub=${param.hub}&slot0=${param.slot0}&slot1=${row.slot1}"><i class="fa fa-times" style="font-size:15px;color:red"></i></a>
				<jsp:include page="node_edit.jsp" flush="true">
                    <jsp:param name="hub" value="${param.hub}" />
					<jsp:param name="slot0" value="${param.slot0}" />
					<jsp:param name="slot1" value="${row.slot1}" />
				</jsp:include>
				</li>
		</c:forEach>
		<li>
				<form action="node_submit.jsp">
                    <input type="hidden" id="hub" name="hub" value="${param.hub}">
					<input type="hidden" id="slot0" name="slot0" value="${param.slot0}">
					<input type="text" id="slot1" name="slot1" size="25" value="">
				</form>
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
				<li>${row.slot2}
                <a href="node_delete.jsp?hub=${param.hub}&slot0=${param.slot0}&slot1=${param.slot1}&slot2=${row.slot2}"><i class="fa fa-times" style="font-size:15px;color:red"></i></a>
                <jsp:include page="node_edit.jsp" flush="true">
                    <jsp:param name="hub" value="${param.hub}" />
                    <jsp:param name="slot0" value="${param.slot0}" />
                    <jsp:param name="slot1" value="${param.slot1}" />
                    <jsp:param name="slot2" value="${row.slot2}" />
                </jsp:include>
				</li>
		</c:forEach>
		<li>
				<form action="node_submit.jsp">
                    <input type="hidden" id="hub" name="hub" value="${param.hub}">
					<input type="hidden" id="slot0" name="slot0" value="${param.slot0}">
					<input type="hidden" id="slot1" name="slot1" value="${param.slot1}">
					<input type="text" id="slot2" name="slot2" size="25" value="">
				</form>
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
                <li>${row.slot3}
                <a href="node_delete.jsp?hub=${param.hub}&slot0=${param.slot0}&slot1=${param.slot1}&slot2=${param.slot2}&slot3=${row.slot3}"><i class="fa fa-times" style="font-size:15px;color:red"></i></a>
                <jsp:include page="node_edit.jsp" flush="true">
                    <jsp:param name="hub" value="${param.hub}" />
                    <jsp:param name="slot0" value="${param.slot0}" />
                    <jsp:param name="slot1" value="${param.slot1}" />
                    <jsp:param name="slot2" value="${param.slot2}" />
                    <jsp:param name="slot3" value="${row.slot3}" />
                </jsp:include>
                </li>
        </c:forEach>
        <li>
                <form action="node_submit.jsp">
                    <input type="hidden" id="hub" name="hub" value="${param.hub}">
                    <input type="hidden" id="slot0" name="slot0" value="${param.slot0}">
                    <input type="hidden" id="slot1" name="slot1" value="${param.slot1}">
                    <input type="hidden" id="slot2" name="slot2" value="${param.slot2}">
                    <input type="text" id="slot3" name="slot3" size="25" value="">
                </form>
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
                <li>${row.slot4}
                <a href="node_delete.jsp?hub=${param.hub}&slot0=${param.slot0}&slot1=${param.slot1}&slot2=${param.slot2}&slot3=${param.slot3}&slot4=${row.slot4}"><i class="fa fa-times" style="font-size:15px;color:red"></i></a>
                <jsp:include page="node_edit.jsp" flush="true">
                    <jsp:param name="hub" value="${param.hub}" />
                    <jsp:param name="slot0" value="${param.slot0}" />
                    <jsp:param name="slot1" value="${param.slot1}" />
                    <jsp:param name="slot2" value="${param.slot2}" />
                    <jsp:param name="slot3" value="${param.slot3}" />
                    <jsp:param name="slot4" value="${row.slot4}" />
                </jsp:include>
                </li>
        </c:forEach>
        <li>
                <form action="node_submit.jsp">
                    <input type="hidden" id="hub" name="hub" value="${param.hub}">
                    <input type="hidden" id="slot0" name="slot0" value="${param.slot0}">
                    <input type="hidden" id="slot1" name="slot1" value="${param.slot1}">
                    <input type="hidden" id="slot2" name="slot2" value="${param.slot2}">
                    <input type="hidden" id="slot3" name="slot3" value="${param.slot3}">
                    <input type="text" id="slot4" name="slot4" size="25" value="">
                </form>
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
                <li>${row.slot5}
                <a href="node_delete.jsp?hub=${param.hub}&slot0=${param.slot0}&slot1=${param.slot1}&slot2=${param.slot2}&slot3=${param.slot3}&slot4=${param.slot4}&slot5=${row.slot5}"><i class="fa fa-times" style="font-size:15px;color:red"></i></a>
                </li>
        </c:forEach>
        <li>
                <form action="node_submit.jsp">
                    <input type="hidden" id="hub" name="hub" value="${param.hub}">
                    <input type="hidden" id="slot0" name="slot0" value="${param.slot0}">
                    <input type="hidden" id="slot1" name="slot1" value="${param.slot1}">
                    <input type="hidden" id="slot2" name="slot2" value="${param.slot2}">
                    <input type="hidden" id="slot3" name="slot3" value="${param.slot3}">
                    <input type="hidden" id="slot4" name="slot4" value="${param.slot4}">
                    <input type="text" id="slot5" name="slot5" size="25" value="">
                </form>
        </ol>
    </c:when>
</c:choose>
