<%@page import="java.util.List"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Professor"%>
<%@include file="../cabecalho.jsp" %>
<%
    ProfessorDAO dao = new ProfessorDAO();
    List<Professor> lista = dao.listar();

    if (request.getParameter("codigo") != null) {
        Professor obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        dao.excluir(obj);
    }
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }
%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Professores
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Listagem de registros
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">
            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite...">
                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
            </div>
        </form>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>C�digo</th>
                            <th>Nome</th>
                            <th>Telefone</th>
                            <th>Escola</th>
                            <th>A��es</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Professor item : lista) {
                        %>
                        <tr>
                            <td><%=item.getId()%></td>
                            <td><%=item.getNome()%></td>
                            <td><%=item.getTelefone()%></td>
                            
                            <td><%=item.getIdEscola().getNome()%></td>
                            <td><a href="upd.jsp?codigo=<%=item.getId()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=item.getId()%>">Excluir</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <!-- /.table-responsive -->
            </div>
        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<%@include file="../modalexcluir.jsp" %>                        
<%@include file="../rodape.jsp" %>