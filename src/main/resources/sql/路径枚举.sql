-- 查询 comment_id = 7 的所有父节点
select * from comments c where '1/4/6/7/' like concat(c.path, '%');

-- 查询 comment_id = 4 的所有子节点
select * from comments c where c.path like '1/4/%';

-- 计算 comment_id 为 4 的评论扩展出的所有子评论中，每个用户的评论数量
SELECT c.author, count(1) FROM comments AS c WHERE c.path LIKE '1/4/%' GROUP BY c.author;

-- 先插入评论，在修改 path 字段
INSERT INTO accounts(account_id) values (4);
INSERT INTO comments (bug_id, author, comment) VALUES(1, 4, 'excellent!');
UPDATE comments SET path = CONCAT((select tmp.path from (SELECT path FROM comments WHERE comment_id = 7) as tmp), LAST_INSERT_ID(),'/')
WHERE comment_id = LAST_INSERT_ID();
