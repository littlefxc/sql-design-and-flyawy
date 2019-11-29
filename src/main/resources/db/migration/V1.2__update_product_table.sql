ALTER TABLE products ADD COLUMN account_id BIGINT UNSIGNED;
ALTER TABLE products ADD CONSTRAINT fk_accounts_id FOREIGN KEY (account_id) REFERENCES accounts(account_id);