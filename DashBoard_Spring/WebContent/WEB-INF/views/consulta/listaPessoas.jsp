<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../cabecalho.jsp"%>
	
	
	
	<div class="container">
		<h1>Lista de Pessoas</h1>
		
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">NOME</th>
		      <th scope="col">EMAIL</th>
		      <th scope="col">CARGO</th>
		      <th scope="col">STATUS</th>
		      <th></th>
		    </tr>
		  </thead>				  		 
		  
		  <tbody>
		  	<c:forEach var="pessoa" items="${pessoas}"> 
			    <tr>
			      <td class="pnome">${pessoa.nome}</td>
			      <td>${pessoa.email}</td>
			      <td>${pessoa.cargo}</td>
			      <td>${pessoa.status}</td>
			      <td>
			      <a href=<c:url value="/pessoa/atualizar?id=${pessoa.id}" />  class="btn btn-primary">Editar</a>
			      <button type="button" class="btn btn-danger remove" data-id="${pessoa.id}" data-bs-toggle="modal" data-bs-target="#modal">Remover</button>
			      <button type="button" class="btn btn-primary editar" data-id="${pessoa.id}" data-bs-toggle="modal" data-bs-target="#modal2">Editar</button>			      
			      </td>


			    </tr>		  	
		  	</c:forEach>
		  </tbody>		  
		
		</table>
		
	</div>
	
 <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
            <div class="modal-content"> 
                <div class="modal-header"> 
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> 
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                </div> 
                
                <div class="modal-body"> 
                    <p> hi </p>
                    <div id="conteudo"></div> 
                </div>
                 
                <div class="modal-footer"> 
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="btnConfirmar" class="btn btn-primary" data-bs-dismiss="modal">Save changes</button> 
                </div> 
            </div> 
        </div> 
    </div>
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script> 
    	$(document).ready(function(){
    		var id;
            $('.remove').click(function(){
            	//var id = $(this).parents("tr").find(".pnome").text();
            	id = $(this).attr("data-id");
            	var texto = '<p>Codigo do Colaborador a ser removido: ' + id + '</p>';
            	$("#conteudo").html(texto);
            });   
            
            $("#btnConfirmar").click(function(){
            	var url = "http://localhost:8080/DashBoard_Spring/pessoa/exclusao/" + id;
            	$(location).attr('href', url);
            	//alert(url);
            });
    	});    	
        </script>
        





<!-- Modal -->
    <div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
            <div class="modal-content"> 
                <div class="modal-header"> 
                    <h5 class="modal-title" id="exampleModalLabel">Editar</h5> 
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                </div> 
                
 <div class="modal-body"> 
                    
                    
       <div class="container">
	
		<div class="row">
			<div class="col-sm-6">
										
				
				<form action=<c:url value="/atualizarpessoa" /> method="post">
				
					<input type="hidden" name="id" value="${pessoa.id}">									
				
					<div class="mb-3">
					  <label for="nome" class="form-label">Nome:</label>
					  <input type="text" class="form-control" value="${pessoa.nome}" id="nome" name="nome">
					</div>
		
					<div class="mb-3">
					  <label for="email" class="form-label">Email:</label>
					  <input type="email" class="form-control" value="${pessoa.email}" id="email" name="email">
					</div>
					
					<div class="mb-3">
					  <label for="cargo" class="form-label">Cargo:</label>
					  <select class="form-select" id="cargo" name="cargo">
					  
					  	<c:forEach var="cargo" items="${cargos}">
					  		<c:choose>
					  			<c:when test="${cargo eq pessoa.cargo}">
					  				<option value="${cargo}" selected="selected">${cargo}</option>	
					  			</c:when>
					  			<c:otherwise>
					  				<option value="${cargo}">${cargo}</option>
					  			</c:otherwise>
					  		</c:choose>
					  	</c:forEach>
					  	
					  </select>
					</div>
					
					<div class="mb-3">
					  <label for="status" class="form-label">Status:</label>
					  <select class="form-select" id="status" name="status">
					  
					  
					  	<c:forEach var="st" items="${status}">
					  		<c:choose>
					  			<c:when test="${st eq pessoa.status}">
					  				<option value="${st}" selected="selected">${st}</option>	
					  			</c:when>
					  			<c:otherwise>
					  				<option value="${st}">${st}</option>
					  			</c:otherwise>
					  		</c:choose>
					  	</c:forEach>					  

					  </select>
					</div>	
					
					<div class="mb-3">
						<button type="submit" class="btn btn-primary">Alterar Pessoa</button>
					</div>
					
					<div class="mb-3">
					<button type="button" class="btn btn-danger remove" data-id="${pessoa.id}" data-bs-toggle="modal" data-bs-target="#modal2">Change</button>
					</div>						
				</form>			
			</div>
		</div>
	</div>
                    
                    
                     
</div>
                 
                <div class="modal-footer"> 
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="btnConfirmar2" class="btn btn-primary" data-bs-dismiss="modal">Save changes</button> 
                </div> 
            </div> 
        </div> 
    </div>
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script> 
    	$(document).ready(function(){
    		var id;
            $('.remove').click(function(){
            	//var id = $(this).parents("tr").find(".pnome").text();
            	id = $(this).attr("data-id");
            	var texto = '<p>Codigo do Colaborador a ser removido: ' + id + '</p>';
            	$("#conteudo").html(texto);
            });   
            
            $("#btnConfirmar2").click(function(){
            	var url = "http://localhost:8080/DashBoard_Spring/atualizarpessoa?id=" + id;
            	$(location).attr('href', url);
            	//alert(url);
            });
    	});    	
     </script>



        
        
        
</body>
</html>