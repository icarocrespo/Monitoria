<%@page import="java.util.List"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="dao.EscolaDAO"%>
<%@page import="modelo.Escola"%>
<%@page import="modelo.Professor"%>
<%@include file="../cabecalho.jsp" %>
<%
    EscolaDAO edao = new EscolaDAO();
    List<Escola> elista = edao.listar();
    Professor obj = new Professor();
    
    if (request.getMethod().equals("POST")) {
        ProfessorDAO dao = new ProfessorDAO();
        obj.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setTelefone(request.getParameter("txtTelefone"));
        Escola escola = new Escola();
        escola.setId(Integer.parseInt(request.getParameter("selEscola")));
        obj.setIdEscola(escola);
        dao.alterar(obj);
        response.sendRedirect("index.jsp");
    } else {
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        ProfessorDAO dao = new ProfessorDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Gerenciamento de Professores
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Atualizar professor selecionado
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Professor
        </div>
        <div class="panel-body">
            <form action="#" method="post">

                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtId" readonly value="<%=obj.getId()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required value="<%=obj.getNome()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Endereço</label>
                        <input class="form-control" type="text" name="txtTelefone" required value="<%=obj.getTelefone()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Escola</label>
                        <select name ="selEscola"> 
                            <%
                                String marcadoE;
                                for (Escola esc : elista) {
                                    if (esc.getId() == obj.getIdEscola().getId()) {
                                        marcadoE = "selected";
                                    } else {
                                        marcadoE = "";
                                    }
                            %>
                            <option value="<%=esc.getId()%>"<%=marcadoE%>><%=esc.getNome()%></option>
                            <%
                                }
                            %>
                        </select> <br /> 
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>