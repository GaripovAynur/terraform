terraform init  #Скачает дополнительный файл который будет работать с Амазоном
terraform plan  #Пройдется по всей директории, посмотрит что необходимо создать и это покажет
terraform apply #Создат то что указали в файлах
terraform destroy #Удалить все инсстансы что описано *.tf
terraform show # Показывает развернутом виде применяемых значений.

terraform apply -var-file="testing.tfvars" # Запуск с переменнаит из файла Lesson 13

terraform console
> templatefile("user_data.sh.tpl", { f_name = "Denis", l_name = "Astahov",  names  = ["Vasya", "Kolya", "Petya", "John", "Donald", "Masha"] }) # Для проверки без деплоя, показывает что будет делать данная команда.

##############На каждой сессии необходимо выполнять#########################################
export AWS_ACCESS_KEY_ID = gHDFUImbfd43gb3t59450 #Чтобы *.tf не записывать данные по подключению, можно сделать так
expert AWS_SECRET_ACCESS_KEY = fjdsife98BTYDTydvfhdsregter4 #Чтобы *.tf не записывать данные по подключению, можно сделать так
expert AWS_DEFAULT_REGION = eu-central-1 #Тоже самое


####### SSH #######
resource "aws_key_pair" "alice" {
  key_name   = "alice"
  public_key = file("./keys/ssh/id_rsa.pub")
}

resource "aws_instance" "alice" {
  key_name      = aws_key_pair.alice.key_name
  ami           = "ami-03a71cec707bfc3d7"
  instance_type = "t3.micro"
}
