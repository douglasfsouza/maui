# maui

Assinar:
usar a ferramenta keytool para gerar a chave
Na solução, click com botão direito no projeto e abrir no terminal:
  na pasta do projeto:
     keytool -genkeypair -v -keystore<file name>.keystore -alias <keyName> -keyalg RSA -keysize 2048 -validity 10000
	 -genkeypain indica que voce deseja gerar um par de chaves (publica e privada)
	 -v Torna o comando mais verboso mostrando informacoes detalhadas durante a criacao da chave
	 -alias é um  nome unico que voce atribui a chave dentro do keystore
	 -keyalg especifica o algoritmo de chave assimetrica para ser usado
	 -keysize define o tamanho da chave
	 -validity indica a quantidade de dias para a validade da chave
	 ex: keytool -genkeypair -v -keystore AsciiTable.keystore -alias AsciiTable -keyalg RSA -keysize 2048 -validity 10000
	     vai pedir para criar uma senha: @sciiTableDGS, $impleNotesDGS
Publicar:
   Abrir as propriedades do projeto
       Android
	      Assinatura .APK
		      Informar o arquivo gerado em Repositorio de chaves
			  Informar a senha
			  Informar o alias
   Ou pelo terminal:
       dotnet publish <NomeApp.csproj -f:net7.0-android -c:Release
	   /p:AndroidSigningKeyPass=@sciiTableDGS
	   /p:AndroidSigningStorePass=@sciiTableDGS
	   /p:AndroidSigningKeyAlias=AsciiTable
	   /p:AndroidStore=True
	   
	   onde AndroidSigningKeyPass define a senha da chave privada
	        AndroidSigningStorePass define a senha para acessar o keystore
			AndroidSigningKeyAlias define o Alias da chave dentro do keystore que sera usado para assinar o pacote
			AndroidStore indica que sera usado o keyStore para assinar o pacote
			
Alteracoes:
  Em qualquer alteracao deve-se alterar a versão ex. p/ versao 1.0 a próxima é 2.0 e não 1.1
  
Area de toque:
        
  não pode ter altura menor que 48dp ex: HeightRequest="50"
	   
	   
	   
	   
	   
	   
	   
	   
	   
	 
 