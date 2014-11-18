<?php

use yii\db\Schema;
use yii\db\Migration;

class m141118_100930_add_tbl_import extends Migration
{
    public function up()
    {
        $this->execute("CREATE TABLE `import` (
                            `id` INT NOT NULL AUTO_INCREMENT,
                          `file` VARCHAR(120) NOT NULL,
                          `imported` DATETIME NOT NULL,
                          PRIMARY KEY (`id`))"
        );
    }

    public function down()
    {
        echo "m141118_100930_add_tbl_import cannot be reverted.\n";

        return false;
    }
}
