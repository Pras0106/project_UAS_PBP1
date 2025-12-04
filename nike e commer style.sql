/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     04/12/2025 16:36:24                          */
/* Fixed version - Resolved circular dependencies and keywords */
/*==============================================================*/

SET FOREIGN_KEY_CHECKS = 0;

-- Drop tables in correct order
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS RELATIONSHIP_1;
DROP TABLE IF EXISTS GAMBAR_ITEM;
DROP TABLE IF EXISTS DETAIL_ORDER;
DROP TABLE IF EXISTS ORDER_HISTORY;
DROP TABLE IF EXISTS `ORDER`;
DROP TABLE IF EXISTS CART;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS CATEGORI;
DROP TABLE IF EXISTS USERS;

SET FOREIGN_KEY_CHECKS = 1;

/*==============================================================*/
/* Table: USERS (renamed from USER - reserved keyword)         */
/*==============================================================*/
CREATE TABLE USERS (
   ID_USER INT NOT NULL AUTO_INCREMENT,
   USERNAME VARCHAR(256) NOT NULL,
   PASSWORD VARCHAR(256) NOT NULL,
   EMAIL VARCHAR(256) NOT NULL UNIQUE,
   ALAMAT TEXT,
   TYPE VARCHAR(50) DEFAULT 'customer',
   CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (ID_USER)
);

/*==============================================================*/
/* Table: CATEGORI                                              */
/*==============================================================*/
CREATE TABLE CATEGORI (
   ID_CATEGORI INT NOT NULL AUTO_INCREMENT,
   NAMA_KATEGORI VARCHAR(256) NOT NULL,
   PRIMARY KEY (ID_CATEGORI)
);

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
CREATE TABLE PRODUCT (
   ID_PRODUCT INT NOT NULL AUTO_INCREMENT,
   NAMA_PRODUK VARCHAR(256) NOT NULL,
   DESKRIPSI_PRODUK TEXT,
   UKURAN VARCHAR(256),
   WARNA VARCHAR(256),
   RATING_PRODUK DECIMAL(3,2) DEFAULT 0.00,
   HARGA DECIMAL(15,2) NOT NULL,
   STOCK INT DEFAULT 0,
   CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (ID_PRODUCT)
);

/*==============================================================*/
/* Table: RELATIONSHIP_1 (Product-Category junction)            */
/*==============================================================*/
CREATE TABLE RELATIONSHIP_1 (
   ID_PRODUCT INT NOT NULL,
   ID_CATEGORI INT NOT NULL,
   PRIMARY KEY (ID_PRODUCT, ID_CATEGORI)
);

/*==============================================================*/
/* Table: GAMBAR_ITEM                                           */
/*==============================================================*/
CREATE TABLE GAMBAR_ITEM (
   ID_GAMBAR_ITEM INT NOT NULL AUTO_INCREMENT,
   ID_PRODUCT INT NOT NULL,
   URL_GAMBAR VARCHAR(256),
   GAMBAR_ITEM LONGBLOB,
   IS_PRIMARY BOOLEAN DEFAULT FALSE,
   PRIMARY KEY (ID_GAMBAR_ITEM)
);

/*==============================================================*/
/* Table: ORDER                                                 */
/*==============================================================*/
CREATE TABLE `ORDER` (
   ID_ORDER INT NOT NULL AUTO_INCREMENT,
   ID_USER INT NOT NULL,
   TANGGAL_ORDER TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   STATUS_ORDER VARCHAR(50) DEFAULT 'pending',
   TOTAL_AMOUNT DECIMAL(15,2) DEFAULT 0.00,
   PRIMARY KEY (ID_ORDER)
);

/*==============================================================*/
/* Table: DETAIL_ORDER                                          */
/*==============================================================*/
CREATE TABLE DETAIL_ORDER (
   ID_DETAIL_ORDER INT NOT NULL AUTO_INCREMENT,
   ID_ORDER INT NOT NULL,
   ID_PRODUCT INT NOT NULL,
   QUANTITY_ITEM INT NOT NULL DEFAULT 1,
   PRICE_PER_ITEM DECIMAL(15,2) NOT NULL,
   SUBTOTAL DECIMAL(15,2) NOT NULL,
   PRIMARY KEY (ID_DETAIL_ORDER)
);

