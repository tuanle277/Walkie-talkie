import { IsUUID, IsString, IsDate, IsEmail } from 'class-validator'

export class UserDto {
  @IsUUID()
  id: string

  @IsString()
  name: string

  @IsString()
  username: string

  @IsString()
  password: string

  @IsEmail()
  email: string

  @IsString()
  address: string

  @IsString()
  locationId: string

  @IsDate()
  createdAt: Date

  @IsDate()
  updatedAt: Date

}
