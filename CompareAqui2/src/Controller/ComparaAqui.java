package Controller;
import Model.PRODUTO.Produto;
import View.TrataTela;

public class ComparaAqui {
	public static void main(String[] args) {
		TrataTela tela = new TrataTela();
		tela.entraSistema();
		
		String produtoInformado = tela.obtemProduto();
		
		Produto prodNegocio = new Produto();
		
		String mensagem = prodNegocio.verificaPreco(produtoInformado);
		
		tela.informaPreco(mensagem); 

}

}