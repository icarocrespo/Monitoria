<%@page import="dao.EscolaDAO"%>
<%@page import="modelo.Escola"%>
<%@include file="../cabecalho.jsp" %>
<%
    if (request.getParameter("txtNome") != null && request.getParameter("txtEndereco") != null) {
        EscolaDAO dao = new EscolaDAO();
        Escola obj = new Escola();
        obj.setNome(request.getParameter("txtNome"));
        obj.setEndereco(request.getParameter("txtEndereco"));
        dao.incluir(obj);
        response.sendRedirect("index.jsp");
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Gerenciamento de Escolas
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Adicionar nova Escola
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Escola
        </div>
        <div class="panel-body">
            <form action="#" method="post">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required />
                    </div>
                    <div class="form-group">
                        <label>Endereço</label>
                        <input class="form-control" type="text" name="txtEndereco" required />
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>