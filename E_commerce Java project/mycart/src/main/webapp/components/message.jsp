?%
String message = (String)session.getAttribute("message");
if (message != nu11) (
// out print In (message);
%>
I
<div class="alert alert -success alert-dismisslble fade show role alert"»
     <strong><%= message%></strong>
<button type= "button" class="close" data-dismiss=alert arfa-label= Close"/>
<span aria-hidden="true">&times ; </spans>
     </buttons>
</div>
?%
session.removeAttribute("message");
}

%>
