set names UTF8;

CREATE DATABASE "C:\Coding\melange\melange_kkm\Win32\Debug\kkm_base.fdb"
     USER 'sysdba' PASSWORD 'masterkey';
--KKM Wisp main base

CREATE TABLE Cats(
    id          INTEGER           NOT NULL,
    caption     VARCHAR (400)     NOT NULL,
    parent_id   INTEGER,
    actual      INTEGER default 1 NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Goods(
    id          INTEGER                NOT NULL,
    caption     VARCHAR (800)          NOT NULL,
    parent_cat  INTEGER default 0,
    createdAt   TIMESTAMP              NOT NULL,
    actual      INTEGER default 1      NOT NULL,
    flag        INTEGER default 1,     
    PRIMARY KEY(id)
);

CREATE TABLE Priced_goods(
    id          INTEGER                NOT NULL,
    price       FLOAT                  NOT NULL,
    good_id     INTEGER                NOT NULL,
    createdAt   TIMESTAMP              NOT NULL,
    action_able INTEGER default 0      NOT NULL,
    expiredAt   TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(good_id) REFERENCES Goods(id) ON DELETE CASCADE
);

CREATE TABLE Measures(
    id          INTEGER                NOT NULL,
    caption     VARCHAR(100)           NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Ingredients(
    id          INTEGER                NOT NULL,
    caption     VARCHAR(800)           NOT NULL,
    createdAt   TIMESTAMP              NOT NULL,
    expiredAt   TIMESTAMP,
    measure_id  INTEGER                NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(measure_id) REFERENCES Measures(id) ON DELETE CASCADE
);

CREATE TABLE Recipes(
    id          INTEGER                NOT NULL,
    good_id     INTEGER                NOT NULL,
    createdAt   TIMESTAMP              NOT NULL,
    expiredAt   TIMESTAMP,
    ingr_id     INTEGER                NOT NULL,
    amount      FLOAT                  NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(good_id) REFERENCES Goods(id) ON DELETE CASCADE,
    FOREIGN KEY(ingr_id) REFERENCES Ingredients(id) ON DELETE CASCADE
);

CREATE TABLE Sessions(
    id       INTEGER   NOT NULL,
    dt_start TIMESTAMP NOT NULL,
    dt_end   TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE discounts (
    id     INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    used   INTEGER DEFAULT 0,
    seria  INTEGER,
    number INTEGER,
    key    VARCHAR(30),
    PRIMARY KEY(id)
);

CREATE TABLE Sales(
    id          INTEGER   NOT NULL,
    dt          TIMESTAMP NOT NULL,
    sess_id     INTEGER   NOT NULL,
    sale_type   INTEGER   NOT NULL, --cash == 0 cashfree == 1
    discount_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY (sess_id) REFERENCES Sessions(id) ON DELETE CASCADE
);

CREATE TABLE Sale_goods(
    sale_id                INTEGER NOT NULL,
    good_id                INTEGER NOT NULL,
    amount                 FLOAT,
    action_amount          FLOAT,
    FOREIGN KEY(sale_id) REFERENCES Sales(id) ON DELETE CASCADE,
    FOREIGN KEY(good_id) REFERENCES Priced_goods(id) ON DELETE CASCADE
);

CREATE TABLE Cash_actions(
    id            INTEGER        NOT NULL,
    cash          FLOAT          NOT NULL,
    dt            TIMESTAMP,
    tip           VARCHAR (800),
    action_type   INTEGER        NOT NULL, --1 == income, 2 == outcome, 3 == encashment
    sess_id       INTEGER        NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (sess_id) REFERENCES Sessions(id) ON DELETE CASCADE
);

CREATE TABLE Ingredient_recipes(
    id INTEGER NOT NULL,
    src_id INTEGER NOT NULL,
    part_id INTEGER NOT NULL,
    createdAt TIMESTAMP NOT NULL,
    expiredAt TIMESTAMP,
    amount FLOAT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(src_id) REFERENCES Ingredients(id) ON DELETE CASCADE,
    FOREIGN KEY(part_id) REFERENCES Ingredients(id) ON DELETE CASCADE
);

CREATE GENERATOR GEN_GOODS_ID;
CREATE GENERATOR GEN_SALES_ID;
CREATE GENERATOR GEN_CASH_ID;
CREATE GENERATOR GEN_CATS_ID;
CREATE GENERATOR GEN_SESS_ID;
CREATE GENERATOR GEN_PRICED_GOODS_ID;
CREATE GENERATOR GEN_DISCOUNTS_ID;
CREATE GENERATOR GEN_INGREDIENTS_ID;
CREATE GENERATOR GEN_RECIPES_ID;
CREATE GENERATOR GEN_MEASURES_ID;
CREATE GENERATOR GEN_INGREDIENT_RECIPES_ID;

SET term ^;
CREATE TRIGGER trig_MEASURES_IDS for Measures
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.id = GEN_ID(GEN_MEASURES_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_RECIPES_IDS for Recipes
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.createdAt = CURRENT_TIMESTAMP;
        new.id = GEN_ID(GEN_RECIPES_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_INGREDIENTS_IDS for Ingredients
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.createdAt = CURRENT_TIMESTAMP;
        new.id = GEN_ID(GEN_INGREDIENTS_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_DISCOUNTS_IDS for Discounts
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.id = GEN_ID(GEN_DISCOUNTS_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_PRICED_GOODS_ID for Priced_goods
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.createdAt = CURRENT_TIMESTAMP;
        new.id = GEN_ID(GEN_PRICED_GOODS_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_GOODS_ID for Goods
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.createdAt = CURRENT_TIMESTAMP;
        new.id = GEN_ID(GEN_GOODS_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_SALES_ID for Sales
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.id = GEN_ID(GEN_SALES_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_CASH_ACTIONS_ID for Cash_actions
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.id = GEN_ID(GEN_CASH_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_CATS_ID for Cats
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.id = GEN_ID(GEN_CATS_ID, 1);
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_SESS_ID for Sessions
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.id = GEN_ID(GEN_SESS_ID, 1);
        new.dt_start = CURRENT_TIMESTAMP;
    END^
SET term ;^

SET term ^;
CREATE TRIGGER trig_INGREDIENT_RECIPES_IDS for Ingredient_recipes
ACTIVE BEFORE INSERT POSITION 0
AS
    BEGIN
        new.createdAt = CURRENT_TIMESTAMP;
        new.id = GEN_ID(GEN_INGREDIENT_RECIPES_ID, 1);
    END^
SET term ;^

COMMIT;