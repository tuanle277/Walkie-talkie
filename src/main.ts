import { ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { setupTransactionContext } from './decorators/transaction.decorator';
import { AllExceptionsFilter } from './filters/all-exception.filter';


async function bootstrap() {
  setupTransactionContext()
  const app = await NestFactory.create(AppModule);
  const configService = app.get(ConfigService)
  const port = configService.get<string>('PORT')
  app.enableCors()
  app.useGlobalPipes(new ValidationPipe({ transform: true }))
  app.useGlobalFilters(new AllExceptionsFilter())
  await app.listen(port || 3500);
}
bootstrap();
