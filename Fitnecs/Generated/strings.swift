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

  internal enum App {
    internal enum Review {
      /// Не сейчас
      internal static let close = Strings.tr("Localizable", "app.review.close")
      /// Оценить
      internal static let rate = Strings.tr("Localizable", "app.review.rate")
      /// Оцените его в App Store
      internal static let text = Strings.tr("Localizable", "app.review.text")
      /// Вам нравится наше приложение?
      internal static let title = Strings.tr("Localizable", "app.review.title")
    }
  }

  internal enum Auth {
    internal enum ChangePassword {
      /// Изменение пароля
      internal static let title = Strings.tr("Localizable", "auth.change-password.title")
      internal enum Button {
        internal enum Save {
          /// Сохранить
          internal static let title = Strings.tr("Localizable", "auth.change-password.button.save.title")
        }
      }
      internal enum Error {
        internal enum Mismatch {
          /// Пароли не совпадают!
          internal static let title = Strings.tr("Localizable", "auth.change-password.error.mismatch.title")
        }
      }
      internal enum Form {
        internal enum Password {
          /// Придумайте пароль для входа
          internal static let title = Strings.tr("Localizable", "auth.change-password.form.password.title")
        }
        internal enum Repeat {
          /// Повторите пароль
          internal static let title = Strings.tr("Localizable", "auth.change-password.form.repeat.title")
        }
      }
    }
    internal enum Code {
      /// Вxод
      internal static let title = Strings.tr("Localizable", "auth.code.title")
      internal enum Biometrics {
        internal enum Alert {
          internal enum Touchid {
            /// Приложите палец к сканеру
            internal static let text = Strings.tr("Localizable", "auth.code.biometrics.alert.touchid.text")
          }
        }
      }
      internal enum Button {
        internal enum Forgot {
          /// Не помню код
          internal static let title = Strings.tr("Localizable", "auth.code.button.forgot.title")
        }
      }
      internal enum Error {
        internal enum Biometrics {
          /// Ошибка аутентификации
          internal static let title = Strings.tr("Localizable", "auth.code.error.biometrics.title")
          internal enum AppCancel {
            /// Приложение отменило аутентификацию
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.appCancel.text")
          }
          internal enum AuthenticationFailed {
            /// Пользователь не смог предоставить правильные учетные данные
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.authenticationFailed.text")
          }
          internal enum BiometryLockout {
            /// Биометрия заблокирована, потому что было слишком много неудачных попыток
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.biometryLockout.text")
          }
          internal enum BiometryNotAvailable {
            /// Биометрия недоступна на этом устройстве
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.biometryNotAvailable.text")
          }
          internal enum BiometryNotEnrolled {
            /// У пользователя нет зарегистрированных биометрических идентификаторов
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.biometryNotEnrolled.text")
          }
          internal enum InvalidContext {
            /// Контекст ранее был признан недействительным
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.invalidContext.text")
          }
          internal enum NotInteractive {
            /// Отображение необходимого пользовательского интерфейса аутентификации запрещено
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.notInteractive.text")
          }
          internal enum PasscodeNotSet {
            /// Пароль не установлен на устройстве
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.passcodeNotSet.text")
          }
          internal enum SystemCancel {
            /// Система отменила аутентификацию
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.systemCancel.text")
          }
          internal enum Unknown {
            /// Неизвестная ошибка аутентификация. Попробуйте позже.
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.unknown.text")
          }
          internal enum UserCancel {
            /// Пользователь нажал кнопку отмены в диалоге аутентификации
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.userCancel.text")
          }
          internal enum UserFallback {
            /// Пользователь нажал кнопку отката в диалоге аутентификации, но для политики аутентификации отката нет
            internal static let text = Strings.tr("Localizable", "auth.code.error.biometrics.userFallback.text")
          }
        }
      }
    }
    internal enum Common {
      internal enum Button {
        internal enum Next {
          /// Далее
          internal static let title = Strings.tr("Localizable", "auth.common.button.next.title")
        }
      }
      internal enum Checkbox {
        internal enum Password {
          /// Сохранить пароль
          internal static let title = Strings.tr("Localizable", "auth.common.checkbox.password.title")
          internal enum Info {
            /// При последующем входе в приложение не нужно вводить пароль
            internal static let title = Strings.tr("Localizable", "auth.common.checkbox.password.info.title")
          }
        }
      }
    }
    internal enum Confirmation {
      /// Выберите удобный способ подтверждения личности
      internal static let title = Strings.tr("Localizable", "auth.confirmation.title")
      internal enum Button {
        internal enum Code {
          /// 4-значный код
          internal static let title = Strings.tr("Localizable", "auth.confirmation.button.code.title")
        }
        internal enum Confirmation {
          /// Вход без подтверждения
          internal static let title = Strings.tr("Localizable", "auth.confirmation.button.confirmation.title")
        }
        internal enum Password {
          /// Пароль
          internal static let title = Strings.tr("Localizable", "auth.confirmation.button.password.title")
        }
      }
    }
    internal enum CreateCode {
      internal enum Create {
        /// Придумайте 4-х значный код для входа
        internal static let title = Strings.tr("Localizable", "auth.create-code.create.title")
      }
      internal enum Error {
        internal enum Mismatch {
          /// Повторите ввод
          internal static let text = Strings.tr("Localizable", "auth.create-code.error.mismatch.text")
          /// Код не совпадает
          internal static let title = Strings.tr("Localizable", "auth.create-code.error.mismatch.title")
        }
      }
      internal enum Repeat {
        /// Повторите код
        internal static let title = Strings.tr("Localizable", "auth.create-code.repeat.title")
      }
    }
    internal enum Login {
      /// Вход в ВТБ Мобайл
      internal static let title = Strings.tr("Localizable", "auth.login.title")
      internal enum Action {
        internal enum Button {
          /// Войти
          internal static let title = Strings.tr("Localizable", "auth.login.action.button.title")
        }
      }
      internal enum Error {
        /// Неправильный номер или пароль
        internal static let text = Strings.tr("Localizable", "auth.login.error.text")
      }
      internal enum Get {
        internal enum Password {
          internal enum Button {
            /// Получить пароль
            internal static let title = Strings.tr("Localizable", "auth.login.get.password.button.title")
          }
        }
      }
      internal enum Password {
        internal enum Field {
          /// Пароль для входа
          internal static let title = Strings.tr("Localizable", "auth.login.password.field.title")
        }
      }
      internal enum Phone {
        internal enum Field {
          /// Ваш телефон
          internal static let title = Strings.tr("Localizable", "auth.login.phone.field.title")
        }
      }
    }
    internal enum Password {
      /// Введите пароль
      internal static let title = Strings.tr("Localizable", "auth.password.title")
      internal enum Button {
        internal enum Enter {
          /// Войти
          internal static let title = Strings.tr("Localizable", "auth.password.button.enter.title")
        }
        internal enum Forgot {
          /// Не помню пароль
          internal static let title = Strings.tr("Localizable", "auth.password.button.forgot.title")
        }
      }
      internal enum Error {
        internal enum Password {
          /// Пароль введён неправильно
          internal static let title = Strings.tr("Localizable", "auth.password.error.password.title")
        }
      }
      internal enum Form {
        /// Пароль для входа из SMS
        internal static let title = Strings.tr("Localizable", "auth.password.form.title")
      }
    }
    internal enum Phone {
      /// Введите ваш номер\nВТБ Мобайл
      internal static let title = Strings.tr("Localizable", "auth.phone.title")
      internal enum Checkbox {
        internal enum Bank {
          /// Соглашаюсь на отображение 
          internal static let title = Strings.tr("Localizable", "auth.phone.checkbox.bank.title")
          internal enum Button {
            internal enum Link {
              /// банковской информации
              internal static let title = Strings.tr("Localizable", "auth.phone.checkbox.bank.button.link.title")
            }
          }
        }
        internal enum Offer {
          /// Соглашаюсь 
          internal static let title = Strings.tr("Localizable", "auth.phone.checkbox.offer.title")
          internal enum Button {
            internal enum Link {
              /// с офертой
              internal static let title = Strings.tr("Localizable", "auth.phone.checkbox.offer.button.link.title")
            }
          }
        }
      }
      internal enum Form {
        /// Ваш телефон
        internal static let title = Strings.tr("Localizable", "auth.phone.form.title")
      }
      internal enum Warning {
        /// Ваша SIM-карта не активна. Попробуйте активировать ее с главного экрана или пройти регистрацию позже
        internal static let text = Strings.tr("Localizable", "auth.phone.warning.text")
        internal enum Link {
          /// главного экрана
          internal static let text = Strings.tr("Localizable", "auth.phone.warning.link.text")
        }
      }
    }
    internal enum Sms {
      /// Мы отправили вам\nSMS с паролем
      internal static let title = Strings.tr("Localizable", "auth.sms.title")
      internal enum Button {
        internal enum Retry {
          /// Отправить пароль повторно
          internal static let title = Strings.tr("Localizable", "auth.sms.button.retry.title")
          internal enum Seconds {
            /// Повторная отправка через %d сек
            internal static func title(_ p1: Int) -> String {
              return Strings.tr("Localizable", "auth.sms.button.retry.seconds.title", p1)
            }
          }
        }
      }
      internal enum Form {
        /// Пароль для входа
        internal static let title = Strings.tr("Localizable", "auth.sms.form.title")
      }
    }
  }

  internal enum Cancel {
    internal enum Change {
      internal enum Plan {
        /// Отменить переход на новый тариф
        internal static let description = Strings.tr("Localizable", "cancel.change.plan.description")
        /// Передумали?
        internal static let title = Strings.tr("Localizable", "cancel.change.plan.title")
        internal enum Cancel {
          internal enum Button {
            /// нет
            internal static let title = Strings.tr("Localizable", "cancel.change.plan.cancel.button.title")
          }
        }
        internal enum Confirm {
          internal enum Button {
            /// Да, отменить переход
            internal static let title = Strings.tr("Localizable", "cancel.change.plan.confirm.button.title")
          }
        }
      }
    }
  }

  internal enum Change {
    internal enum Plan {
      internal enum Cancel {
        internal enum Button {
          /// Отменить
          internal static let title = Strings.tr("Localizable", "change.plan.cancel.button.title")
        }
      }
      internal enum Confirmation {
        /// Абонентская плата будет списана в полном объеме. Дальнейшие списания абонентской платы будут происходить 1 числа ежемесячно.
        internal static let description = Strings.tr("Localizable", "change.plan.confirmation.description")
        /// ГБ
        internal static let gb = Strings.tr("Localizable", "change.plan.confirmation.gb")
        /// минут
        internal static let minutes = Strings.tr("Localizable", "change.plan.confirmation.minutes")
        /// SMS
        internal static let sms = Strings.tr("Localizable", "change.plan.confirmation.sms")
        /// Перейти на этот тариф?
        internal static let title = Strings.tr("Localizable", "change.plan.confirmation.title")
        internal enum Accept {
          /// Подтверждаю
          internal static let title = Strings.tr("Localizable", "change.plan.confirmation.accept.title")
        }
        internal enum Decline {
          /// Отмена
          internal static let title = Strings.tr("Localizable", "change.plan.confirmation.decline.title")
        }
      }
      internal enum Immediately {
        internal enum Button {
          /// Перейти сейчас
          internal static let title = Strings.tr("Localizable", "change.plan.immediately.button.title")
        }
      }
      internal enum In {
        internal enum Month {
          /// в месяц
          internal static let title = Strings.tr("Localizable", "change.plan.in.month.title")
        }
      }
      internal enum Pending {
        internal enum Request {
          /// У Вас уже есть запланированная смена тарифа. Для перехода на новый тариф необходимо отменить запланированную смену тарифа.
          internal static let alert = Strings.tr("Localizable", "change.plan.pending.request.alert")
        }
      }
      internal enum Total {
        /// итого
        internal static let title = Strings.tr("Localizable", "change.plan.total.title")
      }
    }
  }

  internal enum Chat {
    internal enum Rating {
      /// Оценка оператора
      internal static let title = Strings.tr("Localizable", "chat.rating.title")
      internal enum Comment {
        /// Пожалуйста, оставьте\nсвой комментарий
        internal static let description = Strings.tr("Localizable", "chat.rating.comment.description")
        internal enum Text {
          internal enum View {
            /// Ваше сообщение...
            internal static let placeholder = Strings.tr("Localizable", "chat.rating.comment.text.view.placeholder")
          }
        }
      }
      internal enum Rate {
        /// Пожалуйста, оцените\nкачество обслуживания\nнашего оператора
        internal static let description = Strings.tr("Localizable", "chat.rating.rate.description")
      }
      internal enum Thanks {
        /// Пожалуйста
        internal static let action = Strings.tr("Localizable", "chat.rating.thanks.action")
        /// Спасибо!
        internal static let title = Strings.tr("Localizable", "chat.rating.thanks.title")
      }
    }
    internal enum Textfield {
      internal enum Placeholder {
        /// Ваше сообщение...
        internal static let text = Strings.tr("Localizable", "chat.textfield.placeholder.text")
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

  internal enum Contacts {
    internal enum LeaveFeedback {
      /// Оставить отзыв
      internal static let title = Strings.tr("Localizable", "contacts.leaveFeedback.title")
    }
    internal enum Support {
      /// Круглосуточная поддержка
      internal static let title = Strings.tr("Localizable", "contacts.support.title")
      internal enum Email {
        /// Эл. почта тех. поддержки
        internal static let title = Strings.tr("Localizable", "contacts.support.email.title")
      }
      internal enum Foreign {
        internal enum Clients {
          /// Для звонков из других стран\n(бесплатно)
          internal static let title = Strings.tr("Localizable", "contacts.support.foreign.clients.title")
        }
      }
      internal enum Local {
        internal enum Clients {
          /// Для звонков с любых номеров\nиз России (бесплатно)
          internal static let title = Strings.tr("Localizable", "contacts.support.local.clients.title")
        }
      }
      internal enum Vtb {
        internal enum Clients {
          /// Для клиентов ВТБ Мобайл 
          internal static let title = Strings.tr("Localizable", "contacts.support.vtb.clients.title")
        }
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

  internal enum Faq {
    internal enum Categories {
      /// Вопросы и ответы
      internal static let title = Strings.tr("Localizable", "faq.categories.title")
    }
  }

  internal enum Feedback {
    /// Oтзыв
    internal static let title = Strings.tr("Localizable", "feedback.title")
    internal enum Send {
      internal enum Button {
        /// Отправить
        internal static let title = Strings.tr("Localizable", "feedback.send.button.title")
      }
    }
    internal enum Textview {
      /// Напишите свой отзыв
      internal static let placeholder = Strings.tr("Localizable", "feedback.textview.placeholder")
    }
  }

  internal enum Main {
    internal enum AddPack {
      internal enum AutoRenewal {
        /// Автопродление
        internal static let title = Strings.tr("Localizable", "main.add-pack.auto-renewal.title")
      }
      internal enum Button {
        internal enum Add {
          internal enum Money {
            /// Добавить за %@ ₽
            internal static func title(_ p1: Any) -> String {
              return Strings.tr("Localizable", "main.add-pack.button.add.money.title", String(describing: p1))
            }
          }
          internal enum Points {
            /// Добавить за 100 баллов
            internal static let title = Strings.tr("Localizable", "main.add-pack.button.add.points.title")
          }
        }
      }
      internal enum Confirmation {
        /// Подключить пакет «%@» за %@₽
        internal static func title(_ p1: Any, _ p2: Any) -> String {
          return Strings.tr("Localizable", "main.add-pack.confirmation.title", String(describing: p1), String(describing: p2))
        }
      }
      internal enum Internet {
        /// Добавить интернет
        internal static let title = Strings.tr("Localizable", "main.add-pack.internet.title")
      }
      internal enum Minutes {
        /// Добавить минуты
        internal static let title = Strings.tr("Localizable", "main.add-pack.minutes.title")
      }
    }
    internal enum Cell {
      internal enum Balance {
        internal enum Button {
          internal enum Retry {
            /// Повторить
            internal static let title = Strings.tr("Localizable", "main.cell.balance.button.retry.title")
          }
        }
        internal enum Empty {
          /// Баланс недоступен
          internal static let text = Strings.tr("Localizable", "main.cell.balance.empty.text")
        }
        internal enum Error {
          /// Не удалось загрузить информацию о списании. %@
          internal static func text(_ p1: Any) -> String {
            return Strings.tr("Localizable", "main.cell.balance.error.text", String(describing: p1))
          }
        }
        internal enum Info {
          /// Списание %@ - %@ ₽\nПри выполнении условий - %@ ₽
          internal static func text(_ p1: Any, _ p2: Any, _ p3: Any) -> String {
            return Strings.tr("Localizable", "main.cell.balance.info.text", String(describing: p1), String(describing: p2), String(describing: p3))
          }
          internal enum Short {
            /// Списание %@ - %@ ₽
            internal static func text(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "main.cell.balance.info.short.text", String(describing: p1), String(describing: p2))
            }
          }
        }
        internal enum Tip {
          internal enum Close {
            /// Понятно
            internal static let title = Strings.tr("Localizable", "main.cell.balance.tip.close.title")
          }
        }
      }
      internal enum Bonus {
        internal enum Balance {
          internal enum Info {
            /// Основной баланс - %@ ₽\nБонусный - %@ ₽
            internal static func text(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "main.cell.bonus.balance.info.text", String(describing: p1), String(describing: p2))
            }
          }
        }
      }
      internal enum Chat {
        /// Остались вопросы?
        internal static let title = Strings.tr("Localizable", "main.cell.chat.title")
        internal enum Button {
          internal enum Chat {
            /// Начать чат
            internal static let title = Strings.tr("Localizable", "main.cell.chat.button.chat.title")
          }
        }
      }
      internal enum Item {
        internal enum Contacts {
          /// Контакты
          internal static let text = Strings.tr("Localizable", "main.cell.item.contacts.text")
        }
        internal enum Faq {
          /// Вопросы и ответы
          internal static let text = Strings.tr("Localizable", "main.cell.item.faq.text")
        }
        internal enum History {
          /// История операций
          internal static let text = Strings.tr("Localizable", "main.cell.item.history.text")
        }
        internal enum Map {
          /// Карта покрытия
          internal static let text = Strings.tr("Localizable", "main.cell.item.map.text")
        }
        internal enum Rouming {
          /// Роуминг
          internal static let text = Strings.tr("Localizable", "main.cell.item.rouming.text")
        }
        internal enum Services {
          /// Мои сервисы
          internal static let text = Strings.tr("Localizable", "main.cell.item.services.text")
        }
        internal enum Settings {
          /// Настройки
          internal static let text = Strings.tr("Localizable", "main.cell.item.settings.text")
        }
      }
      internal enum Multibonus {
        /// Пополните баланс телефона бонусами
        internal static let info = Strings.tr("Localizable", "main.cell.multibonus.info")
        internal enum Button {
          /// Пополнить баланс
          internal static let title = Strings.tr("Localizable", "main.cell.multibonus.button.title")
        }
      }
      internal enum Plan {
        internal enum Progress {
          internal enum Data {
            /// %@ из %@ ГБ
            internal static func title(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "main.cell.plan.progress.data.title", String(describing: p1), String(describing: p2))
            }
            internal enum Empty {
              /// 0 ГБ
              internal static let title = Strings.tr("Localizable", "main.cell.plan.progress.data.empty.title")
            }
          }
          internal enum Sms {
            /// %@ из %@ SMS
            internal static func title(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "main.cell.plan.progress.sms.title", String(describing: p1), String(describing: p2))
            }
            internal enum Empty {
              /// 0 SMS
              internal static let title = Strings.tr("Localizable", "main.cell.plan.progress.sms.empty.title")
            }
          }
          internal enum Voice {
            /// %@ из %@ МИН.
            internal static func title(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "main.cell.plan.progress.voice.title", String(describing: p1), String(describing: p2))
            }
            internal enum Empty {
              /// 0 МИН.
              internal static let title = Strings.tr("Localizable", "main.cell.plan.progress.voice.empty.title")
            }
          }
        }
        internal enum Setup {
          /// Настройте тариф
          internal static let text = Strings.tr("Localizable", "main.cell.plan.setup.text")
        }
      }
      internal enum Rate {
        /// Оцените приложение
        internal static let title = Strings.tr("Localizable", "main.cell.rate.title")
      }
      internal enum Services {
        /// Мои услуги
        internal static let title = Strings.tr("Localizable", "main.cell.services.title")
        internal enum Button {
          internal enum Setup {
            /// Настройки услуг
            internal static let title = Strings.tr("Localizable", "main.cell.services.button.setup.title")
          }
        }
        internal enum Info {
          /// Подключено – %d из %d
          internal static func text(_ p1: Int, _ p2: Int) -> String {
            return Strings.tr("Localizable", "main.cell.services.info.text", p1, p2)
          }
        }
      }
    }
  }

  internal enum Map {
    internal enum Button {
      internal enum _2g {
        /// 2G
        internal static let title = Strings.tr("Localizable", "map.button.2g.title")
      }
      internal enum _3g {
        /// 3G
        internal static let title = Strings.tr("Localizable", "map.button.3g.title")
      }
      internal enum _4g {
        /// 4G
        internal static let title = Strings.tr("Localizable", "map.button.4g.title")
      }
    }
    internal enum Warning {
      internal enum Moscow {
        /// В Москве и области не поддерживается
        internal static let text = Strings.tr("Localizable", "map.warning.moscow.text")
      }
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

  internal enum Multicard {
    internal enum Accept {
      internal enum Button {
        /// подключить
        internal static let title = Strings.tr("Localizable", "multicard.accept.button.title")
      }
    }
    internal enum Balance {
      internal enum Date {
        /// Информация от %@
        internal static func text(_ p1: Any) -> String {
          return Strings.tr("Localizable", "multicard.balance.date.text", String(describing: p1))
        }
      }
    }
    internal enum Bank {
      internal enum Info {
        /// Соглашаюсь на отображение\nбанковской информации\nв ВТБ Мобайл
        internal static let description = Strings.tr("Localizable", "multicard.bank.info.description")
        /// Согласие на\nпредоставление\nбанковской информации
        internal static let title = Strings.tr("Localizable", "multicard.bank.info.title")
      }
    }
    internal enum Bar {
      /// %@ ₽
      internal static func value(_ p1: Any) -> String {
        return Strings.tr("Localizable", "multicard.bar.value", String(describing: p1))
      }
    }
    internal enum Info {
      internal enum Achived {
        internal enum With {
          internal enum Base {
            /// Поздравляем! В следующем месяце\nБанк оплатит абонентскую плату\nпо Вашему тарифу
            internal static let plan = Strings.tr("Localizable", "multicard.info.achived.with.base.plan")
          }
        }
        internal enum Without {
          internal enum Base {
            /// Поздравляем! В следующем месяце\nБанк оплатит 200 руб. в счет абонентской\nплаты по Вашему тарифу
            internal static let plan = Strings.tr("Localizable", "multicard.info.achived.without.base.plan")
            internal enum Plan {
              /// Поздравляем!\nВ следующем месяце Банк оплатит\n200 руб. в счет абонентской платы\nпо Вашему тарифу
              internal static let se = Strings.tr("Localizable", "multicard.info.achived.without.base.plan.se")
            }
          }
        }
      }
      internal enum Bank {
        /// Включите отображение информации\nо покупках по Мультикарте ВТБ\nи следите за выполнением условий
        internal static let `required` = Strings.tr("Localizable", "multicard.info.bank.required")
      }
      internal enum Progress {
        internal enum With {
          internal enum Base {
            /// Оплатите покупки на %@ рублей до бесплатной связи в следующем месяце!\n
            internal static func plan(_ p1: Any) -> String {
              return Strings.tr("Localizable", "multicard.info.progress.with.base.plan", String(describing: p1))
            }
            internal enum Plan {
              /// Оплатите покупки на %@ рублей до бесплатной связи в следующем месяце!
              internal static func se(_ p1: Any) -> String {
                return Strings.tr("Localizable", "multicard.info.progress.with.base.plan.se", String(describing: p1))
              }
            }
          }
        }
        internal enum Without {
          internal enum Base {
            /// Оплатите покупки еще на %@ рублей\nи получите вознаграждение\n200 руб. от Банка!
            internal static func plan(_ p1: Any) -> String {
              return Strings.tr("Localizable", "multicard.info.progress.without.base.plan", String(describing: p1))
            }
            internal enum Plan {
              /// Оплатите покупки еще\nна %@ рублей и получите\nвознаграждение 200 руб. от Банка!
              internal static func se(_ p1: Any) -> String {
                return Strings.tr("Localizable", "multicard.info.progress.without.base.plan.se", String(describing: p1))
              }
            }
          }
        }
      }
      internal enum Request {
        internal enum Loyalty {
          /// Получайте бонусную валюту от покупок\nпо Мультикарте ВТБ и оплачивайте\nдо 100%% услуг связи! 
          internal static let plan = Strings.tr("Localizable", "multicard.info.request.loyalty.plan")
          internal enum Plan {
            /// Получайте бонусную валюту\n от покупок по Мультикарте ВТБ\n и оплачивайте до 100%% услуг связи! 
            internal static let se = Strings.tr("Localizable", "multicard.info.request.loyalty.plan.se")
          }
        }
        internal enum With {
          internal enum Base {
            /// Оформите Мультикарту ВТБ\nи получайте услуги связи по тарифу\n«Базовый» бесплатно
            internal static let plan = Strings.tr("Localizable", "multicard.info.request.with.base.plan")
          }
        }
        internal enum Without {
          internal enum Base {
            /// Оформите Мультикарту ВТБ и получайте\nвознаграждение 200 руб. от Банка в счёт\nабонентской платы по Вашему тарифу
            internal static let plan = Strings.tr("Localizable", "multicard.info.request.without.base.plan")
            internal enum Plan {
              /// Оформите Мультикарту ВТБ\nи получайте вознаграждение\n200 руб. от Банка в счёт абонентской\nплаты по Вашему тарифу
              internal static let se = Strings.tr("Localizable", "multicard.info.request.without.base.plan.se")
            }
          }
        }
      }
    }
    internal enum Loyalty {
      /// Бонусы за покупки
      internal static let title = Strings.tr("Localizable", "multicard.loyalty.title")
      internal enum Button {
        /// Оформить мультикарту
        internal static let title = Strings.tr("Localizable", "multicard.loyalty.button.title")
      }
    }
    internal enum Order {
      internal enum Button {
        /// Оформить сейчас
        internal static let title = Strings.tr("Localizable", "multicard.order.button.title")
      }
    }
    internal enum Title {
      internal enum Achived {
        internal enum With {
          internal enum Base {
            /// Бесплатная связь
            internal static let plan = Strings.tr("Localizable", "multicard.title.achived.with.base.plan")
          }
        }
        internal enum Without {
          internal enum Base {
            /// Вознаграждение\nот Банка
            internal static let plan = Strings.tr("Localizable", "multicard.title.achived.without.base.plan")
          }
        }
      }
      internal enum Bank {
        /// Мультикарта ВТБ
        internal static let `required` = Strings.tr("Localizable", "multicard.title.bank.required")
      }
      internal enum Progress {
        internal enum With {
          internal enum Base {
            /// Бесплатная связь
            internal static let plan = Strings.tr("Localizable", "multicard.title.progress.with.base.plan")
          }
        }
        internal enum Without {
          internal enum Base {
            /// Вознаграждение\nот Банка
            internal static let plan = Strings.tr("Localizable", "multicard.title.progress.without.base.plan")
          }
        }
      }
      internal enum Request {
        internal enum With {
          internal enum Base {
            /// Бесплатная связь
            internal static let plan = Strings.tr("Localizable", "multicard.title.request.with.base.plan")
          }
        }
        internal enum Without {
          internal enum Base {
            /// Вознаграждение\nот Банка
            internal static let plan = Strings.tr("Localizable", "multicard.title.request.without.base.plan")
          }
        }
      }
    }
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

  internal enum News {
    internal enum Info {
      internal enum Conditions {
        internal enum Button {
          /// Условия акции
          internal static let title = Strings.tr("Localizable", "news.info.conditions.button.title")
        }
      }
      internal enum Expiration {
        internal enum Date {
          /// Акция действует\nдо %@ года
          internal static func title(_ p1: Any) -> String {
            return Strings.tr("Localizable", "news.info.expiration.date.title", String(describing: p1))
          }
        }
      }
    }
  }

  internal enum Onboarding {
    internal enum Button {
      internal enum Next {
        /// Дальше
        internal static let title = Strings.tr("Localizable", "onboarding.button.next.title")
      }
      internal enum Order {
        /// Где оформить?
        internal static let title = Strings.tr("Localizable", "onboarding.button.order.title")
      }
      internal enum Skip {
        /// Пропустить
        internal static let title = Strings.tr("Localizable", "onboarding.button.skip.title")
      }
      internal enum Yes {
        /// Да
        internal static let title = Strings.tr("Localizable", "onboarding.button.yes.title")
      }
    }
    internal enum Final {
      /// Уже есть наша\nSIM-карта?
      internal static let title = Strings.tr("Localizable", "onboarding.final.title")
    }
    internal enum Last {
      internal enum Button {
        internal enum Connect {
          /// Подключение ESIM
          internal static let title = Strings.tr("Localizable", "onboarding.last.button.connect.title")
        }
        internal enum Download {
          /// Скачать
          internal static let title = Strings.tr("Localizable", "onboarding.last.button.download.title")
        }
        internal enum Order {
          /// Хочу заказать
          internal static let title = Strings.tr("Localizable", "onboarding.last.button.order.title")
        }
        internal enum Sim {
          /// Доставка SIM-карты
          internal static let title = Strings.tr("Localizable", "onboarding.last.button.sim.title")
        }
        internal enum Tomainscreen {
          /// На главный экран
          internal static let title = Strings.tr("Localizable", "onboarding.last.button.tomainscreen.title")
        }
      }
      internal enum Esim {
        /// Что такое eSIM и на каких\nустройствах работает?
        internal static let label = Strings.tr("Localizable", "onboarding.last.esim.label")
      }
      internal enum Map {
        /// или открыть карту офисов продаж
        internal static let label = Strings.tr("Localizable", "onboarding.last.map.label")
      }
    }
    internal enum Slide {
      internal enum First {
        /// * Подробнее на сайте vtb.ru
        internal static let reference = Strings.tr("Localizable", "onboarding.slide.first.reference")
        /// Оплачивайте до 100%% услуг\nвалютой программы Мультибонус
        internal static let text = Strings.tr("Localizable", "onboarding.slide.first.text")
        /// Без дополнительных затрат на связь
        internal static let title = Strings.tr("Localizable", "onboarding.slide.first.title")
      }
      internal enum Fourth {
        /// При переходе\nсо своим номером
        internal static let text = Strings.tr("Localizable", "onboarding.slide.fourth.text")
        /// 1000 рублей на счет
        internal static let title = Strings.tr("Localizable", "onboarding.slide.fourth.title")
      }
      internal enum Second {
        /// Никаких навязанных\nуслуг и скрытых подписок
        internal static let text = Strings.tr("Localizable", "onboarding.slide.second.text")
        /// Нет скрытых подписок
        internal static let title = Strings.tr("Localizable", "onboarding.slide.second.title")
      }
      internal enum Third {
        /// Выбирайте тариф\nи только нужные услуги
        internal static let text = Strings.tr("Localizable", "onboarding.slide.third.text")
        /// Конструктор тарифа
        internal static let title = Strings.tr("Localizable", "onboarding.slide.third.title")
      }
    }
  }

  internal enum Plan {
    internal enum Builder {
      internal enum Add {
        internal enum Multiple {
          internal enum Services {
            /// Подключить безлимитные услуги?
            internal static let title = Strings.tr("Localizable", "plan.builder.add.multiple.services.title")
          }
        }
        internal enum Services {
          /// Подключение:
          internal static let subtitle = Strings.tr("Localizable", "plan.builder.add.services.subtitle")
          internal enum Monthly {
            internal enum Price {
              /// Сумма в месяц за подключенные\nбезлимитные услуги
              internal static let description = Strings.tr("Localizable", "plan.builder.add.services.monthly.price.description")
            }
          }
        }
        internal enum Single {
          internal enum Services {
            /// Подключить?
            internal static let title = Strings.tr("Localizable", "plan.builder.add.single.services.title")
          }
        }
      }
      internal enum Change {
        internal enum Multiple {
          internal enum Services {
            /// Изменить набор безлимитных услуг?
            internal static let title = Strings.tr("Localizable", "plan.builder.change.multiple.services.title")
          }
        }
      }
      internal enum Monthly {
        internal enum Price {
          /// Ежемесячно
          internal static let title = Strings.tr("Localizable", "plan.builder.monthly.price.title")
        }
      }
      internal enum Plan {
        internal enum And {
          internal enum Services {
            /// Безлимитные услуги подключатся\nв течение нескольких минут, а новый\nтариф с %@.
            internal static func description(_ p1: Any) -> String {
              return Strings.tr("Localizable", "plan.builder.plan.and.services.description", String(describing: p1))
            }
            /// Перейти на новую комбинацию?
            internal static let title = Strings.tr("Localizable", "plan.builder.plan.and.services.title")
          }
        }
        internal enum Only {
          /// Новый тариф подключится с %@.
          internal static func description(_ p1: Any) -> String {
            return Strings.tr("Localizable", "plan.builder.plan.only.description", String(describing: p1))
          }
          /// Перейти на этот тариф?
          internal static let title = Strings.tr("Localizable", "plan.builder.plan.only.title")
        }
      }
      internal enum Remove {
        internal enum Multiple {
          internal enum Services {
            /// Отключить безлимитные услуги?
            internal static let title = Strings.tr("Localizable", "plan.builder.remove.multiple.services.title")
          }
        }
        internal enum Services {
          /// Отключение:
          internal static let subtitle = Strings.tr("Localizable", "plan.builder.remove.services.subtitle")
        }
        internal enum Single {
          internal enum Services {
            /// Отключить?
            internal static let title = Strings.tr("Localizable", "plan.builder.remove.single.services.title")
          }
        }
      }
    }
  }

  internal enum Product {
    internal enum Activation {
      /// Подключить?
      internal static let title = Strings.tr("Localizable", "product.activation.title")
      internal enum Accept {
        /// Подтверждаю
        internal static let title = Strings.tr("Localizable", "product.activation.accept.title")
      }
      internal enum Decline {
        /// Отмена
        internal static let title = Strings.tr("Localizable", "product.activation.decline.title")
      }
    }
    internal enum Added {
      internal enum Info {
        /// Дождитесь\nSMS-подтверждения.\nОбычно оно приходит в\nтечение нескольких минут.
        internal static let text = Strings.tr("Localizable", "product.added.info.text")
        /// Пожалуйста
        internal static let title = Strings.tr("Localizable", "product.added.info.title")
      }
    }
  }

  internal enum Promo {
    /// Ваш персональный промокод
    internal static let title = Strings.tr("Localizable", "promo.title")
    internal enum Copied {
      /// Промокод скопирован!
      internal static let title = Strings.tr("Localizable", "promo.copied.title")
    }
    internal enum Share {
      /// Поделись промокодом с другом\nи получай бонусы
      internal static let description = Strings.tr("Localizable", "promo.share.description")
      internal enum Button {
        /// Поделиться промокодом
        internal static let title = Strings.tr("Localizable", "promo.share.button.title")
      }
    }
  }

  internal enum Purchase {
    internal enum History {
      /// История операций
      internal static let title = Strings.tr("Localizable", "purchase.history.title")
      internal enum Details {
        /// Детализация
        internal static let title = Strings.tr("Localizable", "purchase.history.details.title")
        internal enum Email {
          internal enum Field {
            /// E-mail
            internal static let title = Strings.tr("Localizable", "purchase.history.details.email.field.title")
          }
        }
        internal enum Format {
          /// PDF
          internal static let pdf = Strings.tr("Localizable", "purchase.history.details.format.pdf")
          /// Формат
          internal static let title = Strings.tr("Localizable", "purchase.history.details.format.title")
          /// XLS
          internal static let xls = Strings.tr("Localizable", "purchase.history.details.format.xls")
        }
        internal enum Send {
          internal enum Button {
            /// Отправить
            internal static let title = Strings.tr("Localizable", "purchase.history.details.send.button.title")
          }
        }
        internal enum Sent {
          /// Детализация была отправлена на указанный e-mail
          internal static let alert = Strings.tr("Localizable", "purchase.history.details.sent.alert")
        }
      }
      internal enum Empty {
        /// В этом периоде операций не было
        internal static let title = Strings.tr("Localizable", "purchase.history.empty.title")
      }
      internal enum Item {
        internal enum Date {
          internal enum Current {
            internal enum Year {
              /// dd MMMM в HH:mm
              internal static let format = Strings.tr("Localizable", "purchase.history.item.date.current.year.format")
            }
          }
          internal enum Other {
            internal enum Year {
              /// dd MMMM yyyy в HH:mm
              internal static let format = Strings.tr("Localizable", "purchase.history.item.date.other.year.format")
            }
          }
        }
      }
      internal enum Period {
        internal enum Custom {
          /// Период
          internal static let title = Strings.tr("Localizable", "purchase.history.period.custom.title")
        }
        internal enum End {
          internal enum Field {
            /// Конец периода
            internal static let placeholder = Strings.tr("Localizable", "purchase.history.period.end.field.placeholder")
          }
        }
        internal enum From {
          internal enum To {
            /// C %@ по %@
            internal static func title(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "purchase.history.period.from.to.title", String(describing: p1), String(describing: p2))
            }
          }
        }
        internal enum Month {
          /// Месяц
          internal static let title = Strings.tr("Localizable", "purchase.history.period.month.title")
        }
        internal enum Show {
          /// Показать
          internal static let title = Strings.tr("Localizable", "purchase.history.period.show.title")
        }
        internal enum Start {
          internal enum Field {
            /// Начало периода
            internal static let placeholder = Strings.tr("Localizable", "purchase.history.period.start.field.placeholder")
          }
        }
        internal enum Week {
          /// Неделя
          internal static let title = Strings.tr("Localizable", "purchase.history.period.week.title")
        }
      }
      internal enum Summary {
        /// Рублей
        internal static let currency = Strings.tr("Localizable", "purchase.history.summary.currency")
        internal enum Month {
          /// Всего за месяц
          internal static let title = Strings.tr("Localizable", "purchase.history.summary.month.title")
        }
        internal enum Period {
          /// Всего за период
          internal static let title = Strings.tr("Localizable", "purchase.history.summary.period.title")
        }
        internal enum Week {
          /// Всего за неделю
          internal static let title = Strings.tr("Localizable", "purchase.history.summary.week.title")
        }
      }
    }
  }

  internal enum Rate {
    /// Ваш комментарий...
    internal static let placeholder = Strings.tr("Localizable", "rate.placeholder")
    /// что мы могли бы улучшить?
    internal static let subtitle = Strings.tr("Localizable", "rate.subtitle")
    /// Подскажите,
    internal static let title = Strings.tr("Localizable", "rate.title")
    internal enum Actionbutton {
      /// Отправить
      internal static let title = Strings.tr("Localizable", "rate.actionbutton.title")
    }
    internal enum Cancelbutton {
      /// Не сейчас
      internal static let title = Strings.tr("Localizable", "rate.cancelbutton.title")
    }
  }

  internal enum Roaming {
    /// Страны
    internal static let countries = Strings.tr("Localizable", "roaming.countries")
    internal enum Activated {
      /// Подключенные опции
      internal static let options = Strings.tr("Localizable", "roaming.activated.options")
    }
    internal enum Trip {
      internal enum Banner {
        /// Собираетесь в путешествие?\nПроверьте настройки телефона
        internal static let title = Strings.tr("Localizable", "roaming.trip.banner.title")
      }
    }
  }

  internal enum Settings {
    internal enum Account {
      /// Личные данные
      internal static let title = Strings.tr("Localizable", "settings.account.title")
      internal enum Bank {
        internal enum Info {
          /// Банковская информация
          internal static let title = Strings.tr("Localizable", "settings.account.bank.info.title")
          internal enum Empty {
            /// Нет условий отображения банковской информации
            internal static let text = Strings.tr("Localizable", "settings.account.bank.info.empty.text")
          }
        }
      }
      internal enum Cell {
        internal enum Bank {
          /// Соглашаюсь на отображение банковской информации
          internal static let title = Strings.tr("Localizable", "settings.account.cell.bank.title")
          internal enum Link {
            /// банковской информации
            internal static let title = Strings.tr("Localizable", "settings.account.cell.bank.link.title")
          }
        }
        internal enum Phone {
          /// Номер телефона
          internal static let title = Strings.tr("Localizable", "settings.account.cell.phone.title")
          internal enum Button {
            internal enum Change {
              /// Сменить номер
              internal static let title = Strings.tr("Localizable", "settings.account.cell.phone.button.change.title")
            }
          }
          internal enum Error {
            internal enum Empty {
              /// Номер телефона не выбран
              internal static let title = Strings.tr("Localizable", "settings.account.cell.phone.error.empty.title")
            }
          }
        }
      }
      internal enum Change {
        internal enum Password {
          internal enum Button {
            /// Изменить пароль
            internal static let title = Strings.tr("Localizable", "settings.account.change.password.button.title")
          }
        }
      }
      internal enum Email {
        /// Email
        internal static let title = Strings.tr("Localizable", "settings.account.email.title")
        internal enum Changed {
          /// E-mail успешно изменен!
          internal static let alert = Strings.tr("Localizable", "settings.account.email.changed.alert")
        }
        internal enum Field {
          /// Email
          internal static let placeholder = Strings.tr("Localizable", "settings.account.email.field.placeholder")
        }
        internal enum Save {
          internal enum Button {
            /// Сохранить
            internal static let title = Strings.tr("Localizable", "settings.account.email.save.button.title")
          }
        }
      }
      internal enum Login {
        internal enum Method {
          /// Вход без подтверждения
          internal static let title = Strings.tr("Localizable", "settings.account.login.method.title")
        }
      }
      internal enum Logout {
        /// Выход
        internal static let title = Strings.tr("Localizable", "settings.account.logout.title")
      }
      internal enum Notifications {
        /// Настройка уведомлений
        internal static let title = Strings.tr("Localizable", "settings.account.notifications.title")
        internal enum Email {
          /// На EMAIL
          internal static let title = Strings.tr("Localizable", "settings.account.notifications.email.title")
        }
        internal enum Push {
          /// PUSH-уведомления
          internal static let title = Strings.tr("Localizable", "settings.account.notifications.push.title")
        }
        internal enum Sms {
          /// SMS-уведомления
          internal static let title = Strings.tr("Localizable", "settings.account.notifications.sms.title")
        }
      }
      internal enum Password {
        /// Пароль
        internal static let title = Strings.tr("Localizable", "settings.account.password.title")
      }
      internal enum Phone {
        /// Смена номера
        internal static let title = Strings.tr("Localizable", "settings.account.phone.title")
        internal enum Alert {
          internal enum Change {
            internal enum Button {
              /// Сменить номер
              internal static let title = Strings.tr("Localizable", "settings.account.phone.alert.change.button.title")
            }
            internal enum Free {
              /// Сменить текущий номер\nна %@\nбесплатно?
              internal static func title(_ p1: Any) -> String {
                return Strings.tr("Localizable", "settings.account.phone.alert.change.free.title", String(describing: p1))
              }
            }
            internal enum Paid {
              /// Сменить текущий номер\nна %@\nза %@?
              internal static func title(_ p1: Any, _ p2: Any) -> String {
                return Strings.tr("Localizable", "settings.account.phone.alert.change.paid.title", String(describing: p1), String(describing: p2))
              }
            }
          }
          internal enum Changed {
            /// Рекомендуем Вам обратиться в Банк и обновить информацию о доверенном номере.
            internal static let text = Strings.tr("Localizable", "settings.account.phone.alert.changed.text")
            /// Прошлый номер\nтелефона был доверенным\nв Банке?
            internal static let title = Strings.tr("Localizable", "settings.account.phone.alert.changed.title")
          }
        }
        internal enum Cell {
          internal enum Phone {
            internal enum Error {
              internal enum Empty {
                /// Нет номера
                internal static let title = Strings.tr("Localizable", "settings.account.phone.cell.phone.error.empty.title")
              }
            }
          }
          internal enum Price {
            internal enum Free {
              /// Бесплатно
              internal static let title = Strings.tr("Localizable", "settings.account.phone.cell.price.free.title")
            }
            internal enum Paid {
              /// %@ ₽
              internal static func title(_ p1: Any) -> String {
                return Strings.tr("Localizable", "settings.account.phone.cell.price.paid.title", String(describing: p1))
              }
            }
          }
        }
        internal enum Error {
          internal enum Phones {
            internal enum Empty {
              /// Нет номеров
              internal static let title = Strings.tr("Localizable", "settings.account.phone.error.phones.empty.title")
            }
          }
          internal enum Username {
            internal enum Empty {
              /// Не удалось получить ваш номер телефона
              internal static let title = Strings.tr("Localizable", "settings.account.phone.error.username.empty.title")
            }
          }
        }
        internal enum Menu {
          internal enum Cell {
            internal enum Bronze {
              /// Бронзовые
              internal static let title = Strings.tr("Localizable", "settings.account.phone.menu.cell.bronze.title")
            }
            internal enum Free {
              /// Бесплатные
              internal static let title = Strings.tr("Localizable", "settings.account.phone.menu.cell.free.title")
            }
            internal enum Gold {
              /// Золотые
              internal static let title = Strings.tr("Localizable", "settings.account.phone.menu.cell.gold.title")
            }
            internal enum Platinum {
              /// Платиновые
              internal static let title = Strings.tr("Localizable", "settings.account.phone.menu.cell.platinum.title")
            }
            internal enum Silver {
              /// Серебряные
              internal static let title = Strings.tr("Localizable", "settings.account.phone.menu.cell.silver.title")
            }
          }
        }
        internal enum Search {
          internal enum Placeholder {
            /// Поиск по номеру телефона
            internal static let title = Strings.tr("Localizable", "settings.account.phone.search.placeholder.title")
          }
        }
      }
      internal enum Promocode {
        /// Промокод
        internal static let title = Strings.tr("Localizable", "settings.account.promocode.title")
        internal enum Activate {
          internal enum Button {
            /// Активировать
            internal static let title = Strings.tr("Localizable", "settings.account.promocode.activate.button.title")
          }
        }
        internal enum Activated {
          /// Промокод активирован
          internal static let message = Strings.tr("Localizable", "settings.account.promocode.activated.message")
        }
        internal enum Field {
          /// 126WBR554FF
          internal static let placeholder = Strings.tr("Localizable", "settings.account.promocode.field.placeholder")
        }
      }
    }
    internal enum Menu {
      internal enum Account {
        /// Настройки
        internal static let title = Strings.tr("Localizable", "settings.menu.account.title")
      }
      internal enum Plan {
        /// Тариф
        internal static let title = Strings.tr("Localizable", "settings.menu.plan.title")
      }
      internal enum Rouming {
        /// Роуминг
        internal static let title = Strings.tr("Localizable", "settings.menu.rouming.title")
      }
      internal enum Services {
        /// Услуги
        internal static let title = Strings.tr("Localizable", "settings.menu.services.title")
      }
    }
    internal enum Plan {
      internal enum About {
        /// О тарифе
        internal static let title = Strings.tr("Localizable", "settings.plan.about.title")
        internal enum Empty {
          /// Нет описания тарифа
          internal static let title = Strings.tr("Localizable", "settings.plan.about.empty.title")
        }
      }
      internal enum Autorenew {
        /// Готово!
        internal static let title = Strings.tr("Localizable", "settings.plan.autorenew.title")
        internal enum Connect {
          /// Услуга подключится в течение нескольких минут
          internal static let text = Strings.tr("Localizable", "settings.plan.autorenew.connect.text")
          internal enum Confirmation {
            /// Подключить?
            internal static let title = Strings.tr("Localizable", "settings.plan.autorenew.connect.confirmation.title")
          }
        }
        internal enum Disconnect {
          /// Услуга отключится в течение нескольких минут
          internal static let text = Strings.tr("Localizable", "settings.plan.autorenew.disconnect.text")
        }
      }
      internal enum Autorenewal {
        /// Автопродление
        internal static let title = Strings.tr("Localizable", "settings.plan.autorenewal.title")
      }
      internal enum Button {
        internal enum Change {
          /// Применить за %@ ₽ в месяц
          internal static func title(_ p1: Any) -> String {
            return Strings.tr("Localizable", "settings.plan.button.change.title", String(describing: p1))
          }
        }
      }
      internal enum Cell {
        internal enum About {
          internal enum Button {
            /// Подробнее о тарифе
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.about.button.title")
          }
        }
        internal enum Autorenewal {
          /// %@ — %@ ₽
          internal static func title(_ p1: Any, _ p2: Any) -> String {
            return Strings.tr("Localizable", "settings.plan.cell.autorenewal.title", String(describing: p1), String(describing: p2))
          }
        }
        internal enum Expand {
          internal enum Progress {
            /// Выбрать новый тариф
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.expand.progress.title")
          }
        }
        internal enum Included {
          /// Включено
          internal static let title = Strings.tr("Localizable", "settings.plan.cell.included.title")
        }
        internal enum Internet {
          /// Интернет, ГБ
          internal static let title = Strings.tr("Localizable", "settings.plan.cell.internet.title")
        }
        internal enum Minutes {
          /// Минуты
          internal static let title = Strings.tr("Localizable", "settings.plan.cell.minutes.title")
        }
        internal enum Oldrate {
          /// Вы можете продолжать им пользоваться\nи управлять услугами.
          internal static let description = Strings.tr("Localizable", "settings.plan.cell.oldrate.description")
          /// (включая безлимитные услуги)
          internal static let rates = Strings.tr("Localizable", "settings.plan.cell.oldrate.rates")
          /// Мы перенесли Ваш тариф в архив
          internal static let title = Strings.tr("Localizable", "settings.plan.cell.oldrate.title")
        }
        internal enum Plan {
          internal enum Price {
            /// Стоимость в месяц
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.plan.price.title")
          }
        }
        internal enum Service {
          internal enum Geo {
            /// Геосервисы
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.service.geo.title")
          }
          internal enum Messengers {
            /// Мессенджеры
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.service.messengers.title")
          }
          internal enum Music {
            /// Музыка
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.service.music.title")
          }
          internal enum Price {
            /// %@₽/мес.
            internal static func title(_ p1: Any) -> String {
              return Strings.tr("Localizable", "settings.plan.cell.service.price.title", String(describing: p1))
            }
          }
          internal enum Socials {
            /// Социальные сети
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.service.socials.title")
          }
          internal enum Video {
            /// Видео
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.service.video.title")
          }
        }
        internal enum Sms {
          /// SMS
          internal static let title = Strings.tr("Localizable", "settings.plan.cell.sms.title")
        }
        internal enum Title {
          internal enum Autorenewal {
            /// Автопродление
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.title.autorenewal.title")
          }
          internal enum Services {
            /// Для выбора безлимитных услуг вначале выберите опции ГБ и Минут.
            internal static let text = Strings.tr("Localizable", "settings.plan.cell.title.services.text")
            /// Безлимитные услуги
            internal static let title = Strings.tr("Localizable", "settings.plan.cell.title.services.title")
          }
        }
      }
      internal enum Change {
        internal enum Confirmation {
          /// Выбранный тариф стоит %@ ₽ в месяц и включает %@. Применить?
          internal static func title(_ p1: Any, _ p2: Any) -> String {
            return Strings.tr("Localizable", "settings.plan.change.confirmation.title", String(describing: p1), String(describing: p2))
          }
        }
      }
      internal enum Empty {
        /// Отсутствуют продукты для текущего пользователя
        internal static let title = Strings.tr("Localizable", "settings.plan.empty.title")
      }
      internal enum Service {
        internal enum Connect {
          internal enum Confirmation {
            /// Подключить услугу\n%@\nза %@ ₽ в месяц?
            internal static func title(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "settings.plan.service.connect.confirmation.title", String(describing: p1), String(describing: p2))
            }
          }
          internal enum Geo {
            /// безлимитных геосервисов
            internal static let title = Strings.tr("Localizable", "settings.plan.service.connect.geo.title")
          }
          internal enum Messengers {
            /// безлимитных мессенджеров
            internal static let title = Strings.tr("Localizable", "settings.plan.service.connect.messengers.title")
          }
          internal enum Music {
            /// безлимитной музыки
            internal static let title = Strings.tr("Localizable", "settings.plan.service.connect.music.title")
          }
          internal enum Socials {
            /// безлимитных социальных сетей
            internal static let title = Strings.tr("Localizable", "settings.plan.service.connect.socials.title")
          }
          internal enum Video {
            /// безлимитного видео
            internal static let title = Strings.tr("Localizable", "settings.plan.service.connect.video.title")
          }
        }
        internal enum Disconnect {
          internal enum Confirmation {
            /// Отключить?
            internal static let title = Strings.tr("Localizable", "settings.plan.service.disconnect.confirmation.title")
          }
        }
      }
    }
    internal enum Roaming {
      internal enum Countries {
        internal enum Popular {
          /// Популярные направления
          internal static let title = Strings.tr("Localizable", "settings.roaming.countries.popular.title")
        }
        internal enum Search {
          /// Введите страну
          internal static let placeholder = Strings.tr("Localizable", "settings.roaming.countries.search.placeholder")
        }
      }
      internal enum Details {
        internal enum Calls {
          /// Звонки
          internal static let title = Strings.tr("Localizable", "settings.roaming.details.calls.title")
        }
        internal enum Incomming {
          /// Все входящие
          internal static let text = Strings.tr("Localizable", "settings.roaming.details.incomming.text")
        }
        internal enum Internet {
          /// 1 МБ интернет-трафика
          internal static let text = Strings.tr("Localizable", "settings.roaming.details.internet.text")
          /// Интернет
          internal static let title = Strings.tr("Localizable", "settings.roaming.details.internet.title")
          internal enum Calls {
            /// Интернет\nи входящие
            internal static let title = Strings.tr("Localizable", "settings.roaming.details.internet.calls.title")
          }
        }
        internal enum Outcomming {
          internal enum Host {
            /// Исходящие на номера страны пребывания
            internal static let text = Strings.tr("Localizable", "settings.roaming.details.outcomming.host.text")
          }
          internal enum Others {
            /// Исходящие в другие страны 
            internal static let text = Strings.tr("Localizable", "settings.roaming.details.outcomming.others.text")
          }
          internal enum Russia {
            /// Исходящие в Россию
            internal static let text = Strings.tr("Localizable", "settings.roaming.details.outcomming.russia.text")
          }
        }
        internal enum Service {
          internal enum Activate {
            /// Подключить
            internal static let title = Strings.tr("Localizable", "settings.roaming.details.service.activate.title")
          }
        }
        internal enum Sms {
          /// Исходящее сообщение
          internal static let text = Strings.tr("Localizable", "settings.roaming.details.sms.text")
          /// SMS
          internal static let title = Strings.tr("Localizable", "settings.roaming.details.sms.title")
        }
        internal enum Unlim {
          internal enum Messanger {
            /// Безлимитные\nмесcенджеры
            internal static let title = Strings.tr("Localizable", "settings.roaming.details.unlim.messanger.title")
          }
        }
      }
      internal enum Package {
        internal enum Calls {
          internal enum Progress {
            /// %@ из %@ мин.
            internal static func text(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "settings.roaming.package.calls.progress.text", String(describing: p1), String(describing: p2))
            }
          }
        }
        internal enum Income {
          internal enum Calls {
            internal enum Expire {
              /// входящих до %@
              internal static func text(_ p1: Any) -> String {
                return Strings.tr("Localizable", "settings.roaming.package.income.calls.expire.text", String(describing: p1))
              }
            }
          }
        }
        internal enum Internet {
          internal enum Disabled {
            /// %@ ГБ
            internal static func text(_ p1: Any) -> String {
              return Strings.tr("Localizable", "settings.roaming.package.internet.disabled.text", String(describing: p1))
            }
          }
          internal enum Expire {
            /// действителен до %@
            internal static func text(_ p1: Any) -> String {
              return Strings.tr("Localizable", "settings.roaming.package.internet.expire.text", String(describing: p1))
            }
          }
          internal enum Progress {
            /// %@ из %@ ГБ
            internal static func text(_ p1: Any, _ p2: Any) -> String {
              return Strings.tr("Localizable", "settings.roaming.package.internet.progress.text", String(describing: p1), String(describing: p2))
            }
          }
        }
        internal enum Outcome {
          internal enum Calls {
            internal enum Expire {
              /// исходящих в россию до %@
              internal static func text(_ p1: Any) -> String {
                return Strings.tr("Localizable", "settings.roaming.package.outcome.calls.expire.text", String(describing: p1))
              }
            }
          }
        }
      }
    }
    internal enum Services {
      internal enum Addpack {
        internal enum Approve {
          /// Пакет «%@» на %@ дней
          internal static func text(_ p1: Any, _ p2: Any) -> String {
            return Strings.tr("Localizable", "settings.services.addpack.approve.text", String(describing: p1), String(describing: p2))
          }
        }
      }
      internal enum Amount {
        internal enum Left {
          /// Осталось
          internal static let title = Strings.tr("Localizable", "settings.services.amount.left.title")
        }
      }
      internal enum Autorenewals {
        /// Автопродление
        internal static let title = Strings.tr("Localizable", "settings.services.autorenewals.title")
      }
      internal enum Inet {
        internal enum Button {
          /// Добавить интернет
          internal static let title = Strings.tr("Localizable", "settings.services.inet.button.title")
        }
        internal enum Section {
          /// Интернет
          internal static let title = Strings.tr("Localizable", "settings.services.inet.section.title")
        }
      }
      internal enum Minutes {
        internal enum Button {
          /// Добавить минуты
          internal static let title = Strings.tr("Localizable", "settings.services.minutes.button.title")
        }
        internal enum Section {
          /// Минуты
          internal static let title = Strings.tr("Localizable", "settings.services.minutes.section.title")
        }
      }
      internal enum Products {
        /// Дополнительные пакеты
        internal static let title = Strings.tr("Localizable", "settings.services.products.title")
      }
      internal enum Progressbar {
        internal enum Autorenewal {
          /// Автопродление
          internal static let title = Strings.tr("Localizable", "settings.services.progressbar.autorenewal.title")
        }
      }
      internal enum Ussd {
        /// USSD-команды
        internal static let title = Strings.tr("Localizable", "settings.services.ussd.title")
        internal enum Button {
          /// USSD-команды
          internal static let title = Strings.tr("Localizable", "settings.services.ussd.button.title")
        }
        internal enum Off {
          /// ОТКЛ
          internal static let title = Strings.tr("Localizable", "settings.services.ussd.off.title")
        }
        internal enum On {
          /// ВКЛ
          internal static let title = Strings.tr("Localizable", "settings.services.ussd.on.title")
        }
      }
    }
  }

  internal enum Sim {
    internal enum Activate {
      /// За уточнениями обратитесь в техподдержку по телефону 
      internal static let subtitle = Strings.tr("Localizable", "sim.activate.subtitle")
      /// Для подключения eSIM скачайте приложение ВТБ Мобайл Старт
      internal static let title = Strings.tr("Localizable", "sim.activate.title")
      internal enum Fail {
        /// Похоже, ваше устройство не поддерживает eSIM
        internal static let title = Strings.tr("Localizable", "sim.activate.fail.title")
      }
    }
    internal enum Address {
      internal enum Done {
        internal enum Button {
          /// Готово
          internal static let title = Strings.tr("Localizable", "sim.address.done.button.title")
        }
      }
      internal enum Search {
        /// Адрес доставки
        internal static let title = Strings.tr("Localizable", "sim.address.search.title")
      }
    }
    internal enum Connectesim {
      internal enum Button {
        /// Все равно подключить
        internal static let title = Strings.tr("Localizable", "sim.connectesim.button.title")
      }
    }
    internal enum Contactinfo {
      /// Заполните контактную информацию
      internal static let title = Strings.tr("Localizable", "sim.contactinfo.title")
      internal enum Agreement {
        /// обработку персональных данных
        internal static let hypertext = Strings.tr("Localizable", "sim.contactinfo.agreement.hypertext")
        /// Даю согласие на обработку персональных данных
        internal static let label = Strings.tr("Localizable", "sim.contactinfo.agreement.label")
      }
      internal enum Middlename {
        /// Отчество
        internal static let label = Strings.tr("Localizable", "sim.contactinfo.middlename.label")
      }
      internal enum Name {
        /// Имя
        internal static let label = Strings.tr("Localizable", "sim.contactinfo.name.label")
      }
      internal enum Phone {
        /// Контактный телефон
        internal static let label = Strings.tr("Localizable", "sim.contactinfo.phone.label")
      }
      internal enum Region {
        /// Ваш регион
        internal static let label = Strings.tr("Localizable", "sim.contactinfo.region.label")
      }
      internal enum Simnum {
        internal enum Title {
          /// Количество Sim-карт
          internal static let label = Strings.tr("Localizable", "sim.contactinfo.simnum.title.label")
        }
      }
      internal enum Surname {
        /// Фамилия
        internal static let label = Strings.tr("Localizable", "sim.contactinfo.surname.label")
      }
    }
    internal enum Delivery {
      internal enum Address {
        /// Адрес доставки
        internal static let label = Strings.tr("Localizable", "sim.delivery.address.label")
      }
      internal enum Comment {
        /// Комментарий
        internal static let label = Strings.tr("Localizable", "sim.delivery.comment.label")
      }
      internal enum Commit {
        internal enum Button {
          /// Подтвердить заказ
          internal static let title = Strings.tr("Localizable", "sim.delivery.commit.button.title")
        }
      }
      internal enum Promocode {
        /// Промокод
        internal static let label = Strings.tr("Localizable", "sim.delivery.promocode.label")
      }
      internal enum Title {
        /// Укажите сведения о доставке
        internal static let label = Strings.tr("Localizable", "sim.delivery.title.label")
      }
    }
    internal enum Download {
      internal enum Button {
        /// Скачать
        internal static let title = Strings.tr("Localizable", "sim.download.button.title")
      }
    }
    internal enum Order {
      internal enum Success {
        /// Заказ %@ успешно оформлен
        internal static func title(_ p1: Any) -> String {
          return Strings.tr("Localizable", "sim.order.success.title", String(describing: p1))
        }
        internal enum Agreement {
          /// инструкцию по активации SIM-карты
          internal static let hypertext = Strings.tr("Localizable", "sim.order.success.agreement.hypertext")
          /// Посмотрите инструкцию по активации SIM-карты
          internal static let label = Strings.tr("Localizable", "sim.order.success.agreement.label")
        }
        internal enum Description {
          /// Для активации SIM-карты скачайте приложение ВТБ Мобайл Старт
          internal static let title = Strings.tr("Localizable", "sim.order.success.description.title")
        }
      }
    }
    internal enum Waitsms {
      /// Мы отправили код в SMS на номер
      internal static let title = Strings.tr("Localizable", "sim.waitsms.title")
      internal enum Correct {
        internal enum Code {
          /// Код из SMS
          internal static let title = Strings.tr("Localizable", "sim.waitsms.correct.code.title")
        }
      }
      internal enum Error {
        internal enum Wrong {
          internal enum Code {
            /// Код подтверждения операции указан неверно
            internal static let title = Strings.tr("Localizable", "sim.waitsms.error.wrong.code.title")
            internal enum Show {
              /// Вы ввели неверный код
              internal static let title = Strings.tr("Localizable", "sim.waitsms.error.wrong.code.show.title")
            }
          }
        }
      }
      internal enum Old {
        internal enum Code {
          /// Код устарел!
          internal static let title = Strings.tr("Localizable", "sim.waitsms.old.code.title")
        }
      }
      internal enum Send {
        internal enum Again {
          internal enum Code {
            /// Отправить код повторно
            internal static let title = Strings.tr("Localizable", "sim.waitsms.send.again.code.title")
          }
        }
      }
      internal enum Wait {
        internal enum Time {
          internal enum Interval {
            /// Повторная отправка через %@ сек
            internal static func title(_ p1: Any) -> String {
              return Strings.tr("Localizable", "sim.waitsms.wait.time.interval.title", String(describing: p1))
            }
          }
        }
      }
      internal enum Wrong {
        internal enum Code {
          /// Неверный код
          internal static let title = Strings.tr("Localizable", "sim.waitsms.wrong.code.title")
        }
      }
    }
  }

  internal enum TopUp {
    /// Пополнить баланс
    internal static let title = Strings.tr("Localizable", "topUp.title")
    internal enum Amount {
      internal enum Field {
        /// Сумма от 100 до 15 000 
        internal static let placeholder = Strings.tr("Localizable", "topUp.amount.field.placeholder")
        /// Сумма
        internal static let title = Strings.tr("Localizable", "topUp.amount.field.title")
        internal enum Entity {
          /// бонусов
          internal static let bonuses = Strings.tr("Localizable", "topUp.amount.field.entity.bonuses")
          /// ₽
          internal static let rubles = Strings.tr("Localizable", "topUp.amount.field.entity.rubles")
        }
        internal enum Error {
          /// Только суммы от 100 до 15 000 ₽
          internal static let title = Strings.tr("Localizable", "topUp.amount.field.error.title")
        }
      }
      internal enum Multibonus {
        internal enum Field {
          /// Сумма от 300 до 15 000 
          internal static let placeholder = Strings.tr("Localizable", "topUp.amount.multibonus.field.placeholder")
          internal enum Error {
            /// Только суммы от 300 до 15 000 бонусов
            internal static let title = Strings.tr("Localizable", "topUp.amount.multibonus.field.error.title")
          }
        }
      }
    }
    internal enum BankCard {
      internal enum Autopayment {
        /// Автоплатёж
        internal static let title = Strings.tr("Localizable", "topUp.bankCard.autopayment.title")
        internal enum Enabled {
          /// Подключен автоплатёж
          internal static let status = Strings.tr("Localizable", "topUp.bankCard.autopayment.enabled.status")
        }
      }
      internal enum Name {
        /// Название
        internal static let placeholder = Strings.tr("Localizable", "topUp.bankCard.name.placeholder")
      }
      internal enum Remove {
        internal enum Confirmation {
          /// Вы действительно хотите удалить банковскую карту?
          internal static let title = Strings.tr("Localizable", "topUp.bankCard.remove.confirmation.title")
        }
      }
    }
    internal enum Min {
      internal enum Max {
        /// От 100 до 15 000 
        internal static let description = Strings.tr("Localizable", "topUp.min.max.description")
        internal enum Multibonus {
          /// От 300 до 15 000 
          internal static let description = Strings.tr("Localizable", "topUp.min.max.multibonus.description")
        }
      }
    }
    internal enum NewCard {
      /// Новая карта
      internal static let title = Strings.tr("Localizable", "topUp.newCard.title")
      internal enum Activate {
        internal enum Autopayment {
          /// Подключить автоплатеж
          internal static let title = Strings.tr("Localizable", "topUp.newCard.activate.autopayment.title")
        }
      }
      internal enum Autopayment {
        internal enum Next {
          /// Следующее списание %@
          internal static func title(_ p1: Any) -> String {
            return Strings.tr("Localizable", "topUp.newCard.autopayment.next.title", String(describing: p1))
          }
        }
      }
      internal enum Button {
        /// Новая карта
        internal static let title = Strings.tr("Localizable", "topUp.newCard.button.title")
      }
      internal enum Cvv {
        /// CVV
        internal static let placeholder = Strings.tr("Localizable", "topUp.newCard.cvv.placeholder")
      }
      internal enum Expiration {
        /// мес/год
        internal static let placeholder = Strings.tr("Localizable", "topUp.newCard.expiration.placeholder")
      }
      internal enum Name {
        /// Название
        internal static let placeholder = Strings.tr("Localizable", "topUp.newCard.name.placeholder")
      }
      internal enum Number {
        /// Номер
        internal static let placeholder = Strings.tr("Localizable", "topUp.newCard.number.placeholder")
      }
      internal enum Save {
        /// Сохранить карту
        internal static let title = Strings.tr("Localizable", "topUp.newCard.save.title")
      }
    }
    internal enum Pay {
      internal enum Button {
        /// Оплатить
        internal static let title = Strings.tr("Localizable", "topUp.pay.button.title")
      }
    }
    internal enum Payment {
      internal enum Failed {
        /// Попробуйте ещё раз
        internal static let description = Strings.tr("Localizable", "topUp.payment.failed.description")
        /// Что-то\nпошло не так
        internal static let title = Strings.tr("Localizable", "topUp.payment.failed.title")
      }
      internal enum Result {
        /// Платеж\nсовершен
        internal static let title = Strings.tr("Localizable", "topUp.payment.result.title")
        internal enum Amout {
          /// Сумма платежа
          internal static let title = Strings.tr("Localizable", "topUp.payment.result.amout.title")
        }
        internal enum Date {
          /// Дата
          internal static let title = Strings.tr("Localizable", "topUp.payment.result.date.title")
        }
      }
    }
    internal enum PaymentSwitch {
      internal enum MoneyButton {
        /// Рубли
        internal static let title = Strings.tr("Localizable", "topUp.paymentSwitch.moneyButton.title")
      }
      internal enum MultibonusButton {
        /// Мультибонус
        internal static let title = Strings.tr("Localizable", "topUp.paymentSwitch.multibonusButton.title")
      }
    }
    internal enum Phone {
      internal enum Field {
        /// +7
        internal static let placeholder = Strings.tr("Localizable", "topUp.phone.field.placeholder")
        /// Номер телефона
        internal static let title = Strings.tr("Localizable", "topUp.phone.field.title")
        internal enum Error {
          /// Только для Абонентов ВТБ Мобайл
          internal static let title = Strings.tr("Localizable", "topUp.phone.field.error.title")
        }
      }
    }
    internal enum Popup {
      internal enum Success {
        /// Баланс изменится в течение нескольких минут
        internal static let text = Strings.tr("Localizable", "topUp.popup.success.text")
        /// Заявка оформлена
        internal static let title = Strings.tr("Localizable", "topUp.popup.success.title")
      }
    }
    internal enum Refill {
      internal enum Button {
        /// Пополнить баланс
        internal static let title = Strings.tr("Localizable", "topUp.refill.button.title")
      }
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
