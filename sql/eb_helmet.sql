
use eb_helmet;



SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eb_rider
-- ----------------------------
DROP TABLE IF EXISTS `eb_rider`;
CREATE TABLE `eb_rider`  (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `device` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
                             `identitie` int(11) NOT NULL,
                             `lane` tinyint(4) NOT NULL,
                             `direction` tinyint(4) NOT NULL,
                             `helmet` tinyint(4) NOT NULL,
                             `path` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
                             `time` datetime(0) NOT NULL,
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for webcam
-- ----------------------------
DROP TABLE IF EXISTS `webcam`;
CREATE TABLE `webcam`  (
                           `device` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
                           `longitude` float(9, 6) NOT NULL,
  `latitude` float(9, 6) NOT NULL,
  `source` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`device`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
use eb_helmet;
ALTER TABLE `webcam`
    MODIFY COLUMN `device` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;

INSERT INTO webcam (device, longitude, latitude, source)
VALUES
    ('设备1', 123.456789, 45.678901, 'rtsp://example.com/stream1'),
    ('设备2', 111.222333, 55.666777, 'rtsp://example.com/stream2'),
    ('设备3', 99.888777, 33.444555, 'rtsp://example.com/stream3');

SET FOREIGN_KEY_CHECKS = 1;
