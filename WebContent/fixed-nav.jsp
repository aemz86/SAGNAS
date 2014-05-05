<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">SAGNAS</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li class="text-right"><a href="javascript:void(0);"><span>Welcome <%=session.getAttribute("userid") %></span></a></li>
        <li class="text-right"><a href="logout.jsp"><span>Logout</span></a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</div>
