package Model.PRODUTO;

import Model.DAO.ProdutoDAO;

public class Produto {
	   public String verificaPreco(String nomep) {
		   
		   ProdutoDAO  nome = new ProdutoDAO();
		   	  
		   String valor = nome.pesquisaProduto(nomep);
		   
		   String mensagemFormatada = "O melhor preço: " +valor;
		   
		   return  (mensagemFormatada); 
		   
	   }
}