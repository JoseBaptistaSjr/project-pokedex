import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreatePokemonAbilities1718859742805 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
            CREATE TABLE IF NOT EXISTS public.pokemon_abilities_abilities (
                "pokemonId" INTEGER NOT NULL,
                "abilitiesId" INTEGER NOT NULL,
                CONSTRAINT "PK_001168f224b5568bd64fef12bde" PRIMARY KEY ("pokemonId", "abilitiesId"),
                CONSTRAINT "FK_5e88787f10d14c8eeea650e17ee" FOREIGN KEY ("pokemonId")
                    REFERENCES public.pokemon (id) MATCH SIMPLE
                    ON UPDATE CASCADE
                    ON DELETE CASCADE,
                CONSTRAINT "FK_619160e91e3bd092a91a43402eb" FOREIGN KEY ("abilitiesId")
                    REFERENCES public.abilities (id) MATCH SIMPLE
                    ON UPDATE NO ACTION
                    ON DELETE NO ACTION
            );
        `);

    await queryRunner.query(`
            CREATE INDEX IF NOT EXISTS "IDX_5e88787f10d14c8eeea650e17e"
            ON public.pokemon_abilities_abilities USING btree
            ("pokemonId" ASC NULLS LAST)
            TABLESPACE pg_default;
        `);

    await queryRunner.query(`
            CREATE INDEX IF NOT EXISTS "IDX_619160e91e3bd092a91a43402e"
            ON public.pokemon_abilities_abilities USING btree
            ("abilitiesId" ASC NULLS LAST)
            TABLESPACE pg_default;
        `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `DROP TABLE IF EXISTS public.pokemon_abilities_abilities;`,
    );
  }
}
