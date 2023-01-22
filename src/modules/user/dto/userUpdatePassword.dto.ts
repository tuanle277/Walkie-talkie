import { IsNotEmpty, IsString, IsEmail } from 'class-validator'

export class UserUpdatePasswordDto {
  @IsNotEmpty()
  @IsString()
  id: string

  @IsString()
  newPassword: string

  @IsString()
  confirmNewPassword: string
}
