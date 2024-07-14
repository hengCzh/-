CREATE DATABASE hydrops;
use hydrops;
CREATE TABLE user (
                      user_id int PRIMARY KEY,
                      username varchar(50) NOT NULL,
                      password varchar(50) NOT NULL

    -- 其他相关用户信息列
);
CREATE TABLE location (
                          location_id int PRIMARY KEY,
                          location_name varchar(100) NOT NULL,
                          latitude decimal(9,6),
                          longitude decimal(9,6)
    -- 其他相关位置信息列
);
CREATE TABLE real_time_data (
                                data_id int PRIMARY KEY,
                                location_id int,
                                timestamp timestamp NOT NULL,
                                water_level decimal(10,2),
                                rainfall decimal(10,2),
                                FOREIGN KEY (location_id) REFERENCES location(location_id)
    -- 其他相关传感器数据列
);
CREATE TABLE processed_data (
                                processed_data_id int PRIMARY KEY,
                                data_id int,
                                is_water_present boolean,
                                water_area decimal(10,2),
                                FOREIGN KEY (data_id) REFERENCES real_time_data(data_id)
    -- 其他相关处理后的数据列
);
CREATE TABLE model_parameters (
                                  model_id int PRIMARY KEY,
                                  location_id int,
                                  timestamp timestamp NOT NULL,
                                  is_water_present boolean,
                                  water_area decimal(10,2),
                                  FOREIGN KEY (location_id) REFERENCES location(location_id)
    -- 其他相关模型参数信息列
);

