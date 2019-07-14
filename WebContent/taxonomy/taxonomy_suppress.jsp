<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:update dataSource="jdbc/serviceMapper">
	insert into ctsa_services.binding_suppression(hub,cd2h_fid) values(?,?::int);
	<sql:param>${param.hub}</sql:param>
	<sql:param>${param.fid}</sql:param>
</sql:update>

<c:redirect url="taxonomy_bind_step2.jsp?fid=${param.fid}" />
