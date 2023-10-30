-- AlterTable
ALTER TABLE `posts` MODIFY `title` CHAR(255) NOT NULL;

-- CreateTable
CREATE TABLE `testes` (
    `id` VARCHAR(191) NOT NULL,
    `title` CHAR(1) NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT false,
    `userId` INTEGER NOT NULL,

    INDEX `FK_TEST`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `carts` (
    `id` VARCHAR(191) NOT NULL,
    `test` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `testes` ADD CONSTRAINT `FK_TEST` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
