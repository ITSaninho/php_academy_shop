<?php

use yii\db\Migration;

class m170314_105142_create_table_product extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{product}}', [
            'id' => $this->primaryKey(),
            'category_id' => $this->int(10),
            'name' => $this->string(255),
            'content' => $this->text(),
            'price' => $this->integer()->notNull(),
            'keywords' => $this->text(),
            'description' => $this->string(255),
            'img' => $this->string(255)->defaultValue('no-image.png'),
            'hit' => $this->enum('0', '1'),
            'new' => $this->enum('0', '1'),
            'sale' => $this->enum('0', '1'),
        ]);
    }

    public function safeDown()
    {
        $this->dropTable('{{product}}');
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
