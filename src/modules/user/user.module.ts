import { Module } from '@nestjs/common'
import { UserController } from './user.controller'
import { UserService } from './user.service'
import { TypeOrmExModule } from 'src/repository/typeorm-ex.module'
import { UserRepository } from 'src/repository'

@Module({
  imports: [TypeOrmExModule.forCustomRepository([UserRepository])],
  providers: [UserService],
  controllers: [UserController],
})
export class UserModule {}
