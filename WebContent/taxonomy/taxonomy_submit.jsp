<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:update dataSource="jdbc/serviceMapper">
    insert into ctsa_services.taxonomy(taxonomy) values(?);
    <sql:param>${param.taxonomy}</sql:param>
</sql:update>

<c:redirect url="taxonomy_edit.jsp?hub=${param.taxonomy}" />
