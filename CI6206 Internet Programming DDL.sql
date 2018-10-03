CREATE SCHEMA marketplace DEFAULT CHARACTER SET utf8;


USE marketplace;


# ------------------------------------------- #
# --t_user
# ------------------------------------------- #
# --This table contains all the user information
CREATE TABLE t_user (
  user_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  email varchar(256) NOT NULL,
  firstname varchar(256) NOT NULL,
  lastname varchar(256) NOT NULL,
  date_of_birth date NOT NULL,
  gender varchar(20) NOT NULL,
  contact int(20) NOT NULL,
  address varchar(256) NOT NULL,
  country varchar(256) NOT NULL,
  postal_code int(10) NOT NULL,
  joined_date datetime DEFAULT CURRENT_TIMESTAMP,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE INDEX ind_t_user ON t_user (user_id);


# --This table contains all the audit for t_user
CREATE TABLE t_user_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  user_id int(16) DEFAULT NULL,
  email varchar(256) DEFAULT NULL,
  firstname varchar(256) DEFAULT NULL,
  lastname varchar(256) DEFAULT NULL,
  date_of_birth date DEFAULT NULL,
  gender varchar(20) DEFAULT NULL,
  contact int(20) DEFAULT NULL,
  address varchar(256) DEFAULT NULL,
  country varchar(256) DEFAULT NULL,
  postal_code int(10) DEFAULT NULL,
  joined_date datetime DEFAULT NULL,
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_user
DELIMITER $$
CREATE TRIGGER after_insert_t_user
    AFTER INSERT ON t_user
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_audit 
    SET action = 'insert',
	user_id = NEW.user_id,
	email = NEW.email,
	firstname = NEW.firstname,
	lastname = NEW.lastname,
	date_of_birth = NEW.date_of_birth,	
	gender = NEW.gender,
	contact = NEW.contact,
	address = NEW.address,
	country = NEW.country,
	postal_code = NEW.postal_code,
	joined_date = NEW.joined_date,
	active = NEW.active,
	remarks = NEW.remarks, 	
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_user
DELIMITER $$
CREATE TRIGGER after_delete_t_user
    AFTER DELETE ON t_user
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_audit
    SET action = 'delete',
	user_id = OLD.user_id,
	email = OLD.email,
	firstname = OLD.firstname,
	lastname = OLD.lastname,
	date_of_birth = OLD.date_of_birth,	
	gender = OLD.gender,
	contact = OLD.contact,
	address = OLD.address,
	country = OLD.country,
	postal_code = OLD.postal_code,
	joined_date = OLD.joined_date,
	active = OLD.active,
	remarks = OLD.remarks, 	
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_user
DELIMITER $$
CREATE TRIGGER after_update_t_user
    AFTER UPDATE ON t_user
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_audit
    SET action = 'update',
	user_id = OLD.user_id,
	email = OLD.email,
	firstname = OLD.firstname,
	lastname = OLD.lastname,
	date_of_birth = OLD.date_of_birth,	
	gender = OLD.gender,
	contact = OLD.contact,
	address = OLD.address,
	country = OLD.country,
	postal_code = OLD.postal_code,
	joined_date = OLD.joined_date,
	active = OLD.active,
	remarks = OLD.remarks, 	
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_user_account
# ------------------------------------------- #
# --This table contains all the user account information
CREATE TABLE t_user_account (
  user_id int(16) NOT NULL,
  role varchar(256) NOT NULL DEFAULT 'normal user',
  username varchar(256) NOT NULL,
  password varchar(256) NOT NULL,
  first_security_question varchar(256) DEFAULT NULL,
  first_security_answer varchar(256) DEFAULT NULL,  
  second_security_question varchar(256) DEFAULT NULL,
  second_security_answer varchar(256) DEFAULT NULL,
  third_security_question varchar(256) DEFAULT NULL,
  third_security_answer varchar(256) DEFAULT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_user_account (user_id),
  FOREIGN KEY (user_id)
	REFERENCES t_user(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_user_account
CREATE TABLE t_user_account_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  user_id int(16) DEFAULT NULL,
  role varchar(256) DEFAULT NULL,  
  username varchar(256) DEFAULT NULL,
  password varchar(256) DEFAULT NULL,  
  first_security_question varchar(256) DEFAULT NULL,
  first_security_answer varchar(256) DEFAULT NULL,  
  second_security_question varchar(256) DEFAULT NULL,
  second_security_answer varchar(256) DEFAULT NULL,
  third_security_question varchar(256) DEFAULT NULL,
  third_security_answer varchar(256) DEFAULT NULL,      
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_user_account
DELIMITER $$
CREATE TRIGGER after_insert_t_user_account
    AFTER INSERT ON t_user_account
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_account_audit 
    SET action = 'insert',
	user_id = NEW.user_id,
	role = NEW.role,
	username = NEW.username,	
	password = NEW.password,
	first_security_question = NEW.first_security_question,
	first_security_answer = NEW.first_security_answer,
	second_security_question = NEW.second_security_question,
	second_security_answer = NEW.second_security_answer,
	third_security_question = NEW.third_security_question,
	third_security_answer = NEW.third_security_answer,	
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_user_account
DELIMITER $$
CREATE TRIGGER after_delete_t_user_account
    AFTER DELETE ON t_user_account
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_account_audit
    SET action = 'delete',
	user_id = OLD.user_id,
	role = OLD.role,
	username = OLD.username,	
	password = OLD.password,
	first_security_question = OLD.first_security_question,
	first_security_answer = OLD.first_security_answer,
	second_security_question = OLD.second_security_question,
	second_security_answer = OLD.second_security_answer,
	third_security_question = OLD.third_security_question,
	third_security_answer = OLD.third_security_answer,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_user_account
DELIMITER $$
CREATE TRIGGER after_update_t_user_account
    AFTER UPDATE ON t_user_account
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_account_audit
    SET action = 'update',
	user_id = OLD.user_id,
	role = OLD.role,
	username = OLD.username,
	password = OLD.password,
	first_security_question = OLD.first_security_question,
	first_security_answer = OLD.first_security_answer,
	second_security_question = OLD.second_security_question,
	second_security_answer = OLD.second_security_answer,
	third_security_question = OLD.third_security_question,
	third_security_answer = OLD.third_security_answer,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_user_login_log
# ------------------------------------------- #
# --This table contains all the user login activities
CREATE TABLE t_user_login_log (
  user_id int(16) NOT NULL,
  last_login datetime DEFAULT CURRENT_TIMESTAMP,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_user_login_log
CREATE TABLE t_user_login_log_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  user_id int(16) DEFAULT NULL,
  last_login datetime DEFAULT NULL,  
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_user_login_log
DELIMITER $$
CREATE TRIGGER after_insert_t_user_login_log
    AFTER INSERT ON t_user_login_log
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_login_log_audit 
    SET action = 'insert',
	user_id = NEW.user_id,
	last_login = NEW.last_login,
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_user_login_log
DELIMITER $$
CREATE TRIGGER after_delete_t_user_login_log
    AFTER DELETE ON t_user_login_log
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_login_log_audit
    SET action = 'delete',
	user_id = OLD.user_id,
	last_login = OLD.last_login,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_user_login_log
DELIMITER $$
CREATE TRIGGER after_update_t_user_login_log
    AFTER UPDATE ON t_user_login_log
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_login_log_audit
    SET action = 'update',
	user_id = OLD.user_id,
	last_login = OLD.last_login,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_item
# ------------------------------------------- #
# --This table contains all the item information
CREATE TABLE t_item (
  item_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  user_id int(16) NOT NULL,
  item_title varchar(256) NOT NULL,
  item_category varchar(256) NOT NULL,
  item_description varchar(256) DEFAULT NULL,
  item_condition varchar(4) NOT NULL,
  item_location varchar(256) DEFAULT NULL,
  item_delivery_mode varchar(256) DEFAULT NULL,
  item_like_count int(16) NOT NULL DEFAULT 0,
  item_status varchar(20) NOT NULL DEFAULT 'available',
  selling_price decimal(13,2) NOT NULL DEFAULT 0.00,
  shipping_fee decimal(13,2) NOT NULL DEFAULT 0.00,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_item (user_id),
  FOREIGN KEY (user_id)
	REFERENCES t_user(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_item
CREATE TABLE t_item_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  item_id int(16) DEFAULT NULL, 
  user_id int(16) DEFAULT NULL, 
  item_title varchar(256) DEFAULT NULL,
  item_category varchar(256) DEFAULT NULL,
  item_description varchar(256) DEFAULT NULL,
  item_condition varchar(4) DEFAULT NULL,
  item_location varchar(256) DEFAULT NULL,
  item_delivery_mode varchar(256) DEFAULT NULL,
  item_like_count int(16) DEFAULT NULL,
  item_status varchar(20) DEFAULT NULL,
  selling_price decimal(13,2) DEFAULT NULL,
  shipping_fee decimal(13,2) DEFAULT NULL,  
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_item
DELIMITER $$
CREATE TRIGGER after_insert_t_item
    AFTER INSERT ON t_item
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_audit 
    SET action = 'insert',
	item_id = NEW.item_id, 
	user_id = NEW.user_id,
	item_title = NEW.item_title,
	item_category = NEW.item_category,
	item_description = NEW.item_description,	
	item_condition = NEW.item_condition, 
	item_location = NEW.item_location,
	item_delivery_mode = NEW.item_delivery_mode,
	item_like_count = NEW.item_like_count,
	item_status = NEW.item_status,	
	selling_price = NEW.selling_price,
	shipping_fee = NEW.shipping_fee,	
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_item
DELIMITER $$
CREATE TRIGGER after_delete_t_item
    AFTER DELETE ON t_item
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_audit
    SET action = 'delete',
	item_id = OLD.item_id,	
	user_id = OLD.user_id,
	item_title = OLD.item_title,
	item_category = OLD.item_category,
	item_description = OLD.item_description,	
	item_condition = OLD.item_condition, 
	item_location = OLD.item_location,
	item_delivery_mode = OLD.item_delivery_mode,
	item_like_count = OLD.item_like_count,
	item_status = OLD.item_status,	
	selling_price = OLD.selling_price,
	shipping_fee = OLD.shipping_fee,	
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_item
DELIMITER $$
CREATE TRIGGER after_update_t_item
    AFTER UPDATE ON t_item
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_audit
    SET action = 'update',
	item_id = OLD.item_id,
	user_id = OLD.user_id,
	item_title = OLD.item_title,
	item_category = OLD.item_category,
	item_description = OLD.item_description,	
	item_condition = OLD.item_condition, 
	item_location = OLD.item_location,
	item_delivery_mode = OLD.item_delivery_mode,
	item_like_count = OLD.item_like_count,
	item_status = OLD.item_status,	
	selling_price = OLD.selling_price,
	shipping_fee = OLD.shipping_fee,	
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_item_category
# ------------------------------------------- #
# --This table contains all the item information
CREATE TABLE t_item_category (
  category_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  category varchar(256) NOT NULL,
  first_level_subcategory varchar(256) NOT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_item_category
CREATE TABLE t_item_category_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  category_id int(16) DEFAULT NULL, 
  category varchar(256) DEFAULT NULL,   
  first_level_subcategory varchar(256) DEFAULT NULL,
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_item_category
DELIMITER $$
CREATE TRIGGER after_insert_t_item_category
    AFTER INSERT ON t_item_category
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_category_audit 
    SET action = 'insert',
	category_id = NEW.category_id, 
	category = NEW.category,
	first_level_subcategory = NEW.first_level_subcategory,
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_item_category
DELIMITER $$
CREATE TRIGGER after_delete_t_item_category
    AFTER DELETE ON t_item_category
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_category_audit
    SET action = 'delete',
	category_id = OLD.category_id,
	category = OLD.category,
	first_level_subcategory = OLD.first_level_subcategory, 
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_item_category
DELIMITER $$
CREATE TRIGGER after_update_t_item_category
    AFTER UPDATE ON t_item_category
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_category_audit
    SET action = 'update',
	category_id = OLD.category_id,
	category = OLD.category,
	first_level_subcategory = OLD.first_level_subcategory, 
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_item_photo
# ------------------------------------------- #
# --This table contains all the item photo information
CREATE TABLE t_item_photo (
  item_photo_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  item_id int(16) NOT NULL,
  photo_name varchar(256) NOT NULL,
  photo_filetype varchar(256) NOT NULL,
  file_path varchar(256) NOT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_item_photo (item_id),
  FOREIGN KEY (item_id)
	REFERENCES t_item(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_item_photo
CREATE TABLE t_item_photo_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  item_photo_id int(16) DEFAULT NULL, 
  item_id int(16) DEFAULT NULL,  
  photo_name varchar(256) DEFAULT NULL,
  photo_filetype varchar(256) DEFAULT NULL,
  file_path varchar(256) DEFAULT NULL,    
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_item_photo
DELIMITER $$
CREATE TRIGGER after_insert_t_item_photo
    AFTER INSERT ON t_item_photo
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_photo_audit 
    SET action = 'insert',
	item_photo_id = NEW.item_photo_id, 
	item_id = NEW.item_id,
	photo_name = NEW.photo_name,
	photo_filetype = NEW.photo_filetype,
	file_path = NEW.file_path,
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_item_photo
DELIMITER $$
CREATE TRIGGER after_delete_t_item_photo
    AFTER DELETE ON t_item_photo
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_photo_audit
    SET action = 'delete',
	item_photo_id = OLD.item_photo_id,
	item_id = OLD.item_id,
	photo_name = OLD.photo_name,
	photo_filetype = OLD.photo_filetype,
	file_path = OLD.file_path,	
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_item_photo
DELIMITER $$
CREATE TRIGGER after_update_t_item_photo
    AFTER UPDATE ON t_item_photo
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_photo_audit
    SET action = 'update',
	item_photo_id = OLD.item_photo_id,
	item_id = OLD.item_id,
	photo_name = OLD.photo_name,
	photo_filetype = OLD.photo_filetype,
	file_path = OLD.file_path,	
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_item_comment
# ------------------------------------------- #
# --This table contains all the item information
CREATE TABLE t_item_comment (
  comment_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  item_id int(16) NOT NULL,
  item_question varchar(256) NOT NULL,
  item_answer varchar(256) NOT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_item_comment (item_id),
  FOREIGN KEY (item_id)
	REFERENCES t_item(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_item_comment
CREATE TABLE t_item_comment_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  comment_id int(16) DEFAULT NULL, 
  item_id int(16) DEFAULT NULL,  
  item_question varchar(256) DEFAULT NULL,
  item_answer varchar(256) DEFAULT NULL,   
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_item_comment
DELIMITER $$
CREATE TRIGGER after_insert_t_item_comment
    AFTER INSERT ON t_item_comment
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_comment_audit 
    SET action = 'insert',
	comment_id = NEW.comment_id, 
	item_id = NEW.item_id,
	item_question = NEW.item_question,
	item_answer = NEW.item_answer,
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_item_comment
DELIMITER $$
CREATE TRIGGER after_delete_t_item_comment
    AFTER DELETE ON t_item_comment
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_comment_audit
    SET action = 'delete',
	comment_id = OLD.comment_id, 
	item_id = OLD.item_id,
	item_question = OLD.item_question,
	item_answer = OLD.item_answer,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_item_comment
DELIMITER $$
CREATE TRIGGER after_update_t_item_comment
    AFTER UPDATE ON t_item_comment
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_comment_audit
    SET action = 'update',
	comment_id = OLD.comment_id, 
	item_id = OLD.item_id,
	item_question = OLD.item_question,
	item_answer = OLD.item_answer,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_item_like
# ------------------------------------------- #
# --This table contains all the item like information
CREATE TABLE t_item_like (
  item_like_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  item_id int(16) NOT NULL,
  item_title varchar(256) NOT NULL,
  liker_id int(16) NOT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_item_like1 (item_id),
  FOREIGN KEY (item_id)
	REFERENCES t_item(item_id), 
  INDEX ind_fk_item_like2 (liker_id),
  FOREIGN KEY (liker_id)
	REFERENCES t_user(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE INDEX ind_t_item_like ON t_item_like (liker_id);


# --This table contains all the audit for t_item_like
CREATE TABLE t_item_like_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  item_like_id int(16) DEFAULT NULL,
  item_id int(16) DEFAULT NULL,
  item_title varchar(256) DEFAULT NULL,
  liker_id int(16) DEFAULT NULL,
  active varchar(3) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_item_like
DELIMITER $$
CREATE TRIGGER after_insert_t_item_like
    AFTER INSERT ON t_item_like
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_like_audit 
    SET action = 'insert',
	item_like_id = NEW.item_like_id,
	item_id = NEW.item_id,
	item_title = NEW.item_title,
	liker_id = NEW.liker_id,
	active = NEW.active,
	remarks = NEW.remarks, 	
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_item_like
DELIMITER $$
CREATE TRIGGER after_delete_t_item_like
    AFTER DELETE ON t_item_like
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_like_audit
    SET action = 'delete',
	item_like_id = OLD.item_like_id,
	item_id = OLD.item_id,
	item_title = OLD.item_title,
	liker_id = OLD.liker_id,	
	active = OLD.active,
	remarks = OLD.remarks, 	
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_item_like
DELIMITER $$
CREATE TRIGGER after_update_t_item_like
    AFTER UPDATE ON t_item_like
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_like_audit
    SET action = 'update',
	item_like_id = OLD.item_like_id,
	item_id = OLD.item_id,
	item_title = OLD.item_title,
	liker_id = OLD.liker_id,
	active = OLD.active,
	remarks = OLD.remarks, 	
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_item_hashtag
# ------------------------------------------- #
# --This table contains all the hashtag information
CREATE TABLE t_item_hashtag (
  hashtag_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  item_id int(16) NOT NULL,
  hashtag varchar(256) NOT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_item_hashtag (item_id),
  FOREIGN KEY (item_id)
	REFERENCES t_item(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_item_hashtag
CREATE TABLE t_item_hashtag_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  hashtag_id int(16) DEFAULT NULL,
  item_id int(16) DEFAULT NULL,
  hashtag varchar(256) DEFAULT NULL,    
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_item_hashtag
DELIMITER $$
CREATE TRIGGER after_insert_t_item_hashtag
    AFTER INSERT ON t_item_hashtag
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_hashtag_audit 
    SET action = 'insert',
	hashtag_id = NEW.hashtag_id, 
	item_id = NEW.item_id,
	hashtag = NEW.hashtag,
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_item_hashtag
DELIMITER $$
CREATE TRIGGER after_delete_t_item_hashtag
    AFTER DELETE ON t_item_hashtag
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_hashtag_audit
    SET action = 'delete',
	hashtag_id = OLD.hashtag_id,
	item_id = OLD.item_id,
	hashtag = OLD.hashtag,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_item_hashtag
DELIMITER $$
CREATE TRIGGER after_update_t_item_hashtag
    AFTER UPDATE ON t_item_hashtag
    FOR EACH ROW 
BEGIN
    INSERT INTO t_item_hashtag_audit
    SET action = 'update',
	hashtag_id = OLD.hashtag_id,
	item_id = OLD.item_id,
	hashtag = OLD.hashtag,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_user_wishlist
# ------------------------------------------- #
# --This table contains all the wishlist information
CREATE TABLE t_user_wishlist (
  wish_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  user_id int(16) NOT NULL,
  wishitem_id int(16) NOT NULL,
  wishitem_title varchar(256) NOT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_user_wishlist1 (user_id),
  FOREIGN KEY (user_id)
	REFERENCES t_user(user_id), 
  INDEX ind_fk_user_wishlist2 (wishitem_id),
  FOREIGN KEY (wishitem_id)
	REFERENCES t_item(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE INDEX ind_t_user_wishlist ON t_user_wishlist (user_id);


# --This table contains all the audit for t_user_wishlist
CREATE TABLE t_user_wishlist_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  wish_id int(16) DEFAULT NULL,
  user_id int(16) DEFAULT NULL,
  wishitem_id int(16) DEFAULT NULL,
  wishitem_title varchar(256) DEFAULT NULL,
  active varchar(3) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_user_wishlist
DELIMITER $$
CREATE TRIGGER after_insert_t_user_wishlist
    AFTER INSERT ON t_user_wishlist
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_wishlist_audit 
    SET action = 'insert',
	wish_id = NEW.wish_id,
	user_id = NEW.user_id,
	wishitem_id = NEW.wishitem_id,
	wishitem_title = NEW.wishitem_title,
	active = NEW.active,
	remarks = NEW.remarks, 	
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_user_wishlist
DELIMITER $$
CREATE TRIGGER after_delete_t_user_wishlist
    AFTER DELETE ON t_user_wishlist
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_wishlist_audit
    SET action = 'delete',
	wish_id = OLD.wish_id,
	user_id = OLD.user_id,
	wishitem_id = OLD.wishitem_id,
	wishitem_title = OLD.wishitem_title,
	active = OLD.active,
	remarks = OLD.remarks, 	
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_user_wishlist
DELIMITER $$
CREATE TRIGGER after_update_t_user_wishlist
    AFTER UPDATE ON t_user_wishlist
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_wishlist_audit
    SET action = 'update',
	wish_id = OLD.wish_id,
	user_id = OLD.user_id,
	wishitem_id = OLD.wishitem_id,
	wishitem_title = OLD.wishitem_title,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_offer
# ------------------------------------------- #
# --This table contains all the offer information
CREATE TABLE t_offer (
  offer_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  buyer_id int(16) NOT NULL,
  item_id int(16) NOT NULL,
  item_title varchar(256) NOT NULL,
  offer_price decimal(13,2) NOT NULL DEFAULT 0.00,  
  offer_status varchar(20) NOT NULL DEFAULT 'pending',
  offer_accepted_by int(16) DEFAULT NULL,
  offer_accepted_date datetime DEFAULT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_offer1 (buyer_id),
  FOREIGN KEY (buyer_id)
	REFERENCES t_user(user_id), 
  INDEX ind_fk_offer2 (item_id),
  FOREIGN KEY (item_id)
	REFERENCES t_item(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_offer
CREATE TABLE t_offer_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  offer_id int(16) DEFAULT NULL,
  buyer_id int(16) DEFAULT NULL,
  item_id int(16) DEFAULT NULL,  
  item_title varchar(256) DEFAULT NULL,
  offer_price decimal(13,2) DEFAULT NULL,  
  offer_status varchar(20) DEFAULT NULL,
  offer_accepted_by int(16) DEFAULT NULL,
  offer_accepted_date datetime DEFAULT NULL, 
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_offer
DELIMITER $$
CREATE TRIGGER after_insert_t_offer
    AFTER INSERT ON t_offer
    FOR EACH ROW 
BEGIN
    INSERT INTO t_offer_audit 
    SET action = 'insert',
	offer_id = NEW.offer_id, 
	buyer_id = NEW.buyer_id,
	item_id = NEW.item_id,
	item_title = NEW.item_title,
	offer_price = NEW.offer_price,	
	offer_status = NEW.offer_status,
	offer_accepted_by = NEW.offer_accepted_by,
	offer_accepted_date = NEW.offer_accepted_date,	
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_offer
DELIMITER $$
CREATE TRIGGER after_delete_t_offer
    AFTER DELETE ON t_offer
    FOR EACH ROW 
BEGIN
    INSERT INTO t_offer_audit
    SET action = 'delete',
	offer_id = OLD.offer_id,
	buyer_id = OLD.buyer_id,
	item_id = OLD.item_id,
	item_title = OLD.item_title,
	offer_price = OLD.offer_price,	
	offer_status = OLD.offer_status,
	offer_accepted_by = OLD.offer_accepted_by,
	offer_accepted_date = OLD.offer_accepted_date,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_offer
DELIMITER $$
CREATE TRIGGER after_update_t_offer
    AFTER UPDATE ON t_offer
    FOR EACH ROW 
BEGIN
    INSERT INTO t_offer_audit
    SET action = 'update',
	offer_id = OLD.offer_id,
	buyer_id = OLD.buyer_id,
	item_id = OLD.item_id,
	item_title = OLD.item_title,
	offer_price = OLD.offer_price,	
	offer_status = OLD.offer_status,
	offer_accepted_by = OLD.offer_accepted_by,
	offer_accepted_date = OLD.offer_accepted_date,
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_buysell_history
# ------------------------------------------- #
# --This table contains all the user buysell history information
CREATE TABLE t_buysell_history (
  buysell_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  offer_id int(16) NOT NULL,
  buyer_id int(16) NOT NULL,
  seller_id int(16) NOT NULL,
  item_id int(16) NOT NULL,
  item_title varchar(256) NOT NULL,
  item_category varchar(256) NOT NULL,
  item_description varchar(256) DEFAULT NULL,
  item_condition varchar(4) NOT NULL,
  item_location varchar(256) DEFAULT NULL,
  item_delivery_mode varchar(256) DEFAULT NULL,
  item_like_count int(16) NOT NULL DEFAULT 0,
  item_status varchar(20) NOT NULL DEFAULT 'sold',
  shipping_fee decimal(13,2) NOT NULL DEFAULT 0.00,
  sold_price decimal(13,2) NOT NULL DEFAULT 0.00,
  sold_date datetime DEFAULT CURRENT_TIMESTAMP,  
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_buysell_history1 (offer_id),
  FOREIGN KEY (offer_id)
	REFERENCES t_offer(offer_id),
  INDEX ind_fk_buysell_history2 (buyer_id),
  FOREIGN KEY (buyer_id)
	REFERENCES t_user(user_id),
  INDEX ind_fk_buysell_history3 (seller_id),
  FOREIGN KEY (seller_id)
	REFERENCES t_user(user_id),
  INDEX ind_fk_buysell_history4 (item_id),
  FOREIGN KEY (item_id)
	REFERENCES t_item(item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_buysell_history
CREATE TABLE t_buysell_history_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  buysell_id int(16) DEFAULT NULL,
  offer_id int(16) DEFAULT NULL,
  buyer_id int(16) DEFAULT NULL,
  seller_id int(16) DEFAULT NULL,
  item_id int(16) DEFAULT NULL,  
  item_title varchar(256) DEFAULT NULL,
  item_category varchar(256) DEFAULT NULL,
  item_description varchar(256) DEFAULT NULL,
  item_condition varchar(4) DEFAULT NULL,
  item_location varchar(256) DEFAULT NULL,
  item_delivery_mode varchar(256) DEFAULT NULL,
  item_like_count int(16) DEFAULT NULL,
  item_status varchar(20) DEFAULT NULL,
  shipping_fee decimal(13,2) DEFAULT NULL,
  sold_price decimal(13,2) DEFAULT NULL,
  sold_date datetime DEFAULT NULL,  
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_buysell_history
DELIMITER $$
CREATE TRIGGER after_insert_t_buysell_history
    AFTER INSERT ON t_buysell_history
    FOR EACH ROW 
BEGIN
    INSERT INTO t_buysell_history_audit 
    SET action = 'insert',
	buysell_id = NEW.buysell_id,
	offer_id = NEW.offer_id,
	buyer_id = NEW.buyer_id,
	seller_id = NEW.seller_id,
	item_id = NEW.item_id,
	item_title = NEW.item_title,	
	item_category = NEW.item_category,
	item_description = NEW.item_description,
	item_condition = NEW.item_condition,
	item_location = NEW.item_location,
	item_delivery_mode = NEW.item_delivery_mode,
	item_like_count = NEW.item_like_count,	
	item_status = NEW.item_status,
	shipping_fee = NEW.shipping_fee,	
	sold_price = NEW.sold_price,
	sold_date = NEW.sold_date,
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_buysell_history
DELIMITER $$
CREATE TRIGGER after_delete_t_buysell_history
    AFTER DELETE ON t_buysell_history
    FOR EACH ROW 
BEGIN
    INSERT INTO t_buysell_history_audit
    SET action = 'delete',
	buysell_id = OLD.buysell_id,
	offer_id = OLD.offer_id,
	buyer_id = OLD.buyer_id,
	seller_id = OLD.seller_id,
	item_id = OLD.item_id,
	item_title = OLD.item_title,	
	item_category = OLD.item_category,
	item_description = OLD.item_description,
	item_condition = OLD.item_condition,
	item_location = OLD.item_location,
	item_delivery_mode = OLD.item_delivery_mode,
	item_like_count = OLD.item_like_count,	
	item_status = OLD.item_status,
	shipping_fee = OLD.shipping_fee,	
	sold_price = OLD.sold_price,
	sold_date = OLD.sold_date,	
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_buysell_history
DELIMITER $$
CREATE TRIGGER after_update_t_buysell_history
    AFTER UPDATE ON t_buysell_history
    FOR EACH ROW 
BEGIN
    INSERT INTO t_buysell_history_audit
    SET action = 'update',
	buysell_id = OLD.buysell_id,
	offer_id = OLD.offer_id,
	buyer_id = OLD.buyer_id,
	seller_id = OLD.seller_id,
	item_id = OLD.item_id,
	item_title = OLD.item_title,	
	item_category = OLD.item_category,
	item_description = OLD.item_description,
	item_condition = OLD.item_condition,
	item_location = OLD.item_location,
	item_delivery_mode = OLD.item_delivery_mode,
	item_like_count = OLD.item_like_count,	
	item_status = OLD.item_status,
	shipping_fee = OLD.shipping_fee,	
	sold_price = OLD.sold_price,
	sold_date = OLD.sold_date,	
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# ------------------------------------------- #
# --t_user_buysell_rating
# ------------------------------------------- #
# --This table contains all the user buysell rating information
CREATE TABLE t_user_buysell_rating (
  rating_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  buysell_id int(16) NOT NULL,
  buyer_id int(16) NOT NULL,
  buyer_username varchar(256) NOT NULL,
  buyer_to_seller_feedback varchar(256) NOT NULL,
  buyer_to_seller_rating varchar(20) NOT NULL,
  seller_id int(16) NOT NULL,
  seller_username varchar(256) NOT NULL,
  seller_to_buyer_feedback varchar(256) NOT NULL,
  seller_to_buyer_rating varchar(20) NOT NULL,
  active varchar(3) NOT NULL DEFAULT 'yes',
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) NOT NULL DEFAULT 'self',
  created_date datetime DEFAULT CURRENT_TIMESTAMP,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime ON UPDATE CURRENT_TIMESTAMP,
  INDEX ind_fk_user_buysell_rating1 (buysell_id),
  FOREIGN KEY (buysell_id)
	REFERENCES t_buysell_history(buysell_id),
  INDEX ind_fk_user_buysell_rating2 (buyer_id),
  FOREIGN KEY (buyer_id)
	REFERENCES t_user(user_id),
  INDEX ind_fk_user_buysell_rating3 (seller_id),
  FOREIGN KEY (seller_id)
	REFERENCES t_user(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This table contains all the audit for t_user_buysell_rating
CREATE TABLE t_user_buysell_rating_audit (
  action_log_id int(16) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  action varchar(10) DEFAULT NULL,
  action_date datetime DEFAULT CURRENT_TIMESTAMP,
  buysell_id int(16) DEFAULT NULL,
  buyer_id int(16) DEFAULT NULL,
  buyer_username varchar(256) DEFAULT NULL,
  buyer_to_seller_feedback varchar(256) DEFAULT NULL,
  buyer_to_seller_rating varchar(20) DEFAULT NULL,
  seller_id int(16) DEFAULT NULL,
  seller_username varchar(256) DEFAULT NULL,
  seller_to_buyer_feedback varchar(256) DEFAULT NULL,
  seller_to_buyer_rating varchar(20) DEFAULT NULL,  
  active varchar(3) DEFAULT NULL,
  remarks varchar(256) DEFAULT NULL,
  created_by varchar(256) DEFAULT NULL,
  created_date datetime DEFAULT NULL,
  last_updated_by varchar(256) DEFAULT NULL,
  last_updated_date datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# --This after insert trigger is for t_user_buysell_rating
DELIMITER $$
CREATE TRIGGER after_insert_t_user_buysell_rating
    AFTER INSERT ON t_user_buysell_rating
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_buysell_rating_audit 
    SET action = 'insert',
	buysell_id = NEW.buysell_id,
	buyer_id = NEW.buyer_id,
	buyer_username = NEW.buyer_username,
	buyer_to_seller_feedback = NEW.buyer_to_seller_feedback,
	buyer_to_seller_rating = NEW.buyer_to_seller_rating,
	seller_id = NEW.seller_id,	
	seller_username = NEW.seller_username,	
	seller_to_buyer_feedback = NEW.seller_to_buyer_feedback,	
	seller_to_buyer_rating = NEW.seller_to_buyer_rating,	
	active = NEW.active,
	remarks = NEW.remarks, 
    created_by = NEW.created_by,
	created_date = NEW.created_date,
	last_updated_by = NEW.last_updated_by,
	last_updated_date = NEW.last_updated_date;
END$$
DELIMITER ;


# --This after delete trigger is for t_user_buysell_rating
DELIMITER $$
CREATE TRIGGER after_delete_t_user_buysell_rating
    AFTER DELETE ON t_user_buysell_rating
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_buysell_rating_audit
    SET action = 'delete',
	buysell_id = OLD.buysell_id,
	buyer_id = OLD.buyer_id,
	buyer_username = OLD.buyer_username,
	buyer_to_seller_feedback = OLD.buyer_to_seller_feedback,
	buyer_to_seller_rating = OLD.buyer_to_seller_rating,
	seller_id = OLD.seller_id,	
	seller_username = OLD.seller_username,	
	seller_to_buyer_feedback = OLD.seller_to_buyer_feedback,	
	seller_to_buyer_rating = OLD.seller_to_buyer_rating,	
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;


# --This after update trigger is for t_user_buysell_rating
DELIMITER $$
CREATE TRIGGER after_update_t_user_buysell_rating
    AFTER UPDATE ON t_user_buysell_rating
    FOR EACH ROW 
BEGIN
    INSERT INTO t_user_buysell_rating_audit
    SET action = 'update',
	buysell_id = OLD.buysell_id,
	buyer_id = OLD.buyer_id,
	buyer_username = OLD.buyer_username,
	buyer_to_seller_feedback = OLD.buyer_to_seller_feedback,
	buyer_to_seller_rating = OLD.buyer_to_seller_rating,
	seller_id = OLD.seller_id,	
	seller_username = OLD.seller_username,	
	seller_to_buyer_feedback = OLD.seller_to_buyer_feedback,	
	seller_to_buyer_rating = OLD.seller_to_buyer_rating,	
	active = OLD.active,
	remarks = OLD.remarks, 
    created_by = OLD.created_by,
	created_date = OLD.created_date,
	last_updated_by = OLD.last_updated_by,
	last_updated_date = OLD.last_updated_date;
END$$
DELIMITER ;