import dayjs from 'dayjs'

import 'dayjs/locale/ja'
dayjs.locale('ja')

export default ({app}, inject) => {
  inject('dayjs', ((string) => dayjs(string)))
}

import LocalizedFormat from 'dayjs/plugin/localizedFormat'

dayjs.extend(LocalizedFormat)

dayjs().format('L LT')