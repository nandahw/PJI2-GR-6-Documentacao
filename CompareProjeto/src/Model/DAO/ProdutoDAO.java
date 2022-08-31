package Model.DAO;

public class ProdutoDAO {
	   public String pesquisaProduto(String nomeProdutoPesquisa) {
		    String nomep1 = "Mesa";
			String nomep2 = "Bola de futebol";
			String nomep3 = "Caderno BTS";
			String nomep4 = "Celular";
			String nomep5 = "Espelho pequeno";
			String preco = "0";
			
			if (nomeProdutoPesquisa.equals(nomep1) ) {
				preco = "200.00";
			} else {
				if (nomeProdutoPesquisa.equals(nomep2) ) {
					preco = "300.00";
				} else {
					if (nomeProdutoPesquisa.equals(nomep3) ) {
						preco = "19.00";
					} else {
						if (nomeProdutoPesquisa.equals(nomep4)) {
							preco = "2000.00";
						} else {
							if (nomeProdutoPesquisa.equals(nomep5) ) {
								preco = "15.00";
						} else {
							preco = "0.00";
							}
					}
				}
					
			}
			
	   }
			return preco;
}
}