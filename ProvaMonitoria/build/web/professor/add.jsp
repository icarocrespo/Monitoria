<%@page import="java.util.List"%>
<%@page import="modelo.Escola"%>
<%@page import="dao.EscolaDAO"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Professor"%>
<%@include file="../cabecalho.jsp" %>
<%
    EscolaDAO escDAO = new EscolaDAO();
    List<Escola> elista = escDAO.listar();

    if (request.getParameter("txtNome") != null && request.getParameter("txtTelefone") != null && request.getParameter("selEscola") != "Selecione") {
        ProfessorDAO dao = new ProfessorDAO();
        Professor obj = new Professor();
        obj.setNome(request.getParameter("txtNome"));
        obj.setTelefone(request.getParameter("txtTelefone"));

        Escola escola = new Escola();

        escola.setId(Integer.parseInt(request.getParameter("selEscola")));
        obj.setIdEscola(escola);
        dao.incluir(obj);
        response.sendRedirect("index.jsp");
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
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required />
                    </div>
                    <div class="form-group">
                        <label>Telefone</label>
                        <input class="form-control" type="text" name="txtTelefone" required />
                    </div>
                    <div class="form-group">
                        <label>Escola</label>
                        <select name ="selEscola" class="form-control"> 
                            <option>Selecione</option>
                            <%
                                for (Escola esc : elista) {
                            %>
                            <option value="<%=esc.getId()%>" ><%=esc.getNome()%></option>
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