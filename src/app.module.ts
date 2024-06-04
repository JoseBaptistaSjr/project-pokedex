import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PokemonsModule } from './pokemons/pokemons.module';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    PokemonsModule,
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'db' || 'localhost',
      port: 5432,
      username: 'postgres',
      password: 'pokemon',
      database: 'pokedex',
      autoLoadEntities: true,
      synchronize: true,
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
