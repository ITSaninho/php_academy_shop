<?php

use yii\db\Migration;

class m170314_110628_create_table_order_items extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{order_items}}', [
            'id' => $this->primaryKey(),
            'order_id' => $this->int(11)->notNull(),
            'product_id' => $this->int(11)->notNull(),
            'name' => $this->string(255),
            'price' => $this->integer(11)->notNull(),
            'qty_item' => $this->integer(11)->notNull(),
            'sum_item' => $this->integer(11)->notNull(),
        ]);
    }

    public function safeDown()
    {
        $this->dropTable('{{order_items}}');
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
