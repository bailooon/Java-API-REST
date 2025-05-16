-- ========================
-- TABELA: tb_account
-- ========================
CREATE TABLE tb_account (
    id NUMBER PRIMARY KEY,
    "number" VARCHAR2(255) UNIQUE,
    agency VARCHAR2(255),
    balance NUMBER(13,2),
    additional_limit NUMBER(13,2)
);

CREATE SEQUENCE seq_tb_account START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_tb_account_id
BEFORE INSERT ON tb_account
FOR EACH ROW
BEGIN
    IF :new.id IS NULL THEN
        SELECT seq_tb_account.NEXTVAL INTO :new.id FROM dual;
    END IF;
END;
/

-- ========================
-- TABELA: tb_card
-- ========================
CREATE TABLE tb_card (
    id NUMBER PRIMARY KEY,
    "number" VARCHAR2(255) UNIQUE,
    available_limit NUMBER(13,2)
);

CREATE SEQUENCE seq_tb_card START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_tb_card_id
BEFORE INSERT ON tb_card
FOR EACH ROW
BEGIN
    IF :new.id IS NULL THEN
        SELECT seq_tb_card.NEXTVAL INTO :new.id FROM dual;
    END IF;
END;
/

-- ========================
-- TABELA: tb_feature
-- ========================
CREATE TABLE tb_feature (
    id NUMBER PRIMARY KEY,
    icon VARCHAR2(255),
    description VARCHAR2(255)
);

CREATE SEQUENCE seq_tb_feature START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_tb_feature_id
BEFORE INSERT ON tb_feature
FOR EACH ROW
BEGIN
    IF :new.id IS NULL THEN
        SELECT seq_tb_feature.NEXTVAL INTO :new.id FROM dual;
    END IF;
END;
/

-- ========================
-- TABELA: tb_news
-- ========================
CREATE TABLE tb_news (
    id NUMBER PRIMARY KEY,
    icon VARCHAR2(255),
    description VARCHAR2(255)
);

CREATE SEQUENCE seq_tb_news START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_tb_news_id
BEFORE INSERT ON tb_news
FOR EACH ROW
BEGIN
    IF :new.id IS NULL THEN
        SELECT seq_tb_news.NEXTVAL INTO :new.id FROM dual;
    END IF;
END;
/

-- ========================
-- TABELA: tb_user
-- ========================
CREATE TABLE tb_user (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255),
    account_id NUMBER,
    card_id NUMBER,
    CONSTRAINT fk_user_account FOREIGN KEY (account_id) REFERENCES tb_account(id),
    CONSTRAINT fk_user_card FOREIGN KEY (card_id) REFERENCES tb_card(id)
);

CREATE SEQUENCE seq_tb_user START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_tb_user_id
BEFORE INSERT ON tb_user
FOR EACH ROW
BEGIN
    IF :new.id IS NULL THEN
        SELECT seq_tb_user.NEXTVAL INTO :new.id FROM dual;
    END IF;
END;
/
