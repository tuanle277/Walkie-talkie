import { Module } from '@nestjs/common'
import { LocationController } from './location.controller'
import { TypeOrmExModule } from 'src/repository/typeorm-ex.module'
import { LocationRepository } from 'src/repository'
import { LocationService } from './location.service'

@Module({
  imports: [TypeOrmExModule.forCustomRepository([LocationRepository])],
  providers: [LocationService],
  controllers: [LocationController],
})
export class LocationModule {}
