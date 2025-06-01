# 🩸 Sangria - Controle de Doações

Sistema web desenvolvido em Python com Flask para auxiliar na triagem de candidatos a doadores de sangue, controlar a elegibilidade e gerar planilhas automatizadas para o gerenciamento dos doadores e das doações. O projeto inclui um sistema de cadastro e login de usuários, com um nível de acesso administrativo para funcionalidades restritas.

## ✨ Funcionalidades Principais

* **Cadastro e Login de Usuários:** Sistema de autenticação para acesso à plataforma.
* **Nível de Acesso Administrativo:** Usuários administradores têm permissões especiais.
* **Triagem de Doadores:** Formulário detalhado com perguntas baseadas em critérios de elegibilidade para doação de sangue.
* **Verificação de Elegibilidade:** Lógica no backend para analisar as respostas da triagem e determinar se o candidato está apto, inapto temporariamente (com cálculo do período de espera) ou inapto permanentemente.
* **Cadastro de Doadores:** Armazenamento dos dados pessoais e de triagem dos doadores em um banco de dados SQLite.
* **Listagem de Doadores Cadastrados:** Visualização dos doadores e seu status (apenas para administradores).
* **Geração Automatizada de Planilhas:** Exportação dos dados dos doadores para um arquivo Excel (`.xlsx`), incluindo:
    * Dados pessoais do doador (Nome, Data de Nascimento, Peso, Tipo Sanguíneo, Contato).
    * Datas de doação (última e próxima prevista).
    * Status da triagem e mensagens.
    * Formatação com cores na planilha para indicar o status de elegibilidade.
* **Interface Web Responsiva:** Design que se adapta a diferentes tamanhos de tela (desktop e mobile).

## 🛠️ Tecnologias Utilizadas

* **Backend:**
    * Python 3
    * Flask (Framework web)
    * Flask-Login (Gerenciamento de sessão e autenticação)
    * Werkzeug (Hashing de senhas, e é uma dependência do Flask)
    * SQLite (Banco de dados)
    * Openpyxl (Leitura e escrita de arquivos Excel `.xlsx`)
* **Frontend:**
    * HTML5
    * CSS3
    * JavaScript (para interatividade no navegador e chamadas API)
* **Versionamento:**
    * Git
    * GitHub

## 🚀 Configuração e Instalação Local

Siga os passos abaixo para configurar e executar o projeto localmente:

1.  **Pré-requisitos:**
    * Python 3.x instalado
    * Git instalado

2.  **Clone o Repositório (se estiver baixando do GitHub):**
    ```bash
    git clone [https://github.com/PD3-Sangria/PD3-Sangria-Site-com-triagem-completa-e-planilha-gerada-automaticamente.git](https://github.com/PD3-Sangria/PD3-Sangria-Site-com-triagem-completa-e-planilha-gerada-automaticamente.git)
    cd PD3-Sangria-Site-com-triagem-completa-e-planilha-gerada-automaticamente 
    ```
    *(Substitua pelo URL do seu repositório se for diferente)*

3.  **Crie e Ative um Ambiente Virtual:**
    ```bash
    python -m venv venv
    # No Windows (cmd):
    venv\Scripts\activate
    # No Windows (PowerShell):
    # .\venv\Scripts\Activate.ps1
    # No Linux/macOS:
    # source venv/bin/activate
    ```

4.  **Instale as Dependências:**
    ```bash
    pip install -r requirements.txt
    ```

5.  **Inicialize o Banco de Dados:**
    * (Certifique-se de que o arquivo `schema.sql` está presente na raiz do projeto)
    ```bash
    flask init-db
    ```
    Isso criará o arquivo `sangria_doadores.db` com as tabelas `users` e `donors`.

6.  **Execute a Aplicação Flask:**
    ```bash
    python app.py
    ```
    Ou para modo debug com recarregamento automático:
    ```bash
    flask run --debug --host=0.0.0.0 --port=5001 
    ```
    A aplicação estará acessível em `http://127.0.0.1:5001` (ou a porta configurada). O `host=0.0.0.0` permite acesso pela rede local.

## 🔧 Como Usar

1.  **Acesse o site** no seu navegador. Você será redirecionado para a página de login.
2.  **Cadastre um novo usuário** através da página de registro.
    * Preencha nome completo, CPF, data de nascimento, nome de usuário e senha.
3.  **Faça login** com as credenciais cadastradas.
4.  **Para Funcionalidades Administrativas (Gerar Planilha e Ver Lista de Doadores):**
    * O primeiro usuário cadastrado (ou um usuário designado) precisará ser definido como administrador. Isso é feito manualmente no banco de dados:
        1.  Use uma ferramenta como "DB Browser for SQLite" ou uma extensão SQLite no VS Code para abrir o arquivo `sangria_doadores.db`.
        2.  Navegue até a tabela `users`.
        3.  Para o usuário desejado, altere o valor da coluna `is_admin` de `0` para `1`.
        4.  Salve as alterações no banco de dados.
    * Após fazer login como administrador, a seção "Doadores Cadastrados" e o botão "Gerar Planilha" estarão visíveis na página principal.
5.  **Cadastro e Triagem de Doadores (disponível para usuários logados):**
    * Preencha o formulário de informações pessoais do doador.
    * Responda ao questionário de triagem detalhado.
    * Clique em "Verificar Elegibilidade e Cadastrar Doador".
    * O sistema exibirá o resultado da triagem e a data prevista para a próxima doação, se aplicável.
    * Se o usuário logado for administrador, o novo doador aparecerá na lista "Doadores Cadastrados".
6.  **Gerar Planilha (apenas administradores):**
    * Clique no botão "Gerar Planilha" para baixar um arquivo Excel (`.xlsx`) com os dados de todos os doadores cadastrados.

## 💡 Possíveis Melhorias Futuras (Opcional)

* Refinamento completo da lógica de triagem com todas as regras oficiais.
* Interface de gerenciamento de usuários para administradores (promover/rebaixar admins, etc.).
* Edição de dados de doadores.
* Dashboard com estatísticas sobre as doações.
* Melhorias visuais e de usabilidade (UX).
* Testes automatizados.
* Implantação (deploy) em uma plataforma de hospedagem online.

