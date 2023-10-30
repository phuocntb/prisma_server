/*
  Warnings:

  - You are about to drop the column `status` on the `testes` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `testes` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `testes` DROP FOREIGN KEY `FK_TEST`;

-- AlterTable
ALTER TABLE `testes` DROP COLUMN `status`,
    DROP COLUMN `userId`;
