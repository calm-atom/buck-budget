CREATE TABLE `transactions` (
  `transaction_id` bigserial PRIMARY KEY AUTO_INCREMENT,
  `account_id` bigint,
  `category_id` bigint,
  `transaction_type` varchar(255) NOT NULL COMMENT 'debit or credit',
  `date` timestamptz NOT NULL,
  `amount` bigint NOT NULL,
  `merchant` varchar(255),
  `created_at` timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE `accounts` (
  `account_id` bigserial PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `created_at` timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE `categories` (
  `category_id` bigserial PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `planned` bigint,
  `created_at` timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX `transactions_index_0` ON `transactions` (`account_id`);

CREATE INDEX `transactions_index_1` ON `transactions` (`category_id`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
