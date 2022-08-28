# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.6.5

* Rails version: 6.0.5.1

* rake db:seed로 데이터 생성 부탁드립니다.

* student / tutor 회원이 존재 합니다
* tutor는 수업을 생성할 수 있고
* student는 수업에 자신을 등록할 수 있습니다.
## API 명세서
| prefix             | verb | URI                                                      | Return                    |
|--------------------|------|----------------------------------------------------------|---------------------------|
| student            | GET  | /student(.:format)                                       | http status / @timetables |
|                    | GET  | /student/index(.:format)                                 | http status / @timetables |
|                    | POST | /student/lesson/:lesson_id(.:format)                     | http status / @lesson     |
|                    | GET  | /student/time_tables/:time_table_id/lessons(.:format)    | http status / @lessons    |
|                    | GET  | /student/time_tables/:time_table_id/lessons_20(.:format) | http status / @lessons    |
|                    | GET  | /student/time_tables/:time_table_id/lessons_40(.:format) | http status / @lessons    |
|                    | GET  | /student/lesson_20(.:format)                             | http status / @lessons    |
|                    | GET  | /student/lesson_40(.:format)                             | http status / @lessons    |
| tutor              | GET  | /tutor(.:format)                                         | http status / @timetables |
|                    | GET  | /tutor/:id/lessons(.:format)                             | http status / @timetables |
| lesson             | GET  | /lessons/new/:time_table_id(.:format)                    | http status / @lesson     |
| scaffold  lesson   |      |                                                          |                           |
| scaffold timetable |      |                                                          |                           |
| devise student     |      |                                                          |                           |
| devise tutor       |      |                                                          |                           |