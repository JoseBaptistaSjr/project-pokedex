import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateTableStats1718859736114 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            CREATE TABLE IF NOT EXISTS public.stat (
                id SERIAL PRIMARY KEY,
                name VARCHAR(255) NOT NULL UNIQUE,
                base_stat INTEGER NOT NULL,
                "pokemonsId" INTEGER,
                CONSTRAINT "FK_4764c2f85db921fcc401fc8dcc1" FOREIGN KEY ("pokemonsId")
                    REFERENCES public.pokemon (id) MATCH SIMPLE
                    ON UPDATE NO ACTION
                    ON DELETE NO ACTION
            );
        `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE IF EXISTS public.stat;`);
  }
}
