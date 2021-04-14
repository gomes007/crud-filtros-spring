package br.com.dashboard.controllers;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.dashboard.dao.jdbc.PessoasDao;
import br.com.dashboard.models.Pessoa;

@Controller
public class PessoasController {
	
	//action para gerar o formulario de cadastro (GET)
	@RequestMapping("/pessoa/cadastro") //o que vai aparecer na url
	public String incluir() {		
		return "cadastro/incluirPessoa"; //pasta cadastro e pagina  incluirPessoa.jsp
	}
	
	
	//action para receber os dados do formulario e incluir no banco de dados (POST)
	@SuppressWarnings("finally")
	@RequestMapping(value = "/cadpessoa", method = RequestMethod.POST) //o value define o nome que vai no form da pagina jsp
	public String incluir(Pessoa pessoa, ModelMap model) {		
		
		//obtendo uma referencia a beanJdbc.xml
		try {
			@SuppressWarnings("resource")
			ApplicationContext context = new ClassPathXmlApplicationContext("beanJdbc.xml"); 
			PessoasDao dao = (PessoasDao) context.getBean("pessoasDao"); //nome do id ou bean da classe
			dao.incluirPessoa(pessoa);
			
			model.addAttribute("mensagem", pessoa.getNome() + "incluido com sucesso!");									
			
		} catch (Exception e) {			
			model.addAttribute("mensagem", e.getMessage());
		} finally {
			return "cadastro/incluirPessoa";
		}
		
	}
	
	//action para listar as pessoas
	@RequestMapping(value="/pessoa/listagem")
	public String listar(ModelMap model) {
		try {
			@SuppressWarnings("resource")
			ApplicationContext context = new ClassPathXmlApplicationContext("beanJdbc.xml"); 
			PessoasDao dao = (PessoasDao) context.getBean("pessoasDao");			
			model.addAttribute("pessoas", dao.listarPessoas());
			
			return "consulta/listaPessoas";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			return "erro";
		} 
		
		
	}
	
	@RequestMapping(value="/pessoa/exclusao/{id}")
	public String remover(@PathVariable("id") int idPessoa, ModelMap model) {
		try {
			
			ApplicationContext context = new ClassPathXmlApplicationContext("beanJdbc.xml"); 
			PessoasDao dao = (PessoasDao) context.getBean("pessoasDao");
			
			dao.removerPessoa(idPessoa);
			
			return "redirect:/pessoa/listagem";
			
			
		} catch (Exception e) {
			model.addAttribute("erro", e.getMessage());
			return "erro";
		}
	}
	
	
	//action para atualizar no banco de dados (GET)
		@SuppressWarnings("finally")
		@RequestMapping("/pessoa/atualizar")
		public String atualizar(int id, ModelMap model) throws Exception  {
			try {
				
				
				String[] cargos = {"Gerente", "Coordenador", "Supervisor", "Operador"};
				String[] status = {"Ativo", "Ferias", "Desligado"};
				
				
				ApplicationContext context = new ClassPathXmlApplicationContext("beanJdbc.xml");
				PessoasDao dao = (PessoasDao) context.getBean("pessoasDao");
				
				
				
				if (dao != null) {
					model.addAttribute("pessoa", dao.buscarPessoa(id));			
				}
				model.addAttribute("cargos", cargos);
				model.addAttribute("status", status);
				
				
			} catch (Exception e) {
				throw e;
			} finally {
				return "consulta/editPessoas";
				
			}
		}
		
	//action para atualizar no banco de dados (POST)
		@SuppressWarnings("finally")
		@RequestMapping(value= "/atualizarpessoa", method= RequestMethod.POST)
		public String atualizar(Pessoa pessoa, ModelMap model) {
			try {
				@SuppressWarnings("resource")
				ApplicationContext context = new ClassPathXmlApplicationContext("beanJdbc.xml");
				PessoasDao dao = (PessoasDao) context.getBean("pessoasDao");
				
				
				
				dao.atualizarPessoa(pessoa);
								
				//return "consulta/editPessoas";
				
			} catch (Exception e) {
				model.addAttribute("mensagem", e.getMessage());
			} finally {
				return "redirect:/pessoa/listagem"; 
			}
		}
		
	
	
	
}
