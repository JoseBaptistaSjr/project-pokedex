import { Module } from '@nestjs/common';
import { PokemonsController } from './pokemons.controller';
import { PokemonsService } from './pokemons.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Pokemon } from './entities/pokemon.entity';
import { Ability } from './entities/ability.entity';
import { Type } from './entities/type.entity';
import { Stat } from './entities/stat.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Pokemon, Ability, Type, Stat])],
  controllers: [PokemonsController],
  providers: [PokemonsService],
})
export class PokemonsModule {}
