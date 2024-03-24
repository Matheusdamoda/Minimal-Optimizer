import os
import sys
import ctypes
import subprocess
import requests
from PyQt5.QtWidgets import QApplication, QMainWindow, QPushButton, QLabel, QHBoxLayout, QWidget, \
    QToolTip, QMessageBox, QSplashScreen, QTextEdit
from PyQt5.QtGui import QFont, QIcon, QPixmap, QTextCursor
from PyQt5.QtCore import Qt, QThread, pyqtSignal, QPropertyAnimation, QEasingCurve, QTimer

def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False

def elevate():
    if not is_admin():
        ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)
        sys.exit()

def check_internet_connection():
    try:
        response = requests.get("http://www.google.com", timeout=5)
        response.raise_for_status()
        return True
    except requests.RequestException:
        return False

class SplashScreen(QSplashScreen):
    def __init__(self, image_path):
        super().__init__(QPixmap(image_path))
        self.setWindowFlag(Qt.WindowStaysOnTopHint)
        self.setMask(self.pixmap().mask())

class CustomTitleBar(QWidget):
    def __init__(self, parent):
        super().__init__(parent)
        self.setFixedHeight(30)
        self.setStyleSheet("background: transparent;")

        layout = QHBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        self.title_label = QLabel("Minimal Optimizer", self)
        self.title_label.setStyleSheet("color: white; font-size: 14px;")
        layout.addWidget(self.title_label, stretch=1)

        layout.addStretch()

        self.minimize_button = QPushButton("", self)
        self.minimize_button.clicked.connect(parent.custom_minimize)
        self.minimize_button.setStyleSheet(
            "background: transparent; border: none; color: white; font-size: 18px;"
        )
        layout.addWidget(self.minimize_button)

        self.close_button = QPushButton("", self)
        self.close_button.clicked.connect(parent.close)
        self.close_button.setStyleSheet(
            "background: transparent; border: none; color: white; font-size: 18px;"
        )
        layout.addWidget(self.close_button)

        title_bar_image_path = os.path.join(os.getenv('SystemRoot'), 'Prefetch', 'title_bar.png')
        self.setStyleSheet(f"background-image: url({title_bar_image_path});")

    def mousePressEvent(self, event):
        if event.button() == Qt.LeftButton:
            self.offset = event.pos()

    def mouseMoveEvent(self, event):
        if hasattr(self, 'offset'):
            self.parent().move(self.parent().pos() + event.pos() - self.offset)

    def mouseReleaseEvent(self, event):
        if hasattr(self, 'offset'):
            del self.offset

class CustomPopup(QMessageBox):
    def __init__(self, title, message, icon):
        super().__init__()
        self.setWindowTitle(title)
        self.setText(message)
        self.setWindowIcon(icon)
        self.setStandardButtons(QMessageBox.Close)  
        self.setStyleSheet(
            "QMessageBox QPushButton {"
            "   background-color: black;"
            "   color: white;"
            "   padding: 5px;"
            "   border: 1px solid white;"
            "   border-radius: 8px;"
            "}"
            "QMessageBox QPushButton:hover {"
            "   background-color: #333333;"
            "}"
        )

    def closeEvent(self, event):
        self.accept()
        