/*==============================================================*/
/* Table: ORDER_HISTORY                                         */
/*==============================================================*/
CREATE TABLE ORDER_HISTORY (
   ID_HISTORY INT NOT NULL AUTO_INCREMENT,
   ID_ORDER INT NOT NULL,
   STATUS_LAMA VARCHAR(50),
   STATUS_BARU VARCHAR(50),
   TANGGAL_PERUBAHAN TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   KETERANGAN TEXT,
   PRIMARY KEY (ID_HISTORY)
);

/*==============================================================*/
/* Table: CART                                                  */
/*==============================================================*/
CREATE TABLE CART (
   ID_CART INT NOT NULL AUTO_INCREMENT,
   ID_USER INT NOT NULL,
   ID_PRODUCT INT NOT NULL,
   QUANTITY INT NOT NULL DEFAULT 1,
   ADDED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (ID_CART)
);

/*==============================================================*/
/* Table: REVIEW                                                */
/*==============================================================*/
CREATE TABLE REVIEW (
   ID_REVIEW INT NOT NULL AUTO_INCREMENT,
   ID_USER INT NOT NULL,
   ID_PRODUCT INT NOT NULL,
   KOMENTAR TEXT,
   RATING INT CHECK (RATING BETWEEN 1 AND 5),
   CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (ID_REVIEW)
);

/*==============================================================*/
/* Add Foreign Key Constraints                                  */
/*==============================================================*/

-- Product-Category relationship
ALTER TABLE RELATIONSHIP_1
   ADD CONSTRAINT FK_REL_PRODUCT FOREIGN KEY (ID_PRODUCT)
   REFERENCES PRODUCT (ID_PRODUCT) ON DELETE CASCADE;

ALTER TABLE RELATIONSHIP_1
   ADD CONSTRAINT FK_REL_CATEGORY FOREIGN KEY (ID_CATEGORI)
   REFERENCES CATEGORI (ID_CATEGORI) ON DELETE CASCADE;

-- Product images
ALTER TABLE GAMBAR_ITEM 
   ADD CONSTRAINT FK_GAMBAR_PRODUCT FOREIGN KEY (ID_PRODUCT)
   REFERENCES PRODUCT (ID_PRODUCT) ON DELETE CASCADE;

-- Orders
ALTER TABLE `ORDER`
   ADD CONSTRAINT FK_ORDER_USER FOREIGN KEY (ID_USER)
   REFERENCES USERS (ID_USER) ON DELETE CASCADE;

-- Order details
ALTER TABLE DETAIL_ORDER 
   ADD CONSTRAINT FK_DORDER_ORDER FOREIGN KEY (ID_ORDER)
   REFERENCES `ORDER` (ID_ORDER) ON DELETE CASCADE;

ALTER TABLE DETAIL_ORDER 
   ADD CONSTRAINT FK_DORDER_PRODUCT FOREIGN KEY (ID_PRODUCT)
   REFERENCES PRODUCT (ID_PRODUCT) ON DELETE RESTRICT;

-- Order history
ALTER TABLE ORDER_HISTORY
   ADD CONSTRAINT FK_HISTORY_ORDER FOREIGN KEY (ID_ORDER)
   REFERENCES `ORDER` (ID_ORDER) ON DELETE CASCADE;

-- Cart
ALTER TABLE CART 
   ADD CONSTRAINT FK_CART_USER FOREIGN KEY (ID_USER)
   REFERENCES USERS (ID_USER) ON DELETE CASCADE;

ALTER TABLE CART 
   ADD CONSTRAINT FK_CART_PRODUCT FOREIGN KEY (ID_PRODUCT)
   REFERENCES PRODUCT (ID_PRODUCT) ON DELETE CASCADE;

-- Reviews
ALTER TABLE REVIEW
   ADD CONSTRAINT FK_REVIEW_PRODUCT FOREIGN KEY (ID_PRODUCT)
   REFERENCES PRODUCT (ID_PRODUCT) ON DELETE CASCADE;

ALTER TABLE REVIEW
   ADD CONSTRAINT FK_REVIEW_USER FOREIGN KEY (ID_USER)
   REFERENCES USERS (ID_USER) ON DELETE CASCADE;

-- Add indexes for better performance
CREATE INDEX idx_cart_user ON CART(ID_USER);
CREATE INDEX idx_order_user ON `ORDER`(ID_USER);
CREATE INDEX idx_order_status ON `ORDER`(STATUS_ORDER);
CREATE INDEX idx_product_rating ON PRODUCT(RATING_PRODUK);
CREATE INDEX idx_review_product ON REVIEW(ID_PRODUCT);
CREATE INDEX idx_detail_order ON DETAIL_ORDER(ID_ORDER);