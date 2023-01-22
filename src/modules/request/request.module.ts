import { Module } from '@nestjs/common'
import { RequestController } from './request.controller'
import { RequestService } from './request.service'
import { TypeOrmExModule } from 'src/repository/typeorm-ex.module'
import { RequestRepository, UserRepository } from 'src/repository'

@Module({
  imports: [TypeOrmExModule.forCustomRepository([RequestRepository, UserRepository])],
  providers: [RequestService],
  controllers: [RequestController],
})
export class RequestModule {}
