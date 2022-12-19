<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="tmp" items="${list }">
		<div class="chat_list_box${tmp.room } char_list_box">
				<div type="button" class="chat_list" room="${tmp.room }" other-nick="${tmp.other_nick }">
					<div class="chat_people">
						<div class="chat_img">
								<a href="other_profile.do?other_nick=${tmp.other_nick }">
										<img src="./upload/profile/${tmp.profile }" alt="sunil">
								</a>
						</div>
						<div class="chat-ib">
								<h5>${tmp.other_nick }<span class="chat_date">${tmp.send_time }</span>
								</h5>
								<div class="chat_ib">
										<div class="col-10">
												<p>${tmp.content }</p>
										</div>
										<c:if test="${tmp.unread > 0 }">
												<div class="col-2 unread${tmp.room }">
														<span class="badge bg-danger">${tmp.unread }</span>
												</div>
										</c:if>
								</div>
						</div>
					</div>
				</div>
		</div>

</c:forEach>