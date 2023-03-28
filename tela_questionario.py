import tkinter as tk


respostas = []


class Pergunta:
    def __init__(self, master, pergunta):
        self.master = master
        self.pergunta = pergunta
        self.resposta = tk.BooleanVar()

        self.frame = tk.Frame(self.master, relief='groove', bd=2)
        self.frame.pack(padx=10, pady=100, fill='x')

        self.label = tk.Label(self.frame, text=self.pergunta)
        self.label.pack(side='left', padx=10)

        self.radio_sim = tk.Radiobutton(
            self.frame, text='Sim', variable=self.resposta, value=True)
        self.radio_sim.pack(side='left')

        self.radio_nao = tk.Radiobutton(
            self.frame, text='Não', variable=self.resposta, value=False)
        self.radio_nao.pack(side='left')

        self.button_proxima = tk.Button(
            self.frame, text='Próxima pergunta', command=self.proxima_pergunta)
        self.button_proxima.pack(side='right', padx=10)

    def proxima_pergunta(self):
        self.frame.destroy()
        respostas.append(self.resposta.get())
        proxima_pergunta()

    def get_resposta(self):
        return self.resposta.get()


def concluir():
    print(respostas)


def proxima_pergunta():
    global indice_pergunta
    if indice_pergunta < len(perguntas):
        pergunta = perguntas[indice_pergunta]
        indice_pergunta += 1
        Pergunta(root, pergunta)
    else:
        button_concluir.pack()


root = tk.Tk()
root.title("Questionário")
root.geometry("900x300")
largura_tela = root.winfo_screenwidth()
altura_tela = root.winfo_screenheight()

perguntas = ["Você tem dor na área do abdômen?", "Você notou inchaço ou aumento do tamanho da sua barriga?", "Você está tendo fezes soltas e frequentes?", "Você está tendo dificuldade para evacuar ou suas fezes estão duras e secas?", "Você sente enjoo ou tem vontade de vomitar?", "Você está vomitando ou teve vontade de vomitar recentemente?", "Você perdeu peso sem tentar?", "Você se sente cansado ou sem energia?", "Você foi diagnosticado com anemia recentemente?", "Você tem dores nas suas articulações?", "Você notou manchas ou erupções na sua pele?", "Você está facilmente irritado ou com mau humor?", "Você notou muco ou secreção nas suas fezes?", "Você sente que o seu intestino não está vazio mesmo após evacuar?", "Você tem sentido ansiedade?", "Você tem sentido tristeza, desânimo ou falta de interesse em atividades que antes lhe agradavam?", "Você sente coceira na boca ou garganta?", "Você sente coceira na garganta?", "Você tem ido ao banheiro para urinar com mais frequência do que o normal?", "Você está tendo dificuldade para respirar?", "Você notou vermelhidão na sua pele?", "Você está com inchaço na sua face ou pescoço?",
             "Você tem tido febre?", "Você tem sentido fraqueza geral no corpo?", "Você tem sentido dores de cabeça?", "Você tem sentido um mal-estar geral no corpo?", "Você tem sentido dores musculares?", "Você tem suado excessivamente?", "Você tem sentido batimentos cardíacos acelerados ou irregulares?", "Você tem sentido tontura ou vertigem?", "Você já desmaiou ou perdeu a consciência recentemente?", "Você sente uma sensação de queimação no estômago ou no peito após comer?", "Você sente que fica satisfeito após comer quantidades menores de comida do que o normal?", "Você sente desconforto ou sensação de inchaço na região abdominal após comer?", "Você sente uma sensação de queimação na região abdominal ou na garganta?", "Você tem tido menos apetite do que o normal?", "Você foi diagnosticado com pancreatite crônica recentemente?", "Você foi diagnosticado com diabetes recentemente?", "Você sente dor ou desconforto ao urinar?", "Você tem ido ao banheiro para urinar com mais frequência do que o normal?", "Você tem sentido vontade urgente de urinar e às vezes não consegue segurar?", "Você notou sangue na sua urina?"]
indice_pergunta = 0

Pergunta(root, perguntas[indice_pergunta])

button_concluir = tk.Button(root, text='Concluir', command=concluir)

root.mainloop()
