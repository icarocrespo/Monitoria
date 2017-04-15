<%@page import="modelo.Exercicio"%>
<%@page import="dao.ExercicioDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Professor"%>
<%@include file="../cabecalho.jsp" %>
<%
    ProfessorDAO pdao = new ProfessorDAO();
    List<Professor> plista = pdao.listar();
    Exercicio obj = new Exercicio();

    if (request.getMethod().equals("POST")) {
        ExercicioDAO dao = new ExercicioDAO();
        obj.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setTitulo(request.getParameter("txtTitulo"));
        obj.setDescricao(request.getParameter("txtDescricao"));

        Professor professor = new Professor();

        professor.setId(Integer.parseInt(request.getParameter("selProfessor")));
        obj.setIdProfessor(professor);

        if (request.getParameter("txtAlternativa") != null) {

            if (request.getParameter("txtAlternativa").equals("A")) {
                obj.setAlternativaA(true);
            } else {
                obj.setAlternativaA(false);
            }
            if (request.getParameter("txtAlternativa").equals("B")) {
                obj.setAlternativaB(true);
            } else {
                obj.setAlternativaB(false);
            }
            if (request.getParameter("txtAlternativa").equals("C")) {
                obj.setAlternativaC(true);
            } else {
                obj.setAlternativaC(false);
            }
            if (request.getParameter("txtAlternativa").equals("D")) {
                obj.setAlternativaD(true);
            } else {
                obj.setAlternativaD(false);
            }
            dao.alterar(obj);
            response.sendRedirect("index.jsp");

        }
    } else {
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        ExercicioDAO dao = new ExercicioDAO();
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
            Sistema de Gerenciamento de Exercícios
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Atualizar exercício selecionado
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Exercício
        </div>
        <div class="panel-body">
            <form action="#" method="post">

                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Código:</label>
                        <input class="form-control" type="text" name="txtId" readonly value="<%=obj.getId()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Título:</label>
                        <input class="form-control" type="text" name="txtTitulo" required value="<%=obj.getTitulo()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Descrição:</label>
                        <input class="form-control" type="text" name="txtDescricao" required value="<%=obj.getDescricao()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Professor elaborador:</label>
                        <select class="form-control" name ="selProfessor"> 
                            <%
                                String marcadoP;
                                for (Professor prof : plista) {
                                    if (prof.getId() == obj.getIdProfessor().getId()) {
                                        marcadoP = "selected";
                                    } else {
                                        marcadoP = "";
                                    }
                            %>
                            <option value="<%=prof.getId()%>"<%=marcadoP%>><%=prof.getNome()%></option>
                            <%
                                }
                            %>
                        </select> <br /> 
                    </div>
                    <div class="form-group">
                        <label>Alternativa Correta:</label><br>

                        <label>A</label>
                        <input type="radio" name="txtAlternativa" value="A"/>&nbsp;&nbsp;&nbsp;
                        <label>B</label>
                        <input type="radio" name="txtAlternativa" value="B"/>&nbsp;&nbsp;&nbsp;
                        <label>C</label>
                        <input type="radio" name="txtAlternativa" value="C"/>&nbsp;&nbsp;&nbsp;
                        <label>D</label>
                        <input type="radio" name="txtAlternativa" value="D"/>&nbsp;&nbsp;&nbsp;
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>