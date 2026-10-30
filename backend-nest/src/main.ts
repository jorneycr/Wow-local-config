import 'reflect-metadata';
import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import * as cookieParser from 'cookie-parser';
import helmet from 'helmet';
import { SafeLogger } from './common/logging.service';
import { AppModule } from './app.module';

async function bootstrap(): Promise<void> {
  const app = await NestFactory.create(AppModule, { logger: new SafeLogger() });
  app.use(cookieParser());
  app.use(helmet());
  const allowedOrigins = (process.env.CORS_ORIGINS ?? 'http://127.0.0.1:4000,http://localhost:4000').split(',').map((origin) => origin.trim()).filter(Boolean);
  app.enableCors({ origin: allowedOrigins, credentials: true });
  app.useGlobalPipes(new ValidationPipe({ whitelist: true, forbidNonWhitelisted: true, transform: true }));
  await app.listen(Number(process.env.PORT ?? 9200), '0.0.0.0');
}

void bootstrap();
