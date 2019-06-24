<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:choose>
	<c:when test="${not empty param.slot0 and empty param.slot1 and empty param.slot2}">
		<sql:update dataSource="jdbc/serviceMapper">
			insert into ctsa_services.facet(hub,slot0) values(?,?);
			<sql:param>${param.hub}</sql:param>
            <sql:param>${param.slot0}</sql:param>
		</sql:update>
	</c:when>
	<c:when test="${not empty param.slot0 and not empty param.slot1 and empty param.slot2}">
		<sql:update dataSource="jdbc/serviceMapper">
			insert into ctsa_services.facet(hub,slot0,slot1) values(?,?,?);
            <sql:param>${param.hub}</sql:param>
			<sql:param>${param.slot0}</sql:param>
			<sql:param>${param.slot1}</sql:param>
		</sql:update>
	</c:when>
	<c:when test="${not empty param.slot0 and not empty param.slot1 and not empty param.slot2 and empty param.slot3}">
		<sql:update dataSource="jdbc/serviceMapper">
			insert into ctsa_services.facet(hub,slot0,slot1,slot2) values(?,?,?,?);
            <sql:param>${param.hub}</sql:param>
			<sql:param>${param.slot0}</sql:param>
			<sql:param>${param.slot1}</sql:param>
			<sql:param>${param.slot2}</sql:param>
		</sql:update>
	</c:when>
    <c:when test="${not empty param.slot0 and not empty param.slot1 and not empty param.slot2 and not empty param.slot3 and empty param.slot4}">
        <sql:update dataSource="jdbc/serviceMapper">
            insert into ctsa_services.facet(hub,slot0,slot1,slot2,slot3) values(?,?,?,?,?);
            <sql:param>${param.hub}</sql:param>
            <sql:param>${param.slot0}</sql:param>
            <sql:param>${param.slot1}</sql:param>
            <sql:param>${param.slot2}</sql:param>
            <sql:param>${param.slot3}</sql:param>
        </sql:update>
    </c:when>
    <c:when test="${not empty param.slot0 and not empty param.slot1 and not empty param.slot2 and not empty param.slot3 and not empty param.slot4 and empty param.slot5}">
        <sql:update dataSource="jdbc/serviceMapper">
            insert into ctsa_services.facet(hub,slot0,slot1,slot2,slot3,slot4) values(?,?,?,?,?,?);
            <sql:param>${param.hub}</sql:param>
            <sql:param>${param.slot0}</sql:param>
            <sql:param>${param.slot1}</sql:param>
            <sql:param>${param.slot2}</sql:param>
            <sql:param>${param.slot3}</sql:param>
            <sql:param>${param.slot4}</sql:param>
        </sql:update>
    </c:when>
    <c:when test="${not empty param.slot0 and not empty param.slot1 and not empty param.slot2 and not empty param.slot3 and not empty param.slot4 and not empty param.slot5}">
        <sql:update dataSource="jdbc/serviceMapper">
            insert into ctsa_services.facet(hub,slot0,slot1,slot2,slot3,slot4,slot5) values(?,?,?,?,?,?,?);
            <sql:param>${param.hub}</sql:param>
            <sql:param>${param.slot0}</sql:param>
            <sql:param>${param.slot1}</sql:param>
            <sql:param>${param.slot2}</sql:param>
            <sql:param>${param.slot3}</sql:param>
            <sql:param>${param.slot4}</sql:param>
            <sql:param>${param.slot5}</sql:param>
        </sql:update>
    </c:when>
</c:choose>

<c:redirect url="taxonomy_edit.jsp?hub=${param.hub}" />
