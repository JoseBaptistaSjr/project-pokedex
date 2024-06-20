import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateTablePokemons1718859712091 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            CREATE TABLE IF NOT EXISTS public.pokemon (
                id SERIAL PRIMARY KEY,
                name VARCHAR(255) NOT NULL,
                height INTEGER NOT NULL,
                weight INTEGER NOT NULL,
                xp INTEGER NOT NULL
            );
        `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE IF EXISTS public.pokemon;`);
  }
}
