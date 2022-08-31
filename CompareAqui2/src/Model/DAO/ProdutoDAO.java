package Model.DAO;

public class ProdutoDAO {
	   public double pesquisaProduto(String codProdutoPesquisa) {
		    String nomep = "Mesa";
			String nomep2 = "p02";
			String nomep3 = "p03";
			double preco = 0;
			if (codProdutoPesquisa.equals(nomep) ) {
				preco = 501.00;
			} else {
				if (codProdutoPesquisa.equals(nomep2) ) {
					preco = 901.00;
				} else {
					if (codProdutoPesquisa.equals(nomep3) ) {
						preco = 1901.00;
					} else {
						preco = 0.00;
					}
				}
					
			}
			return preco;
	   }
}