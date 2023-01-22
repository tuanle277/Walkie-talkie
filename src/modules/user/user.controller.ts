import { Body, Controller, Post } from '@nestjs/common'
import { CurrentUser } from 'src/decorators'
import { UserDto } from '../../dto'
import { UserCreateDto, UserUpdateDto } from './dto'
import { UserService } from './user.service'

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post('create_data')
  public async createData(@Body() data: UserCreateDto) {
    return await this.userService.createData(data)
  }

  @Post('update_data')
  public async updateData(@CurrentUser() user: UserDto, @Body() data: UserUpdateDto) {
    return await this.userService.updateData(user, data)
  }

  @Post('find')
  public async find(@CurrentUser() user: UserDto,  @Body() data : {id?: string} ) {
    return await this.userService.find(user, data)
  }
  
}
