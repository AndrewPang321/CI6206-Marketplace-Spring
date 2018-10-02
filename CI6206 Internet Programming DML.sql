USE marketplace;


# --SAMPLE DATA
INSERT INTO t_user(email, firstname, lastname, date_of_birth, gender, contact, address, country, postal_code) VALUES ('DonaldTrump@gmail.com','Donald','Trump','31/12/1960','male','123456789','White House Street 123','USA','123456');
INSERT INTO t_user(email, firstname, lastname, date_of_birth, gender, contact, address, country, postal_code) VALUES ('putin@gmail.com','Vladmir','Putin','31/12/1959','male','123456789','Moscow Square 1','Russia','654321');

INSERT INTO t_user_account(user_id, username, password, first_security_question, first_security_answer, second_security_question, second_security_answer, third_security_question, third_security_answer) VALUES (1,'DTrump','password123','What is my first name','Donald','What is my last name','Trump','What is my gender','male');
INSERT INTO t_user_account(user_id, username, password, first_security_question, first_security_answer, second_security_question, second_security_answer, third_security_question, third_security_answer) VALUES (2,'VPutin','password123','What is my first name','Vladmir','What is my last name','Putin','What is my gender','male');

INSERT INTO t_item_category(category_id, category, first_level_subcategory) VALUES (1,'Vehicle','Car');
INSERT INTO t_item_category(category_id, category, first_level_subcategory) VALUES (2,'Vehicle','Lorry');
INSERT INTO t_item_category(category_id, category, first_level_subcategory) VALUES (3,'Mobile Phone','Apple Iphone');
INSERT INTO t_item_category(category_id, category, first_level_subcategory) VALUES (4,'Mobile Phone','Samsung');

INSERT INTO t_item(item_id, user_id, item_title, item_category, item_description, item_condition, item_location, item_delivery_mode, selling_price, shipping_fee) VALUES (1,1,'2019 Chevrolet Silverado','Vehicle','I am selling my new car made in USA','New','NTU North Spine','Cash On Delivery',100000,100);