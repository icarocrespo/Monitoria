<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Professor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Exercicio"%>
<%@page import="dao.ExercicioDAO"%>
<%@page import="dao.ExercicioDAO"%>
<%@page import="modelo.Exercicio"%>
<%@include file="../cabecalho.jsp" %>
<%
    ProfessorDAO profDAO = new ProfessorDAO();
    List<Professor> plista = profDAO.listar();

    if (request.getParameter("txtTitulo") != null && request.getParameter("txtDescricao") != null && request.getParameter("selProfessor") != "Selecione") {
        ExercicioDAO dao = new ExercicioDAO();
        Exercicio obj = new Exercicio();
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
            dao.incluir(obj);
            response.sendRedirect("index.jsp");
        }
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Gerenciamento de Exercício
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Adicionar novo exercício
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
                        <label>Título</label>
                        <input class="form-control" type="text" name="txtTitulo" required />
                    </div>
                    <div class="form-group">
                        <label>Descrição</label>
                        <input class="form-control" type="text" name="txtDescricao" required />
                    </div>
                    <div class="form-group">
                        <label>Professor</label>
                        <select name ="selProfessor" class="form-control"> 
                            <option>Selecione</option>
                            <%
                                for (Professor prof : plista) {
                            %>
                            <option value="<%=prof.getId()%>" ><%=prof.getNome()%></option>
                            <%
                                }
                            %>
                        </select> <br /> 
                    </div>
                    <div class="form-group" align="left">
                        <label>Alternativa</label><br>

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