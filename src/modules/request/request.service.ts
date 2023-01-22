import  { Request } from '../../entities'
import { RequestCreateDto, RequestUpdateDto } from './dto'
import { UserDto } from '../../dto'
import { RequestRepository, UserRepository } from 'src/repository'
import { Injectable } from '@nestjs/common'

@Injectable()
export class RequestService {
  constructor(
    private readonly requestRepository: RequestRepository,
    private readonly userRepository: UserRepository
  ) {}

  async createData(data : RequestCreateDto) {
    let request = new Request()
    request.address = data.address
    request.userId = data.userId
    const nUser = await this.userRepository.findOne({ where : { id: data.userId }})
    request.nameRequester = nUser.name;

    await this.requestRepository.save(request)
    return { message: "CREATE_SUCCESS" }
  }

  async updateData(user: UserDto, data: RequestUpdateDto) {
    const request = await this.requestRepository.findOne({ where: { id: data.id } })

    if (request.user1 == null) request.user1 = data.name
    else if (request.user2 == null) request.user2 = data.name
    else if (request.user3 == null) request.user3 = data.name
    else if (request.user4 == null) request.user4 = data.name
    

    await this.requestRepository.save(request);

    return { message: "UPDATE_SUCCESS" }
  }
  async find(user, data: { id?: string }) {
    return await this.requestRepository.findBy(data)
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
