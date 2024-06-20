import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PokemonsModule } from './pokemons/pokemons.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { Pokemon } from './pokemons/entities/pokemon.entity';
import { Ability } from './pokemons/entities/ability.entity';
import { Type } from './pokemons/entities/type.entity';
import { Stat } from './pokemons/entities/stat.entity';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: async (configService: ConfigService) => ({
        type: 'postgres',
        url: configService.get<string>('DATABASE_URL'),
        entities: [`${__dirname}/**/*.entity{.js,.ts}`],
      }),
    }),
    TypeOrmModule.forFeature([Pokemon, Ability, Type, Stat]),
    PokemonsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
