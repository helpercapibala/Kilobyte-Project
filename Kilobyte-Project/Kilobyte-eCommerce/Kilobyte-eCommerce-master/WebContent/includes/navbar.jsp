<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <nav class="navbar-brand mb-0 h1">Kilobyte - Your PC Parts Store!</nav>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="ml-auto d-flex align-items-center">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <a href="index.jsp" class="btn btn-outline-light mx-2">Home</a>
                <a href="cart.jsp" class="btn btn-outline-light mx-2">
                    Cart <span class="badge badge-danger">${cart_list.size()}</span>
                </a>
                <%
                if (auth != null) {
                %>
                <a href="orders.jsp" class="btn btn-outline-light mx-2">Orders</a>
                <a href="log-out" class="btn btn-danger mx-2">Logout</a>
                <%
                } else {
                %>
                <a href="login.jsp" class="btn btn-success mx-2">Login</a>
                <%
                }
                %>
            </div>
        </div>
    </div>
</nav>