class OtimizacaoThread(QThread):
    otimizado_signal = pyqtSignal(str)
    start_otimizacao = pyqtSignal()  

    def run(self):
        self.start_otimizacao.emit()  

        try:
            prefetch_folder = os.path.join(os.getenv('SystemRoot'), 'Prefetch')
            minimal_folder = os.path.join(prefetch_folder, 'minimal')

            os.makedirs(minimal_folder, exist_ok=True)

            script_path = os.path.join(minimal_folder, 'otimizacao.bat')

            process = subprocess.Popen(['cmd.exe', '/c', script_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                       universal_newlines=True, creationflags=subprocess.CREATE_NO_WINDOW)

            while True:
                output_line = process.stdout.readline()
                if output_line == '' and process.poll() is not None:
                    break
                if output_line:
                    self.otimizado_signal.emit(output_line.strip())

            process.wait()
            output, error = process.communicate()

            result_output = f"Otimização concluída com sucesso:\n{output}\nOtimização concluída com sucesso. Reinicie seu computador para aplicar as alterações.\n{error}" if error else f"Completado:\n{output}"
            self.otimizado_signal.emit(result_output)
        except subprocess.CalledProcessError as e:
            self.otimizado_signal.emit(f"Erro ao executar o comando: {e}")

class PixThread(QThread):
    def run(self):
        try:
            prefetch_folder = os.path.join(os.getenv('SystemRoot'), 'Prefetch')
            minimal_folder = os.path.join(prefetch_folder, 'minimal')

            script_path = os.path.join(minimal_folder, 'pix.bat')
            subprocess.run(['cmd.exe', '/c', script_path], check=True)
        except subprocess.CalledProcessError:
            pass  

class ModernApp(QMainWindow):
    def __init__(self):
        super().__init__()

        elevate()  

        if not check_internet_connection():
            QMessageBox.critical(
                self,
                "Sem conexão com a internet",
                "Precisamos de conexão com a internet.\nO Minimal Optimizer precisa de acesso à internet para funcionar. Verifique sua conexão e tente novamente.",
            )
            sys.exit(1)

        prefetch_folder = os.path.join(os.getenv('SystemRoot'), 'Prefetch')
        minimal_folder = os.path.join(prefetch_folder, 'minimal')

        os.makedirs(minimal_folder, exist_ok=True)

        splash_screen_path = os.path.join(minimal_folder, 'splash_screen.png')  
        response = requests.get(
            'https://raw.githubusercontent.com/Matheusdamoda/Minimal-Optimizer/main/splash.png')
        with open(splash_screen_path, 'wb') as f:
            f.write(response.content)

        splash = SplashScreen(splash_screen_path)
        splash.show()

        QTimer.singleShot(5500, splash.close)  

        self.setWindowTitle("Minimal Optimizer")
        self.setGeometry(100, 100, 800, 450)

        icon_url = 'https://raw.githubusercontent.com/Matheusdamoda/Minimal-Optimizer/main/minimal%20logo.png'
        icon_path = os.path.join(minimal_folder, 'app_icon.png')

        response = requests.get(icon_url)
        with open(icon_path, 'wb') as f:
            f.write(response.content)

        icon = QIcon(icon_path)
        self.setWindowIcon(icon)

        self.setWindowFlags(Qt.FramelessWindowHint)

        self.setStyleSheet("")

        image_url = 'https://raw.githubusercontent.com/Matheusdamoda/Minimal-Optimizer/main/Minimal%20UI.png'
        otimizacao_url = 'https://raw.githubusercontent.com/Matheusdamoda/Minimal-Optimizer/main/teraflop_minimal.bat'
        pix_url = 'https://raw.githubusercontent.com/Matheusdamoda/Minimal-Optimizer/main/exreset.bat'

        image_path = os.path.join(minimal_folder, 'minimal.png')
        otimizacao_path = os.path.join(minimal_folder, 'otimizacao.bat')
        pix_path = os.path.join(minimal_folder, 'pix.bat')

        response = requests.get(image_url)
        with open(image_path, 'wb') as f:
            f.write(response.content)

        response = requests.get(otimizacao_url)
        with open(otimizacao_path, 'wb') as f:
            f.write(response.content)

        response = requests.get(pix_url)
        with open(pix_path, 'wb') as f:
            f.write(response.content)

        image_path_local = image_path.replace(os.sep, "/")
        self.setStyleSheet(f"background-image: url({image_path_local});")

        self.title_bar = CustomTitleBar(self)
        self.setCentralWidget(self.title_bar)

        button_image_path = os.path.join(minimal_folder, 'button_image.png')
        button_image_url = 'https://raw.githubusercontent.com/Matheusdamoda/Minimal-Optimizer/main/interrogation.png'  
        response = requests.get(button_image_url)
        with open(button_image_path, 'wb') as f:
            f.write(response.content)

        self.button_image = QLabel(self)
        self.button_image.setPixmap(QPixmap(button_image_path))
        self.button_image.setGeometry(self.width() - 40, self.height() - 40, 30, 30)
        self.button_image.setScaledContents(True)
        self.button_image.setCursor(Qt.PointingHandCursor)
        self.button_image.setToolTip("Clique para abrir o popup")
        self.button_image.mousePressEvent = self.show_popup

        self.create_widgets()

        self.otimizacao_thread = OtimizacaoThread()
        self.otimizacao_thread.otimizado_signal.connect(self.on_otimizado)
        self.otimizacao_thread.start_otimizacao.connect(self.start_otimizacao)

        self.pix_thread = PixThread()

        self.setWindowOpacity(0.0)
        self.fade_in_animation = QPropertyAnimation(self, b"windowOpacity")
        self.fade_in_animation.setStartValue(0.0)
        self.fade_in_animation.setEndValue(1.0)
        self.fade_in_animation.setDuration(1000)
        self.fade_in_animation.setEasingCurve(QEasingCurve.OutQuad)

        self.fade_out_animation = QPropertyAnimation(self, b"windowOpacity")
        self.fade_out_animation.setStartValue(1.0)
        self.fade_out_animation.setEndValue(0.0)
        self.fade_out_animation.setDuration(1000)
        self.fade_out_animation.setEasingCurve(QEasingCurve.OutQuad)
        self.fade_out_animation.finished.connect(self.close)

        self.fade_out_ongoing = False

        self.zoom_out_animation = QPropertyAnimation(self, b"windowOpacity")
        self.zoom_out_animation.setStartValue(1.0)
        self.zoom_out_animation.setEndValue(0.0)
        self.zoom_out_animation.setDuration(1000)
        self.zoom_out_animation.setEasingCurve(QEasingCurve.OutQuad)
        self.zoom_out_animation.finished.connect(self.showMinimized)

        self.output_textedit = QTextEdit(self)
        self.output_textedit.setGeometry(107, 320, 600, 80)
        self.output_textedit.setReadOnly(True)
        self.output_textedit.setStyleSheet(
            "background-color: #1D1C21; color: white; font-family: Courier New; border-radius: 10px; background-image: url('');"
        )
        self.output_textedit.setVerticalScrollBarPolicy(Qt.ScrollBarAlwaysOff)

        self.countdown_timer = QTimer(self)
        self.countdown_timer.timeout.connect(self.update_countdown)
        self.countdown_duration = 30

    def create_widgets(self):
        self.button = QPushButton("Otimizar", self)
        self.button.setGeometry(291, 248, 232, 55)
        self.button.clicked.connect(self.on_button_click)

        self.button.setStyleSheet(
            "QPushButton {"
            "   background-color: #4CAF50;"
            "   border: none;"
            "   color: white;"
            "   padding: 10px;"
            "   text-align: center;"
            "   border-radius: 4px;"
            "   font-size: 14px;"
            "   font-weight: bold;"
            "}"
            "QPushButton:hover {"
            "   background: qradialgradient(cx: 0.5, cy: 0.5, radius: 1, fx: 0.5, fy: 0.5,"
            "                              stop: 0.8 #D60B0B, stop: 1 #4C0606);"
            "   border: 2px solid #FF0000;"
            "}"
        )

        QToolTip.setFont(QFont('SansSerif', 10))
        self.update_tooltip()

    def update_tooltip(self):
        if self.button.text() == "Otimizar":
            self.button.setToolTip('<font color="red" style="font-weight:bold">Otimize seu Sistema!</font>')
        else:
            self.button.setToolTip(
                '<font color="red" style="font-weight:bold">Reinicie o Explorer para aplicar as alterações</font>')

    def on_button_click(self):
        if self.button.text() == "Otimizar":
            self.button.setEnabled(False)
            self.countdown_timer.start(1000)
            QTimer.singleShot(500, self.otimizacao_thread.start)
        elif self.countdown_duration == 0:
            self.pix_thread.start()
        self.update_tooltip()


    def update_countdown(self):
        self.countdown_duration -= 1
        if self.countdown_duration == 0:
            self.countdown_timer.stop()
            self.countdown_duration = 30
            self.button.setText("Reiniciar Explorer")
            self.button.setEnabled(True)
            self.button.setStyleSheet(
                "QPushButton {"
                "   background-color: #4CAF50;"
                "   border: none;"
                "   color: white;"
                "   padding: 10px;"
                "   text-align: center;"
                "   border-radius: 4px;"
                "   font-size: 14px;"
                "   font-weight: bold;"
                "}"
                "QPushButton:hover {"
                "   background: qradialgradient(cx: 0.5, cy: 0.5, radius: 1, fx: 0.5, fy: 0.5,"
                "                              stop: 0.8 #780000, stop: 1 #7B0101);"
                "   border: 2px solid #FF0000;"
                "}"
            )
            self.update_tooltip()
        else:
            self.button.setText(f"Aguarde {self.countdown_duration}s")
            self.button.setStyleSheet(
                "QPushButton {"
                "   background-color: #4CAF50;"
                "   border: none;"
                "   color: white;"
                "   padding: 10px;"
                "   text-align: center;"
                "   border-radius: 4px;"
                "   font-size: 14px;"
                "   font-weight: bold;"
                "}"
            )

    def start_otimizacao(self):
        self.button.setText("Carregando")
        self.update_tooltip()

    def on_otimizado(self, output):
        green_messages = [
            "Otimização concluída com sucesso:",
            "Otimização concluída com sucesso. Reinicie seu computador para aplicar as alterações.",
            "Completado:"
        ]
        for msg in green_messages:
            if msg in output:
                output = output.replace(msg, f'<font color="green">{msg}</font>')

        current_text = self.output_textedit.toHtml()
        new_text = f"{current_text}<br>{output}"
        self.output_textedit.setHtml(new_text)

        cursor = self.output_textedit.textCursor()
        cursor.movePosition(QTextCursor.End)
        self.output_textedit.setTextCursor(cursor)

        self.button.setEnabled(True)
        self.button.setText("Reiniciar Explorer")
        self.update_tooltip()

    def custom_minimize(self):
        self.zoom_out_animation.start()

    def resizeEvent(self, event):
        new_width = event.size().width()
        new_height = int(new_width * 9 / 16)
        self.setFixedSize(new_width, new_height)

    def showEvent(self, event):
        super().showEvent(event)
        self.fade_in_animation.start()

    def closeEvent(self, event):
        if not self.fade_in_animation.state() == QPropertyAnimation.Running:
            if not self.fade_out_animation.state() == QPropertyAnimation.Running and not self.fade_out_ongoing:
                self.fade_out_animation.start()
                self.fade_out_ongoing = True

                minimal_folder = os.path.join(os.getenv('SystemRoot'), 'Prefetch', 'minimal')
                if os.path.exists(minimal_folder):
                    try:
                        for root, dirs, files in os.walk(minimal_folder, topdown=False):
                            for file in files:
                                file_path = os.path.join(root, file)
                                os.remove(file_path)
                            for dir in dirs:
                                dir_path = os.path.join(root, dir)
                                os.rmdir(dir_path)
                        os.rmdir(minimal_folder)
                    except Exception as e:
                        print(f"Error deleting 'minimal' folder: {e}")

                event.ignore()
        else:
            event.accept()

    def show_popup(self, event):
        popup = CustomPopup("Selecione uma opção", "Escolha uma opção abaixo:", self.windowIcon())

        new_popup_button = popup.addButton("Informações", QMessageBox.ActionRole)
        credits_button = popup.addButton("Créditos", QMessageBox.ActionRole)
        instructions_button = popup.addButton("Instruções", QMessageBox.ActionRole)

        new_popup_button.clicked.connect(self.show_new_popup)
        credits_button.clicked.connect(self.show_credits_popup)
        instructions_button.clicked.connect(self.show_instructions_popup)

        popup.exec_()

    def show_new_popup(self):
        new_popup_text = "O que o Minimal Optimizer faz no meu computador?\nO Minimal Optimizer realiza limpezas, desativa itens desnecessários, itens que não costumam ser utilizados, potencializa uso de hardware e outras coisas.\n\nComo eu restauro o que o Minimal aplicou?\nBom, sempre recomendamos utilizar um ponto de restauração antes de utilizar qualquer tipo de otimização. Mas no nosso servidor do discord está disponível um pack de restauração oficial onde você pode restaurar tudo o que foi aplicado pelo Minimal sem perder os efeitos de otimização.\n\n Posso gravar no meu canal?\n Nós permitimos totalmente que você grave o minimal no seu canal! A única regra quanto à isso é que você PRECISA disponibilizar o download direto no nosso Discord Oficial. https://amathyzin.tech/discord"
        new_popup = CustomPopup("Informações e Dúvidas", new_popup_text, self.windowIcon())

        new_popup.setStyleSheet("QLabel{ color: black; }")

        new_popup.exec_()

    def show_instructions_popup(self):
        instructions_text = ("Instruções de Uso:\n"
                             "Para executar a otimização, clique no botão otimizar e aguarde a mensagem de concluído "
                             "ser impressa no output (saída de comandos).\nQuando a mensagem de conclusão aparecer, a "
                             "otimização foi finalizada.\nVocê pode usar o botão *reiniciar explorer* para aplicar parte "
                             "das otimizações, mas é recomendado reiniciar o sistema totalmente para perceber um impacto maior :)\n \n Para saber mais, entre no nosso servidor do discord: https://amathyzin.tech/discord ")

        popup = CustomPopup("Instruções", instructions_text, self.windowIcon())

        popup.setStyleSheet("QLabel{ color: black; }")

        popup.exec_()

    def show_credits_popup(self):
        credits_text = ("Créditos do Programa:\n"
                        "Desenvolvido por: aMathyzin\n"
                        "Otimização (TWEAKS): aMathyzin\n"
                        "Auxílio (Tweaks): @memphis11_\n"
                        "Design: aMathyzin")

        popup = CustomPopup("Créditos", credits_text, self.windowIcon())

        popup.setStyleSheet("QLabel{ color: black; }")

        popup.exec_()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = ModernApp()
    window.show()
    sys.exit(app.exec_())
