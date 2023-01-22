import { IsNotEmpty, IsString, IsEmail } from 'class-validator'

export class UserUpdateDto {
  @IsNotEmpty()
  @IsString()
  id: string

  @IsNotEmpty()
  @IsString()
  name: string

  @IsNotEmpty()
  @IsEmail()
  email: string

  @IsNotEmpty()
  @IsString()
  address: string

}
