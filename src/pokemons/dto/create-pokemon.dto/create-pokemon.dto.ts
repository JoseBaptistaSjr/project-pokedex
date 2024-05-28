import { IsNumber, IsString } from 'class-validator';

export class CreatePokemonDto {
  @IsString()
  readonly name: string;

  @IsNumber()
  readonly xp: number;

  @IsString({ each: true })
  readonly type: string[];
}
