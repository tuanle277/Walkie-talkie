import { DynamicModule, Provider } from '@nestjs/common'
import { DATA_SOURCE } from 'src/constants'
import { DataSource } from 'typeorm'
import { TYPEORM_EX_CUSTOM_REPOSITORY } from '../decorators'
import { DatabaseModule } from '../modules/database/database.module'

export class TypeOrmExModule {
  public static forCustomRepository<T extends new (...args: any[]) => any>(repositories: T[]): DynamicModule {
    const providers: Provider[] = []

    for (const repository of repositories) {
      const entity = Reflect.getMetadata(TYPEORM_EX_CUSTOM_REPOSITORY, repository)

      if (!entity) {
        continue
      }

      providers.push({
        inject: [DATA_SOURCE],
        provide: repository,
        useFactory: (dataSource: DataSource): typeof repository => {
          const baseRepository = dataSource.getRepository<any>(entity)
          return new repository(baseRepository.target, baseRepository.manager, baseRepository.queryRunner)
        },
      })
    }

    return {
      imports: [DatabaseModule],
      exports: providers,
      module: TypeOrmExModule,
      providers,
    }
  }
}
