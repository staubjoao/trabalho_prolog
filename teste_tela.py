import pygui

class Perguntas:
    def __init__(self):
        self.index = 0
        self.perguntas = [
            "Pergunta 1?",
            "Pergunta 2?",
            "Pergunta 3?",
            "Pergunta 4?"
        ]
        self.respostas = []

        self.window = pygui.Window(title="Tela de Perguntas", size=(400, 300))

        self.label_pergunta = pygui.Label(text=self.perguntas[self.index], font_size=20,
                                          alignment="center", size=(400, 100))
        self.label_pergunta.center = (200, 75)
        self.window.add_subview(self.label_pergunta)

        self.botao_sim = pygui.Button(title="Sim", size=(150, 50))
        self.botao_sim.center = (125, 200)
        self.botao_sim.action = self.responder_sim
        self.window.add_subview(self.botao_sim)

        self.botao_nao = pygui.Button(title="Não", size=(150, 50))
        self.botao_nao.center = (275, 200)
        self.botao_nao.action = self.responder_nao
        self.window.add_subview(self.botao_nao)

        self.botao_proxima = pygui.Button(title="Próxima", size=(150, 50))
        self.botao_proxima.center = (125, 250)
        self.botao_proxima.action = self.proxima_pergunta
        self.window.add_subview(self.botao_proxima)

        self.botao_concluir = pygui.Button(title="Concluir", size=(150, 50))
        self.botao_concluir.center = (275, 250)
        self.botao_concluir.action = self.concluir_perguntas
        self.window.add_subview(self.botao_concluir)

        self.window.show()

    def responder_sim(self):
        self.respostas.append(True)

    def responder_nao(self):
        self.respostas.append(False)

    def proxima_pergunta(self):
        if self.index < len(self.perguntas) - 1:
            self.index += 1
            self.label_pergunta.text = self.perguntas[self.index]
            self.botao_sim.selected = False
            self.botao_nao.selected = False
        else:
            pygui.alert("Você já respondeu todas as perguntas!")

    def concluir_perguntas(self):
        if len(self.respostas) != len(self.perguntas):
            pygui.alert(
                "Por favor, responda todas as perguntas antes de concluir.")
            return

        pygui.alert(f"Respostas: {self.respostas}")


Perguntas()
