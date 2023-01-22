import { createParamDecorator, ExecutionContext } from '@nestjs/common'
import { plainToClass } from 'class-transformer'
import { UserDto } from '../dto'

export const CurrentUser = createParamDecorator((data: string, ctx: ExecutionContext) => {
  const request = ctx.switchToHttp().getRequest()
  const user = plainToClass(UserDto, request.user)
  return data ? user?.[data] : user
})
