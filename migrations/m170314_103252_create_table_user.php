<?php

use yii\db\Migration;

class m170314_103252_create_table_user extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{user}}', [
            'id' => $this->primaryKey(),
            'username' => $this->string()->notNull()->unique(),
            'email' => $this->string()->notNull()->unique(),
            'password_hash' => $this->string()->notNull(),
            'first_name' => $this->string(100)->notNull(),
            'second_name' => $this->string(100)->notNull(),
            'middle_name' => $this->string(100)->notNull(),
            'address' => $this->string(100)->notNull(),
            'rols' => $this->int(2)->notNull()->defaultValue('1'),
            'status' => $this->smallint(6)->notNull(),
            'auth_key' => $this->string(32)->notNull(),
            'created_date' => $this->int(11),
            'created_date' => $this->int(11),
            'secret_key' => $this->string(255),
        ]);
    }

    public function safeDown()
    {
        $this->dropTable('{{user}}');
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
