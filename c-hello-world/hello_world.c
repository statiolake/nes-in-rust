#include <conio.h>
#include <string.h>

const char message[] = "Hello cc65!";

int main(void)
{
    unsigned int frame = 0;

    // 画面の消去
    clrscr();

    // 表示位置の変更
    gotoxy((32 - strlen(message)) / 2, 30 / 2);

    // メッセージの表示
    cprintf(message);

    // 処理を終わらせないための無限ループ
    while (1)
    {
        gotoxy(0, 0);
        cprintf("%8d", frame++);
    }

    return 0;
}
