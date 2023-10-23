CREATE DATABASE IF NOT EXISTS p2k ;
USE p2k;

CREATE TABLE IF NOT EXISTS course_tb (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- id 필드에 AUTO_INCREMENT 추가
    created_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    instructor_id BIGINT,
    modified_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS course_user_tb (
    accept BOOLEAN,
    course_id BIGINT,
    created_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- id 필드에 AUTO_INCREMENT 추가
    modified_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    user_id BIGINT
);

CREATE TABLE IF NOT EXISTS post_tb (
    course_id BIGINT,
    created_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    modified_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    post_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- id 필드에 AUTO_INCREMENT 추가
    user_id BIGINT,
    author VARCHAR(20) NOT NULL,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(500) NOT NULL,
    category VARCHAR(255) CHECK (category IN ('NOTICE', 'QUESTION', 'FREE')),
    scope VARCHAR(255) CHECK (scope IN ('PUBLIC', 'PRIVATE'))
);

CREATE TABLE IF NOT EXISTS reply_tb (
    answer_num BIGINT,
    created_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- id 필드에 AUTO_INCREMENT 추가
    modified_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    parent_num BIGINT,
    post_id BIGINT,
    ref BIGINT,
    ref_order BIGINT,
    step BIGINT,
    user_id BIGINT,
    author VARCHAR(256) NOT NULL,
    content VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_tb (
    pending BOOLEAN,
    created_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- id 필드에 AUTO_INCREMENT 추가
    modified_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    name VARCHAR(20),
    email VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(256),
    role VARCHAR(255) CHECK (role IN ('ROLE_STUDENT', 'ROLE_INSTRUCTOR', 'ROLE_ADMIN'))
);

CREATE TABLE IF NOT EXISTS vm_tb (
    control BOOLEAN,
    node_port INTEGER NOT NULL,
    port INTEGER NOT NULL,
    scope BOOLEAN NOT NULL,
    course_id BIGINT,
    created_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- id 필드에 AUTO_INCREMENT 추가
    modified_date TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    user_id BIGINT,
    container_id VARCHAR(255),
    container_key VARCHAR(255),
    description VARCHAR(255),
    image_id VARCHAR(255),
    password VARCHAR(255),
    state VARCHAR(255),
    vm_key VARCHAR(255),
    vmname VARCHAR(255)
);

insert into user_tb(email, name, password, role, pending, created_date) values('tngus@p2k.com', '김수현', '$2a$12$KZJP10nNi8hOZWbHUM68cOUztR7eRfUu3OIAJdutv5Myh6LfRhRnK', 'ROLE_STUDENT', false, '2023-10-06 12:00:01');
insert into user_tb(email, name, password, role, pending, created_date) values('soso@p2k.com', '박소현', '$2a$12$GLJVspKOZIF6v/0N/34QFulK1PfDDKcgjd.6/JaPxYQihmXPC9/Ju', 'ROLE_STUDENT', false, '2023-10-06 12:00:01');
insert into user_tb(email, name, password, role, pending, created_date) values('gihae@p2k.com', '김기해', '$2a$12$1pGEvc7ppaGgQw5KM7HJw.ngC3VQH/jISCaSj5.5HtN2JRwSDAncm', 'ROLE_STUDENT', false, '2023-10-06 12:00:01');
insert into user_tb(email, name, password, role, pending, created_date) values('gihae2@p2k.com', '김기해2', '$2a$12$YGax8622SDdGWBLRqh9uN.wpZakphNMO6PnRQxn2B4JceH8oJ4/b.', 'ROLE_INSTRUCTOR', false, '2023-10-06 12:00:01');
insert into user_tb(email, name, password, role, pending, created_date) values('gihae3@p2k.com', '김기해3', '$2a$12$TCw6IkJ0CCBGnOiw9QgiGuSQedX3nettZ8UV75QEi1gfLpvOiNTE2', 'ROLE_INSTRUCTOR', true, '2023-10-06 12:00:01');
insert into user_tb(email, name, password, role, pending, created_date) values('admin@p2k.com', 'admin', '$2a$12$xLLDK93Bl0.S5mqt3GrNO.FJ6xvKYqp5lD5BsJa1cEhaHVyqtduhe', 'ROLE_ADMIN', false, '2023-10-06 12:00:01');

insert into course_tb(name, description, instructor_id, created_date) values('자료구조 059', '2-2', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('자료구조 060', '2-2', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('C언어', '1-2', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('C++', '2-1', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('파이썬', '1-1', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('자바', '2-2', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('알고리즘', '3-1', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('DB', '3-2', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('사물인터넷', '4-2', 4, '2023-10-06 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('네트워크', '3-2', 4, '2023-10-13 12:00:01');
insert into course_tb(name, description, instructor_id, created_date) values('운영체제', '3-1', 4, '2023-10-13 12:00:01');

insert into course_user_tb(user_id, course_id, accept) values(1, 1, true);
insert into course_user_tb(user_id, course_id, accept) values(2, 1, true);
insert into course_user_tb(user_id, course_id, accept) values(3, 1, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 1, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 2, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 3, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 4, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 5, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 6, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 7, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 8, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 9, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 10, true);
insert into course_user_tb(user_id, course_id, accept) values(4, 11, true);
insert into course_user_tb(user_id, course_id, accept) values(3, 11, true);
insert into course_user_tb(user_id, course_id, accept) values(2, 11, true);
insert into course_user_tb(user_id, course_id, accept) values(1, 11, true);

insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글1', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:01');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글2', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:02');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글3', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:03');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글4', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:04');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글5', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:05');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글6', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:06');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글7', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:07');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글8', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:08');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글9', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:09');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글10', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:10');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글11', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:11');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글12', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:12');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글13', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:13');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글14', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:14');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글15', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:15');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글16', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:16');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글17', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:17');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글18', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:18');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글19', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:19');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글20', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:20');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글21', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:21');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글22', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:22');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글23', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:23');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글24', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:24');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글25', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:25');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글26', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:26');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글27', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:27');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글28', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:28');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글29', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:29');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글30', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:30');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글31', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:31');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글32', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:32');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글33', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:33');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글34', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:34');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글35', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:35');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글36', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:36');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글37', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:37');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글38', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:38');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글39', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:39');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글40', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:40');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글41', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:41');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글42', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:41');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글43', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:42');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글44', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:43');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글45', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:44');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글46', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:45');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글47', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:46');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글48', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:47');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글49', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:48');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글50', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:49');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글51', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:50');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글52', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:51');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글53', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:52');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글54', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:53');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글55', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:54');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글56', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:55');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글57', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:56');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글58', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:57');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글59', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:58');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('공지글60', 'gh', '공지 글이지롱!><', 'PUBLIC', 'NOTICE', 1, 4, '2023-10-06 12:00:59');

insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글1', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:04');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글2', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:05');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글3', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:06');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글4', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:07');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글5', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:08');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글6', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:09');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글7', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:10');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글8', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:11');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글9', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:12');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글10', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:13');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글11', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:14');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글12', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:15');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글13', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:16');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글14', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:17');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글15', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:18');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글16', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:19');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글17', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:20');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글18', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:21');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글19', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:22');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글20', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:23');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글21', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:24');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글22', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:25');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글23', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:26');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글24', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:27');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글25', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:28');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글26', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:29');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글27', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:30');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글28', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:31');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글29', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:32');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('질문글30', 'gh', '질문 글이지롱!><', 'PUBLIC', 'QUESTION', 1, 3, '2023-10-06 12:00:33');

insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글1', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:41');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글2', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:42');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글3', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:43');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글4', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:44');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글5', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:45');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글6', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:46');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글7', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:47');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글8', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:48');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글9', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:49');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글10', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:50');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글11', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:51');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글12', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:52');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글13', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:53');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글14', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:54');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글15', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:55');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글16', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:56');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글17', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:57');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글18', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:58');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글19', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 11:59:59');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글20', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:00');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글21', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:01');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글22', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:02');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글23', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:03');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글24', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:04');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글25', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:05');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글26', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:06');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글27', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:07');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글28', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:08');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글29', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:09');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글30', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:10');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글31', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:11');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글32', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:12');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글33', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:13');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글34', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:14');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글35', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:15');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글36', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:16');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글37', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:17');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글38', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:18');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글39', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:19');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글40', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:20');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글41', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:21');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글42', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:22');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글43', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:26');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글44', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:27');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글45', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:28');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글46', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:29');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글47', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:30');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글48', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:31');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글49', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:32');
insert into post_tb(title, author, content, scope, category, course_id, user_id, created_date) values('자유글50', 'gh', '자유 글이지롱!><', 'PUBLIC', 'FREE', 1, 3, '2023-10-06 12:00:33');

insert into reply_tb(content, author, ref, ref_order, step, parent_num, answer_num, user_id, post_id) values('댓글1', 'ㄱㅎ', 0, 0, 0, 0, 0, 4, 1);


