<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>

       <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
	                        <form role="form" action="/board/modify" method="post">
	                        	<div class="form-group">
		                        <label>Bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno }"/>' readonly="readonly">
		                        </div>
		                        <div class="form-group">
		                        <label>Title</label> <input class="form-control" name="title" value='<c:out value="${board.title }"/>'>
		                        </div>
		                        <div class="form-group">
		                        <label>Text Area</label> <textarea class="form-control" name="content"><c:out value="${board.content }"/></textarea>
		                        </div>
		                        <div class="form-group">
		                        <label>Writer</label> <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>'>
		                        </div>
		                        <div class="form-group">
		                        <label>RegDate</label> <input class="form-control" name="regDate" 
		                        value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>' readonly="readonly">
		                        </div>
		                       <label>UpdateDate</label> <input class="form-control" name="updateDate" 
		                        value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>' readonly="readonly">
		                        </div>
		                        <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                        		<input type="hidden" name="amount"value='<c:out value="${cri.amount }"/>'>
								<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />' />
                            	<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />' />
		                        <button type="submit" data-oper='modify' class="btn btn-defalut">Modify</button>
		                        <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
		                        <button type="submit" data-oper='list' class="btn btn-info" >List</button>
	                        </form>
                        
                          </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <script>
				$(document).ready(function() {
					var formObj = $("form");
					$('button').on("click", function(e) {
						e.preventDefault();
						var operation = $(this).data("oper");
						console.log(operation);
						if(operation === 'remove') {
							formObj.attr("action", "/board/remove");
							//alert("지움"+operation);
						} else if(operation === 'list') {
							//alert("리스트"+operation);
							formObj.attr("action", "/board/list").attr("method", "get");
							var pageNumTag = $("input[name='pageNum']").clone();
							var amountTag = $("input[name='amount']").clone();
							var keywordTag = $("input[name='keyword']").clone();
							var typeTag = $("input[name='type']").clone();
							
							formObj.empty();
							formObj.append(pageNumTag);
							formObj.append(amountTag);
							formObj.append(keywordTag);
							formObj.append(typeTag);
						}
						formObj.submit();
					});
				});
            </script>
                        