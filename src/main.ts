import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Configuración de Swagger
  const config = new DocumentBuilder()
    .setTitle('Inventify API')
    .setDescription('The API documentation for the Inventify system.')
    .setVersion('1.0')
    .addTag('inventify')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document); // Esto crea la ruta /api

  await app.listen(3000);
}
bootstrap().catch((error) => {
  console.error('Error during bootstrap:', error);
});
