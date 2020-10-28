// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// Ошибка
  internal static let error = Strings.tr("Localizable", "error")

  internal enum Activity {
    internal enum Distance {
      /// Дистанция
      internal static let label = Strings.tr("Localizable", "activity.distance.label")
    }
    internal enum Index {
      /// Индекс подвижности
      internal static let label = Strings.tr("Localizable", "activity.index.label")
    }
    internal enum Points {
      internal enum Caption {
        /// Баллы\nактивности
        internal static let label = Strings.tr("Localizable", "activity.points.caption.label")
      }
    }
    internal enum Sleep {
      /// Сон
      internal static let label = Strings.tr("Localizable", "activity.sleep.label")
    }
    internal enum Steps {
      /// Шаги
      internal static let label = Strings.tr("Localizable", "activity.steps.label")
    }
  }

  internal enum Auth {
    internal enum Login {
      /// Введите email
      internal static let placeholder = Strings.tr("Localizable", "auth.login.placeholder")
      /// FITNECS
      internal static let title = Strings.tr("Localizable", "auth.login.title")
      internal enum Ask {
        internal enum Registration {
          /// Еще не зарегистрированы?
          internal static let title = Strings.tr("Localizable", "auth.login.ask.registration.title")
        }
      }
      internal enum Enter {
        internal enum Button {
          /// Войти
          internal static let title = Strings.tr("Localizable", "auth.login.enter.button.title")
        }
      }
    }
    internal enum Password {
      /// Введите пароль
      internal static let placeholder = Strings.tr("Localizable", "auth.password.placeholder")
      internal enum Confirmation {
        /// Подтверждение пароля
        internal static let placeholder = Strings.tr("Localizable", "auth.password.confirmation.placeholder")
      }
    }
    internal enum Registration {
      /// Регистрация
      internal static let title = Strings.tr("Localizable", "auth.registration.title")
      internal enum Alert {
        /// Вы успешно зарегистрированы в приложении и можете использовать ваши данные для входа
        internal static let text = Strings.tr("Localizable", "auth.registration.alert.text")
        /// Поздравляем!
        internal static let title = Strings.tr("Localizable", "auth.registration.alert.title")
      }
      internal enum Button {
        /// Зарегистрироваться
        internal static let title = Strings.tr("Localizable", "auth.registration.button.title")
      }
    }
  }

  internal enum Common {
    internal enum Appstore {
      /// itms-apps://itunes.apple.com/app/id1477334014
      internal static let link = Strings.tr("Localizable", "common.appstore.link")
    }
    internal enum Button {
      internal enum Apply {
        /// Применить
        internal static let title = Strings.tr("Localizable", "common.button.apply.title")
      }
      internal enum Cancel {
        /// Отмена
        internal static let title = Strings.tr("Localizable", "common.button.cancel.title")
      }
      internal enum Close {
        /// Закрыть
        internal static let title = Strings.tr("Localizable", "common.button.close.title")
      }
      internal enum Connect {
        /// Подключить
        internal static let title = Strings.tr("Localizable", "common.button.connect.title")
      }
      internal enum Disconnect {
        /// Отключить
        internal static let title = Strings.tr("Localizable", "common.button.disconnect.title")
      }
      internal enum Done {
        /// Готово
        internal static let title = Strings.tr("Localizable", "common.button.done.title")
      }
      internal enum Next {
        /// Далее
        internal static let title = Strings.tr("Localizable", "common.button.next.title")
      }
      internal enum Ok {
        /// ОК
        internal static let title = Strings.tr("Localizable", "common.button.ok.title")
      }
      internal enum Remove {
        /// Удалить
        internal static let title = Strings.tr("Localizable", "common.button.remove.title")
      }
      internal enum Retry {
        /// Повторить загрузку
        internal static let title = Strings.tr("Localizable", "common.button.retry.title")
      }
      internal enum Send {
        /// Отправить
        internal static let title = Strings.tr("Localizable", "common.button.send.title")
      }
      internal enum Thanks {
        /// Cпасибо
        internal static let title = Strings.tr("Localizable", "common.button.thanks.title")
      }
      internal enum TryAgain {
        /// Повторить попытку
        internal static let title = Strings.tr("Localizable", "common.button.try-again.title")
      }
      internal enum Welcome {
        /// Пожалуйста
        internal static let title = Strings.tr("Localizable", "common.button.welcome.title")
      }
    }
    internal enum Currency {
      /// ₽
      internal static let symbol = Strings.tr("Localizable", "common.currency.symbol")
    }
    internal enum Demo {
      /// демо
      internal static let text = Strings.tr("Localizable", "common.demo.text")
    }
    internal enum Error {
      /// Что-то пошло не так
      internal static let text = Strings.tr("Localizable", "common.error.text")
      /// Ошибка
      internal static let title = Strings.tr("Localizable", "common.error.title")
      internal enum Alert {
        /// Попробуйте повторить попытку через некоторое время
        internal static let text = Strings.tr("Localizable", "common.error.alert.text")
        /// Что-то пошло не так
        internal static let title = Strings.tr("Localizable", "common.error.alert.title")
      }
      internal enum Button {
        internal enum Retry {
          /// Повторить
          internal static let title = Strings.tr("Localizable", "common.error.button.retry.title")
        }
      }
      internal enum Na {
        /// Недоступно
        internal static let title = Strings.tr("Localizable", "common.error.na.title")
      }
    }
    internal enum Facilityid {
      /// Facilityid
      internal static let text = Strings.tr("Localizable", "common.facilityid.text")
    }
    internal enum Password {
      internal enum Changed {
        /// Пароль изменен
        internal static let text = Strings.tr("Localizable", "common.password.changed.text")
      }
    }
    internal enum Test {
      /// тест
      internal static let text = Strings.tr("Localizable", "common.test.text")
    }
    internal enum Until {
      /// до
      internal static let text = Strings.tr("Localizable", "common.until.text")
    }
    internal enum Version {
      /// Версия %@ %@ от %@ 
      internal static func text(_ p1: Any, _ p2: Any, _ p3: Any) -> String {
        return Strings.tr("Localizable", "common.version.text", String(describing: p1), String(describing: p2), String(describing: p3))
      }
    }
  }

  internal enum Error {
    internal enum Decode {
      internal enum Unable {
        /// Что-то пошло не так. Скоро мы всё исправим.
        internal static let message = Strings.tr("Localizable", "error.decode.unable.message")
      }
    }
    internal enum Mail {
      internal enum Service {
        /// Отправка е-мэйл писем не возможна
        internal static let unavailable = Strings.tr("Localizable", "error.mail.service.unavailable")
        internal enum Save {
          /// Не удалось сохранить черновик письма
          internal static let failed = Strings.tr("Localizable", "error.mail.service.save.failed")
        }
        internal enum Send {
          /// Не удалось отправить письмо
          internal static let failed = Strings.tr("Localizable", "error.mail.service.send.failed")
        }
      }
    }
    internal enum Phone {
      internal enum Call {
        /// Не удалось позвонить по номеру %@
        internal static func unavailable(_ p1: Any) -> String {
          return Strings.tr("Localizable", "error.phone.call.unavailable", String(describing: p1))
        }
      }
    }
    internal enum Unknown {
      /// Unknown error
      internal static let message = Strings.tr("Localizable", "error.unknown.message")
    }
  }

  internal enum Months {
    /// апреля
    internal static let april = Strings.tr("Localizable", "months.april")
    /// августа
    internal static let august = Strings.tr("Localizable", "months.august")
    /// декабря
    internal static let december = Strings.tr("Localizable", "months.december")
    /// февраля
    internal static let february = Strings.tr("Localizable", "months.february")
    /// января
    internal static let january = Strings.tr("Localizable", "months.january")
    /// июля
    internal static let july = Strings.tr("Localizable", "months.july")
    /// июня
    internal static let june = Strings.tr("Localizable", "months.june")
    /// марта
    internal static let march = Strings.tr("Localizable", "months.march")
    /// мая
    internal static let may = Strings.tr("Localizable", "months.may")
    /// ноября
    internal static let november = Strings.tr("Localizable", "months.november")
    /// октября
    internal static let october = Strings.tr("Localizable", "months.october")
    /// сентября
    internal static let september = Strings.tr("Localizable", "months.september")
  }

  internal enum Network {
    internal enum Error {
      internal enum No {
        internal enum Connection {
          /// Подключение отсутствует
          internal static let text = Strings.tr("Localizable", "network.error.no.connection.text")
        }
        internal enum Internet {
          /// Соединение с интернетом отсутствует. Проверьте настройки APN в параметрах передачи данных вашего устройства. Установите значение APN "vtb" и выполните перезагрузку.
          internal static let text = Strings.tr("Localizable", "network.error.no.internet.text")
        }
      }
      internal enum Requet {
        internal enum Timed {
          internal enum Out {
            /// Время ожидания запроса истекло
            internal static let text = Strings.tr("Localizable", "network.error.requet.timed.out.text")
          }
        }
      }
    }
  }

  internal enum Tabs {
    internal enum Achievements {
      /// Достижения
      internal static let title = Strings.tr("Localizable", "tabs.achievements.title")
    }
    internal enum Activity {
      /// Активность
      internal static let title = Strings.tr("Localizable", "tabs.activity.title")
    }
    internal enum Geo {
      /// Геопозиция
      internal static let title = Strings.tr("Localizable", "tabs.geo.title")
    }
    internal enum Profile {
      /// Профиль
      internal static let title = Strings.tr("Localizable", "tabs.profile.title")
    }
    internal enum Statistics {
      /// Статистика
      internal static let title = Strings.tr("Localizable", "tabs.statistics.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
