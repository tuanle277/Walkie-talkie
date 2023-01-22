import { BaseEntity as Base, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm'

export abstract class BaseEntity extends Base {
  @PrimaryGeneratedColumn('uuid')
  id: string

  @CreateDateColumn()
  createdAt: Date

  @UpdateDateColumn()
  updatedAt: Date

  /** Người sửa cuối, lưu user.id */
  @Column({
    type: 'varchar',
    length: 36,
    nullable: true,
  })
  updatedBy: string

  @Column({
    name: 'isDeleted',
    nullable: false,
    default: false,
  })
  isDeleted: boolean
}
