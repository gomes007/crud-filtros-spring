package br.com.dashboard.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import br.com.dashboard.models.Pessoa;

public class PessoaMapper implements RowMapper<Pessoa> {

	@Override
	public Pessoa mapRow(ResultSet rs, int rowNum) throws SQLException {
		Pessoa pessoa = new Pessoa();
		pessoa.setId(rs.getInt("ID"));
		pessoa.setNome(rs.getString("NOME"));
		pessoa.setEmail(rs.getString("EMAIL"));
		pessoa.setCargo(rs.getString("CARGO"));
		pessoa.setStatus(rs.getString("STATUS"));	
		
		return pessoa;
	}

}
