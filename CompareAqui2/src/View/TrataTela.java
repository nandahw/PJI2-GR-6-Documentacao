package View;

import javax.swing.JOptionPane;

public class TrataTela {
	  public void  entraSistema() {
		  JOptionPane.showMessageDialog(null,
					"\nBem-Vindo\nCompareAqui");
	  }
	  public String  obtemProduto() {
		  String nome = JOptionPane.showInputDialog("Digite o código do produto: ");
		  return nome;
	  }
	  public void informaPreco(String mensagem) {
		  JOptionPane.showMessageDialog(null,mensagem);
	  }
}