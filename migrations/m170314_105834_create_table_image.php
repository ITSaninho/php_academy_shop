<?php

use yii\db\Migration;

class m170314_105834_create_table_image extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{image}}', [
            'id' => $this->primaryKey(),
            'filePath' => $this->string(255),
            'isMain' => $this->int(1),
            'itemId' => $this->int(10),
            'modelName' => $this->string(255),
            'urlAlias' => $this->string(255),
            'name' => $this->string(255),
        ]);
    }

    public function safeDown()
    {
        $this->dropTable('{{image}}');
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
