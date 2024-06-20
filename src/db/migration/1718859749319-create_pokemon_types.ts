import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreatePokemonTypes1718859749319 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            CREATE TABLE IF NOT EXISTS public.pokemon_types_type (
                "pokemonId" INTEGER NOT NULL,
                "typeId" INTEGER NOT NULL,
                CONSTRAINT "PK_a8afd7b7d3aece1bd6769654151" PRIMARY KEY ("pokemonId", "typeId"),
                CONSTRAINT "FK_788d754ccb53a6313e2e5728ac2" FOREIGN KEY ("pokemonId")
                    REFERENCES public.pokemon (id) MATCH SIMPLE
                    ON UPDATE CASCADE
                    ON DELETE CASCADE,
                CONSTRAINT "FK_d0000de9d0f384f22fd75983bbe" FOREIGN KEY ("typeId")
                    REFERENCES public.type (id) MATCH SIMPLE
                    ON UPDATE NO ACTION
                    ON DELETE NO ACTION
            );
        `);

    await queryRunner.query(`
            CREATE INDEX IF NOT EXISTS "IDX_788d754ccb53a6313e2e5728ac"
            ON public.pokemon_types_type USING btree
            ("pokemonId" ASC NULLS LAST)
            TABLESPACE pg_default;
        `);

    await queryRunner.query(`
            CREATE INDEX IF NOT EXISTS "IDX_d0000de9d0f384f22fd75983bb"
            ON public.pokemon_types_type USING btree
            ("typeId" ASC NULLS LAST)
            TABLESPACE pg_default;
        `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE IF EXISTS public.pokemon_types_type;`);
  }
}
