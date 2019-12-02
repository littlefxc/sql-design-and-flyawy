-- 修改表数据结构, 删除 parent_id 和外键约束
alter table comments drop foreign key fk_comments_id;
alter table comments drop column parent_id;
alter table comments add column path VARCHAR(1000);

-- 删除 comments 所有数据, 重新添加示例数据
delete from comments where true;
INSERT INTO comments (comment_id, path, bug_id, author, comment) VALUES
(1, '1/', 1, 1, '这个Bug的成因是什么'),
(2, '1/2/', 1, 2, '我觉得是一个空指针'),
(3, '1/2/3', 1, 1, '不，我查过了'),
(4, '1/4', 1, 3, '我们需要查无效输入'),
(5, '1/4/5', 1, 2, '是的，那是个问题'),
(6, '1/4/6', 1, 1, '好，查一下吧'),
(7, '1/4/6/7', 1, 3, '解决了'),
(8, '1/4/6/7/8', 1, 1, '非常棒');