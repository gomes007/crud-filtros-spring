package br.com.dashboard.dao.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import br.com.dashboard.models.Pessoa;

public class PessoasDao {

	private JdbcTemplate jdbcTemplate;

	// ESTE METODO RECEBERA UM OBJETO DATASOURCE VIA DI(DEPENDENCY INJECTION)
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// METODO PARA INCLUIR UMA NOVA PESSOA
	public void incluirPessoa(Pessoa pessoa) throws Exception {
		try {

			jdbcTemplate.update("INSERT INTO tb_pessoas (NOME, EMAIL, CARGO, STATUS) VALUES (?,?,?,?)",
					pessoa.getNome(), pessoa.getEmail(), pessoa.getCargo(), pessoa.getStatus());

		} catch (Exception e) {
			throw e;
		}
	}

	// METODO PARA ATUALIZAR
	public void atualizarPessoa(Pessoa pessoa) throws Exception {
		try {
			jdbcTemplate.update("update tb_pessoas set NOME=?, EMAIL=?, CARGO=?, STATUS=? WHERE ID=?", pessoa.getNome(),
					pessoa.getEmail(), pessoa.getCargo(), pessoa.getStatus(), pessoa.getId());
		} catch (Exception e) {
			throw e;
		}
	}

	// METODO LISTAR PESSOAS
	public List<Pessoa> listarPessoas() throws Exception {
		List<Pessoa> pessoas = new ArrayList<>();
		try {
			pessoas = jdbcTemplate.query("select * from tb_pessoas", new PessoaMapper());
		} catch (Exception e) {
			throw e;
		}
		return pessoas;
	}

	// METODO BUSCAR PESSOA PELO ID
	public Pessoa buscarPessoa(int id) throws Exception {
		Pessoa pessoa = null;
		try {
			pessoa = jdbcTemplate.queryForObject("select * from tb_pessoas where ID = ?", new Integer[] { id },
					new PessoaMapper());
		} catch (Exception e) {
			throw e;
		}
		return pessoa;

	}

	// METODO PARA EXCLUIR PESSOA PELO ID
	public void removerPessoa(int id) throws Exception {
		try {

			jdbcTemplate.update("delete from tb_pessoas where ID = ?", id);

		} catch (Exception e) {
			throw e;
		}
	}

	// SOBRECARGA DO METODO EXCLUIR
	public void removerPessoa(Pessoa pessoa) throws Exception {
		removerPessoa(pessoa.getId());
	}

}
