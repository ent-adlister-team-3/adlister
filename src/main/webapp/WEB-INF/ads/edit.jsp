<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Ads</title>
</head>
<body>
<div class="container">
    <h1>Edit your ad</h1>
    <form action="/ads/edit" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" type="text">
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>

</body>
</html>
