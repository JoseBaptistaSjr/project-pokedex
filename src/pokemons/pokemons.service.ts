import { Injectable, NotFoundException } from '@nestjs/common';
import { Pokemon } from './entities/pokemon.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreatePokemonDto } from './dto/create-pokemon.dto/create-pokemon.dto';
import { UpdatePokemonDto } from './dto/update-pokemon.dto/update-pokemon.dto';

@Injectable()
export class PokemonsService {
  constructor(
    @InjectRepository(Pokemon)
    private readonly pokemonRepository: Repository<Pokemon>,
  ) {}

  findAll() {
    return this.pokemonRepository.find({
      relations: ['abilities', 'types', 'stats'],
    });
  }

  async findOne(id: number) {
    const pokemon = await this.pokemonRepository.findOne({
      where: { id },
      relations: ['abilities', 'types', 'stats'],
    });
    if (!pokemon) {
      throw new NotFoundException(`Pokemon #${id} not found`);
    }
    return pokemon;
  }

  create(createPokemoDto: CreatePokemonDto) {
    const pokemon = this.pokemonRepository.create(createPokemoDto);
    return this.pokemonRepository.save(pokemon);
  }

  async update(id: number, updatePokemonDto: UpdatePokemonDto) {
    const pokemon = await this.pokemonRepository.preload({
      id: +id,
      ...updatePokemonDto,
    });
    if (!pokemon) {
      throw new NotFoundException(`Pokemon #${id} not found`);
    }
    return this.pokemonRepository.save(pokemon);
  }

  async remove(id: number) {
    const pokemon = await this.pokemonRepository.findOne({ where: { id } });
    return this.pokemonRepository.remove(pokemon);
  }
}
