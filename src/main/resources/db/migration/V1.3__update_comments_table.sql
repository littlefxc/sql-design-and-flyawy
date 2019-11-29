-- 修改表结构
ALTER TABLE comments ADD COLUMN parent_id BIGINT UNSIGNED;
ALTER TABLE comments ADD CONSTRAINT fk_comments_id FOREIGN KEY (parent_id) REFERENCES comments(comment_id);

-- 插入数据: 生产环境中不推荐插入
INSERT INTO accounts(account_id) values (1), (2), (3);

INSERT INTO bugs(bug_id, date_reported, summary, description, resolition, reported_by, assigned_to, status, priority, hours) value (1, date(now()), 'summary', 'description', 'resolition', 1, 1, 'NEW', '严重', 3);

INSERT INTO comments (comment_id, parent_id, bug_id, author, comment) VALUES
(1, null, 1, 1, '这个Bug的成因是什么'),
(2,    1, 1, 2, '我觉得是一个空指针'),
(3,    2, 1, 1, '不，我查过了'),
(4,    1, 1, 3, '我们需要查无效输入'),
(5,    4, 1, 2, '是的，那是个问题'),
(6,    4, 1, 1, '好，查一下吧'),
(7,    6, 1, 3, '解决了'),
(8,    7, 1, 1, '非常棒');