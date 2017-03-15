<?php

use yii\db\Migration;

class m170314_104827_create_table_comment extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{comment}}', [
            'id' => $this->primaryKey(),
            'text' => $this->string(255),
            'user_id' => $this->int(10),
            'product_id' => $this->int(10),
            'status' => $this->int(11),
            'date' => $this->int(11),
        ]);
    }

    public function safeDown()
    {
        $this->dropTable('{{comment}}');
    }

    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }

    public function safeDown()
    {
    }
    */
}
