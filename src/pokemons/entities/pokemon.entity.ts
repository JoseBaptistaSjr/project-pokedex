import {
  Column,
  Entity,
  JoinTable,
  OneToMany,
  ManyToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Ability } from './ability.entity';
import { Type } from './type.entity';
import { Stat } from './stat.entity';

@Entity()
export class Pokemon {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  height: number;

  @Column()
  weight: number;

  @Column()
  xp: number;

  @JoinTable()
  @ManyToMany(() => Ability, (abilities) => abilities.pokemons, {
    cascade: true,
  })
  abilities: Ability[];

  @JoinTable()
  @ManyToMany(() => Type, (type) => type.pokemons, {
    cascade: true,
  })
  types: Type[];

  @OneToMany(() => Stat, (stat) => stat.pokemons)
  stats: Stat;
}
