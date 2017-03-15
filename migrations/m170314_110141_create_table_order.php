<?php

use yii\db\Migration;

class m170314_110141_create_table_order extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{order}}', [
            'id' => $this->primaryKey(),
            'created_at' => $this->datetime(),
            'updated_at' => $this->datetime(),
            'qty' => $this->int(11)->notNull(),
            'sum' => $this->integer(11)->notNull(),
            'status' => $this->enum('0', '1'),
            'name' => $this->string(255),
            'email' => $this->string(255),
            'phone' => $this->string(255),
            'address' => $this->string(255),
        ]);
    }

    public function safeDown()
    {
        $this->dropTable('{{order}}');
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
