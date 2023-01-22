import { DATA_SOURCE } from 'src/constants'
import myDefaultDataSource from '../../typeOrm.config'
export const databaseProviders = [
  {
    provide: DATA_SOURCE,
    useFactory: async () => {
      const dataSource = myDefaultDataSource
      return dataSource.initialize()
    },
  },
]
