CREATE TABLE IF NOT EXISTS accounts
(
    account_id     SERIAL PRIMARY KEY,
    account_name   VARCHAR(20),
    first_name     VARCHAR(20),
    last_name      VARCHAR(20),
    email          VARCHAR(100),
    password_hash  CHAR(64),
    portrait_image BLOB,
    hourly_rate    NUMERIC(9, 2)
);

CREATE TABLE IF NOT EXISTS bugStatus
(
    `status` VARCHAR(20) PRIMARY KEY
);

INSERT INTO bugStatus(status) value ('NEW');

CREATE TABLE IF NOT EXISTS bugs
(
    bug_id        SERIAL PRIMARY KEY,
    date_reported DATE            NOT NULL,
    summary       VARCHAR(80),
    description   VARCHAR(1000),
    resolition    VARCHAR(1000),
    reported_by   BIGINT UNSIGNED NOT NULL,
    assigned_to   BIGINT UNSIGNED,
    verified_by   BIGINT UNSIGNED,
    `status`      VARCHAR(20)     NOT NULL DEFAULT 'NEW',
    priority      VARCHAR(20),
    hours         NUMERIC(9, 2),
    FOREIGN KEY (reported_by) REFERENCES accounts (account_id),
    FOREIGN KEY (assigned_to) REFERENCES accounts (account_id),
    FOREIGN KEY (verified_by) REFERENCES accounts (account_id),
    FOREIGN KEY (`status`) REFERENCES bugStatus (`status`)
);

CREATE TABLE IF NOT EXISTS comments
(
    comment_id   SERIAL PRIMARY KEY,
    bug_id       BIGINT UNSIGNED NOT NULL,
    author       BIGINT UNSIGNED NOT NULL,
    comment_date DATETIME        NOT NULL default now(),
    comment      TEXT            NOT NULL,
    FOREIGN KEY (bug_id) REFERENCES bugs (bug_id),
    FOREIGN KEY (author) REFERENCES accounts (account_id)
);

CREATE TABLE IF NOT EXISTS screenhots
(
    bug_id           BIGINT UNSIGNED NOT NULL,
    image_id         BIGINT UNSIGNED NOT NULL,
    screenshot_image BLOB,
    caption          VARCHAR(100),
    PRIMARY KEY (bug_id, image_id),
    FOREIGN KEY (bug_id) REFERENCES bugs (bug_id)
);

CREATE TABLE IF NOT EXISTS tags
(
    bug_id BIGINT UNSIGNED NOT NULL,
    tag    VARCHAR(20)     NOT NULL,
    PRIMARY KEY (bug_id, tag),
    FOREIGN KEY (bug_id) REFERENCES bugs (bug_id)
);

CREATE TABLE IF NOT EXISTS products
(
    product_id   SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS bugs_products
(
    bug_id     BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (bug_id, product_id),
    FOREIGN KEY (bug_id) REFERENCES bugs (bug_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);