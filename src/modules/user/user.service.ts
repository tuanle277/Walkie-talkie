import  { User } from '../../entities'
import { UserCreateDto, UserUpdateDto, UserUpdatePasswordDto } from './dto'
import { UserDto } from '../../dto'
import { UserRepository } from 'src/repository'
import { Injectable } from '@nestjs/common'

@Injectable()
export class UserService {
  constructor(
    private readonly userRepository: UserRepository,
  ) {}

  async createData(data : UserCreateDto) {
    let user = new User()
    user.name = data.name
    user.email = data.email
    user.address = data.address
    user.username = data.username
    user.password = data.password
    await this.userRepository.save(user)

    return { message: "CREATE_SUCCESS" }
  }

  async updateData(user: UserDto, data: UserUpdateDto) {
    const userEnt = await this.userRepository.findOne({ where: { id: data.id } })

    userEnt.name = data.name
    userEnt.email = data.email
    userEnt.address = data.address
    await this.userRepository.save(userEnt)

    return { message: "UPDATE_SUCCESS" }
  }
  async find(user, data: { id?: string }) {
    return await this.userRepository.findBy(data)
  }

  // async updatePassword(user: UserDto, data: EmployeeUpdatePasswordDto) {
  //   if (data.newPassword !== data.confirmNewPassword) throw new Error('New password is not equal to Confirm new password.')

  //   const employee = await this.employeeRepository.findOne({ where: { id: data.id } })
  //   if (!employee) throw new Error(ERROR_NOT_FOUND_DATA)

  //   employee.updatedBy = user.id

  //   const userEntity = await this.userRepository.findOne({ where: { id: employee.userId } })
  //   if (!userEntity) throw new Error(ERROR_NOT_FOUND_DATA)

  //   userEntity.password = data.newPassword
  //   await this.userRepository.save(userEntity)

  //   return {
  //     message: 'Cập nhật mật khẩu thành công!',
  //   }
  // }
}
