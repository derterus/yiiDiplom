<?php

use yii\db\Migration;

/**
 * Class m241115_014353_SmartWatchMagazine
 */
class m241115_014353_SmartWatchMagazine extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        // Таблица категорий
        $this->createTable('{{%categories}}', [
            'id' => $this->primaryKey(),
            'Название' => $this->string()->notNull(),
            'Описание' => $this->text()->null(),
        ]);

        // Таблица производителей
        $this->createTable('{{%manufacturers}}', [
            'id' => $this->primaryKey(),
            'Название' => $this->string()->notNull(),
            'Страна' => $this->string(100)->null(),
        ]);

        // Таблица характеристик
        $this->createTable('{{%characteristics}}', [
            'id' => $this->primaryKey(),
            'Название' => $this->string()->notNull(),
            'Описание' => $this->text()->null(),
        ]);

        // Таблица продукции (умных часов)
        $this->createTable('{{%products}}', [
            'id' => $this->primaryKey(),
            'Название' => $this->string()->notNull(),
            'Цена' => $this->decimal(10, 2)->notNull(),
            'Описание' => $this->text()->null(),
            'category_id' => $this->integer()->null(),  // Идентификатор категории
            'manufacturer_id' => $this->integer()->null(),  // Идентификатор производителя
            'Вес' => $this->decimal(10, 2)->null(),  // Вес продукта
            'SKU' => $this->string(100)->null(),  // Уникальный код товара
            'Количество_на_складе' => $this->integer()->notNull()->defaultValue(0),  // Количество на складе
            'Дата_создания' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP'),
            'Дата_обновления' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'),
        ]);

        // Внешние ключи для продукции
        $this->addForeignKey('fk-products-category', '{{%products}}', 'category_id', '{{%categories}}', 'id', 'SET NULL', 'CASCADE');
        $this->addForeignKey('fk-products-manufacturer', '{{%products}}', 'manufacturer_id', '{{%manufacturers}}', 'id', 'SET NULL', 'CASCADE');

        // Таблица отзывов
        $this->createTable('{{%reviews}}', [
            'id' => $this->primaryKey(),
            'user_id' => $this->integer()->notNull(),
            'product_id' => $this->integer()->notNull(),
            'Оценка' => $this->integer()->notNull(),
            'Текст' => $this->text()->null(),
            'Дата' => $this->dateTime()->defaultExpression('CURRENT_TIMESTAMP'),
        ]);

        // Внешние ключи для отзывов
        $this->addForeignKey('fk-reviews-user', '{{%reviews}}', 'user_id', '{{%user}}', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk-reviews-product', '{{%reviews}}', 'product_id', '{{%products}}', 'id', 'CASCADE', 'CASCADE');

        // Таблица характеристик продукции
        $this->createTable('{{%product_characteristics}}', [
            'id' => $this->primaryKey(),
            'product_id' => $this->integer()->notNull(),  // Связь с продуктом
            'characteristic_id' => $this->integer()->notNull(),  // Связь с характеристикой
            'value' => $this->string(255)->notNull(),  // Значение характеристики (например, "1.5 дюйма")
        ]);

        // Внешний ключ для характеристик продукции
        $this->addForeignKey('fk-product_characteristics-product_id','{{%product_characteristics}}','product_id','{{%products}}','id','CASCADE','CASCADE');
        $this->addForeignKey('fk-product_characteristics-characteristic_id','{{%product_characteristics}}','characteristic_id','{{%characteristics}}','id','CASCADE','CASCADE');
        
        // Таблица изображений продукции
        $this->createTable('{{%product_images}}', [
            'id' => $this->primaryKey(),
            'product_id' => $this->integer()->notNull(),
            'URL_изображения' => $this->string(255)->notNull(),
            'Основное_изображение' => $this->boolean()->notNull()->defaultValue(false),
        ]);

        // Внешний ключ для изображений продукции
        $this->addForeignKey('fk-product_images-product', '{{%product_images}}', 'product_id', '{{%products}}', 'id', 'CASCADE', 'CASCADE');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        // Удаление внешних ключей
        $this->dropForeignKey('fk-product_images-product', '{{%product_images}}');
        $this->dropForeignKey('fk-product_characteristics-product', '{{%product_characteristics}}');
        $this->dropForeignKey('fk-reviews-product', '{{%reviews}}');
        $this->dropForeignKey('fk-reviews-user', '{{%reviews}}');
        $this->dropForeignKey('fk-products-manufacturer', '{{%products}}');
        $this->dropForeignKey('fk-products-category', '{{%products}}');

        // Удаление таблиц в обратном порядке
        $this->dropTable('{{%product_images}}');
        $this->dropTable('{{%product_characteristics}}');
        $this->dropTable('{{%reviews}}');
        $this->dropTable('{{%products}}');
        $this->dropTable('{{%manufacturers}}');
        $this->dropTable('{{%categories}}');
        $this->dropTable('{{%characteristics}}');
    }
}
