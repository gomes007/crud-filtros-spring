<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      	
      	<li class="nav-item dropdown">
      		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	Cadastros
          	</a>          	
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	          
	            <li><a class="dropdown-item" href=<c:url value="/pessoa/cadastro" />>Incluir Pessoas</a></li>
	            
	            <li><a class="dropdown-item" href="#">Incluir Preços</a></li>
	            <li><a class="dropdown-item" href="atendimento">Incluir Atendimentos</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Logout</a></li>
	          </ul>          	          	
      	</li>
      
      	<li class="nav-item dropdown">
      		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	Consultas
          	</a>          	
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href=<c:url value="/pessoa/listagem" />>Listar Pessoas</a></li>
	          </ul>          	          	
      	</li>

      	<li class="nav-item dropdown">
      		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	Gráficos
          	</a>          	
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="graficos">Gráfico de Exemplo</a></li>
	          </ul>          	          	
      	</li>      	      
      </ul>
    </div>
  </div>
</nav>