DROP TABLE IF EXISTS donors;

CREATE TABLE donors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    birth_date TEXT NOT NULL, -- Formato YYYY-MM-DD
    weight REAL NOT NULL,
    blood_type TEXT NOT NULL,
    last_donation_date TEXT, -- Formato YYYY-MM-DD, pode ser NULL
    contact_info TEXT, -- Novo campo para contato (ex: email/telefone)

    -- Resultados da Triagem
    triage_result_status TEXT NOT NULL, -- ex: 'apto', 'inapto_temporario', 'inapto_permanente'
    triage_deferral_days INTEGER, -- Número de dias de inaptidão, se temporário
    triage_message TEXT, -- Mensagem detalhada da triagem
    
    calculated_next_donation_date TEXT, -- Data calculada para próxima doação/liberação YYYY-MM-DD
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data de cadastro
);

-- Nova tabela para usuários (MODIFICADA)
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    cpf TEXT UNIQUE NOT NULL, -- CPF deve ser único
    birth_date_user TEXT NOT NULL, -- Data de nascimento do usuário (YYYY-MM-DD)
    username TEXT UNIQUE NOT NULL, -- Login/username único
    password_hash TEXT NOT NULL, -- Senha armazenada como hash
    registration_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_admin BOOLEAN NOT NULL DEFAULT 0 -- << LINHA ADICIONADA: 0 para não admin, 1 para admin
);