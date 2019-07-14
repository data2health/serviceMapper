<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:forEach var="hfid" items="${paramValues.hfid}">
    <sql:update dataSource="jdbc/serviceMapper">
       insert into ctsa_services.binding(cd2h_fid,hub_fid) values(?::int,?::int);
       <sql:param>${param.cfid}</sql:param>
        <sql:param>${hfid}</sql:param>
    </sql:update>
</c:forEach>

<c:redirect url="taxonomy_bind_step2.jsp?fid=${param.cfid}" />
