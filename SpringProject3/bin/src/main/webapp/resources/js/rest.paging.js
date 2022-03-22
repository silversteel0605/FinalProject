/*<ul> 	
		<li><a href="./search?nowPage=1&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;&lt;</a></li>
		<c:choose>
		<c:when test="${paging.startPage != 1}">
			<li><a href="./search?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="./search?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;</a></li>
		</c:otherwise>
		</c:choose>      
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li class="active"><a href="./search?nowPage=${p }&cntPerPage=${paging.cntPerPage}${search.uri}">${p }</a></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li><a href="./search?nowPage=${p }&cntPerPage=${paging.cntPerPage}${search.uri}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${paging.endPage != paging.lastPage}">
				<li><a href="./search?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="./search?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="./search?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;&gt;</a></li>
      </ul>
*/