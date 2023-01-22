import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common'
import { CurrentUser } from 'src/decorators'
import { UserDto } from '../../dto'
import { RequestCreateDto, RequestUpdateDto } from './dto'
import { RequestService } from './request.service'

@Controller('request')
export class RequestController {
  constructor(private readonly requestService: RequestService) {}

  @Post('create_data')
  public async createData(@Body() data: RequestCreateDto) {
    return await this.requestService.createData(data)
  }

  @Post('update_data')
  public async updateData(@CurrentUser() user: UserDto, @Body() data: RequestUpdateDto) {
    return await this.requestService.updateData(user, data)
  }

  @Post('find')
  public async find(@CurrentUser() user: UserDto,  @Body() data : {id?: string} ) {
    return await this.requestService.find(user, data)
  }
}
