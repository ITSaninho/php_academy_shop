<?php

use yii\db\Migration;

class m170314_104456_create_table_category extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{category}}', [
            'id' => $this->primaryKey(),
            'parent_id' => $this->int(10),
            'name' => $this->string(100)->notNull(),
            'keywords' => $this->string(255),
            'description' => $this->string(255),
        ]);
    }

    public function safeDown()
    {
        $this->dropTable('{{category}}');
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
