import { ConfigService } from '@nestjs/config';
import { config } from 'dotenv';
import { join } from 'path';
import { DataSource, DataSourceOptions } from 'typeorm';

config();

const configService = new ConfigService();

const entitiesPath = join(__dirname, '../pokemons/entities/*.entity{.js,.ts}');

const dataSourceOptions: DataSourceOptions = {
  type: 'postgres',
  url: configService.get<string>('DATABASE_URL'),
  entities: [entitiesPath],
  migrations: [`${__dirname}/migration/*.ts`],
  migrationsRun: true,
};

export default new DataSource(dataSourceOptions);
