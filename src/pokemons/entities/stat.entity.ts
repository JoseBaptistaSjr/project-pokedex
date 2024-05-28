import { Column, Entity, PrimaryGeneratedColumn, ManyToOne } from 'typeorm';
import { Pokemon } from './pokemon.entity';

@Entity()
export class Stat {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  base_stat: number;

  @ManyToOne(() => Pokemon, (pokemons) => pokemons.stats)
  pokemons: Pokemon;
}
